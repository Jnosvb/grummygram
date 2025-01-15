import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grummygram/Screens/Catatan/add_catatan_screen.dart';
import 'package:grummygram/Screens/Catatan/edit_detail_catatan_screen.dart';
import 'package:grummygram/controllers/catatan_controller.dart';
import 'package:intl/intl.dart';

class CatatankuWidget extends StatefulWidget {
  const CatatankuWidget({super.key});

  @override
  State<CatatankuWidget> createState() => _CatatankuWidgetState();
}

class _CatatankuWidgetState extends State<CatatankuWidget> {
  final CatatanController _catatanController = Get.put(CatatanController());

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _refreshActivity);
  }

  Future<void> _refreshActivity() async {
    await _catatanController.getDaily();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: _refreshActivity,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 1170),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 16),
                    Obx(() {
                      if (_catatanController.isLoading.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final posts = _catatanController.posts.value;
                      if (posts.isEmpty) {
                        return Center(
                          child: Text(
                            "Tidak ada catatan",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          final catatan = posts[index];
                          return _buildCatatanCard(catatan);
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Catatan Jurnal',
                style: GoogleFonts.outfit(
                  color: const Color(0xFF15161E),
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Lihat setiap Cerita dan Mood yang terjadi dalam Harian Anda.',
                style: GoogleFonts.outfit(
                  color: const Color(0xFF606A85),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Get.to(const CatatanWidget(),
                transition: Transition.downToUp,
                duration: Duration(milliseconds: 300));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFA8C7BB),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          child: Text(
            'Tambah',
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilters() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF1F4F8),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Filters',
            style: GoogleFonts.poppins(
              color: Color(0xFF606A85),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCatatanCard(catatan) {
    final createdAt = catatan.createdAt?.toLocal() ?? DateTime.now().toLocal();
    final formattedDate = DateFormat.yMMMd().add_jm().format(createdAt);
    // Catatan
    final String idCatatan = catatan?.id.toString() ?? '';
    final catatanDetail = catatan.catatanDetail;
    final judul = catatanDetail?.judul ?? 'Tidak ada Judul';
    final kegiatan = catatanDetail?.kegiatan ?? 'Tidak ada Kegiatan';
    // Mood
    final moodId = catatanDetail?.idMood ?? '';
    final detailmood = catatanDetail?.mood?.detailMood ?? 'Tidak ada Mood';
    final iconMood = catatanDetail?.mood?.icon ?? '';

    return GestureDetector(
      onTap: () {
        Get.to(() => CatatanDetailWidget(
              idCatatan: idCatatan,
              judul: judul,
              kegiatan: kegiatan,
              mood: moodId,
            ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: const Color.fromARGB(255, 112, 112, 112), width: 1),
        ),
        padding: const EdgeInsets.all(12),
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              judul,
              style: GoogleFonts.quicksand(
                color: const Color(0xFF15161E),
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              kegiatan != null
                  ? limitWords(kegiatan, 20)
                  : 'Kegiatan Tidak Ada',
              style: GoogleFonts.quicksand(
                color: const Color(0xFF606A85),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(77, 116, 116, 116),
                      radius: 20,
                      child: Image.asset(
                        "assets/icongif/$iconMood",
                        height: 40,
                        width: 40,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      detailmood,
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFD2E4E4),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFFD2E4E4),
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    formattedDate,
                    style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String limitWords(String text, int maxWords) {
  List<String> words = text.split(' ');
  if (words.length <= maxWords) {
    return text;
  }
  return words.take(maxWords).join(' ') + '...';
}
