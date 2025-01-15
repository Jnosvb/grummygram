import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:grummygram/controllers/activitycontroller.dart';
import 'package:intl/intl.dart';
import 'package:grummygram/Models/Activitymodel.dart';

class ActivityWidget extends StatefulWidget {
  const ActivityWidget({super.key});

  @override
  State<ActivityWidget> createState() => _ActivityWidgetState();
}

class _ActivityWidgetState extends State<ActivityWidget> {
  final ActivityController _activityController = Get.put(ActivityController());

  @override
  void initState() {
    super.initState();
    _activityController.getLogsUser();
  }

  Future<void> _refreshActivity() async {
    await _activityController.getLogsUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshActivity,
          child: Obx(() {
            // if (_activityController.isLoading.value) {
            //   return const Center(child: CircularProgressIndicator());
            // }

            final posts = _activityController.posts;
            final groupedPosts = _groupPostsByDate(posts);

            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: _buildHeader(), // Header selalu ditampilkan
                ),
                if (posts.isEmpty) ...[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Text(
                        "Tidak ada Aktivitas",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ] else ...[
                  for (var entry in groupedPosts.entries)
                    _buildActivityList(entry.key, entry.value),
                ],
              ],
            );
          }),
        ),
      ),
    );
  }

  Map<String, List> _groupPostsByDate(List posts) {
    final Map<String, List> groupedPosts = {};
    for (var post in posts) {
      final createdAt =
          post.activity?.createdAt?.toLocal() ?? DateTime.now().toLocal();
      final formattedDate = DateFormat.yMMMMd().format(createdAt);

      if (groupedPosts.containsKey(formattedDate)) {
        groupedPosts[formattedDate]!.add(post);
      } else {
        groupedPosts[formattedDate] = [post];
      }
    }
    return groupedPosts;
  }

  Widget _buildActivityList(String date, List activities) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: GoogleFonts.outfit(
              color: const Color(0xFF57636C),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Column(
            children: activities.map((activity) {
              final activityDetail = activity.activity;
              final title = activityDetail?.title ?? 'Tidak ada judul';
              final changes =
                  activityDetail?.changes as Map<String, dynamic>? ?? {};
              return _buildActivityItem(title, changes);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String title, Map<String, dynamic> changes) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildActivityIndicator(),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: _buildActivityCard(title, changes),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityCard(String title, Map<String, dynamic> changes) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.grey[100],
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                color: const Color(0xFF14181B),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                print('Hapus aktivitas: $title');
              },
              tooltip: 'Hapus',
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...changes.entries.map((entry) {
          final key = entry.key;
          final value = entry.value;
          if (value is Map<String, dynamic> &&
              value.containsKey('before') &&
              value.containsKey('after')) {
            final detail = ChangeDetail(
              before: value['before'] as String?,
              after: value['after'] as String?,
            );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$key:',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF14181B),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Sebelum: ${detail.before ?? "-"}',
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF14181B), fontSize: 12),
                ),
                Text(
                  'Sesudah: ${detail.after ?? "-"}',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF14181B),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            );
          } else if (value is String) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$key:',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF14181B),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF14181B),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            );
          } else {
            return Container();
          }
        }).toList(),
      ],
    ),
  );
}


  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Aktivitas',
          style: GoogleFonts.outfit(
            color: const Color(0xFF15161E),
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Lihat setiap langkah dan perubahan yang terjadi dalam kegiatan Anda.',
          style: GoogleFonts.outfit(
            color: const Color(0xFF606A85),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildActivityIndicator() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 8,
          backgroundColor: Color(0xFFE0E3E7),
        ),
        const SizedBox(height: 8),
        Container(
          width: 2,
          height: 80,
          color: const Color(0xFFE0E3E7),
        ),
      ],
    );
  }
}
