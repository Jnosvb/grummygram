import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:grummygram/Screens/Auth/profile.dart';
import 'package:grummygram/controllers/catatan_controller.dart';
import 'package:badges/badges.dart' as badges;
import 'package:grummygram/controllers/authentication.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key, required this.onNavigate}) : super(key: key);
  final Function(int) onNavigate;

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final CatatanController _catatanController = Get.put(CatatanController());
  final session = SessionManager();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _onRefresh);
  }

  Future<void> _onRefresh() async {
    await _catatanController.getLastDaily();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Color(0xFFE0E0E0),
              ],
            ),
          ),
          child: SafeArea(
            top: true,
            child: Column(
              children: [
                PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    automaticallyImplyLeading: false,
                    title: Text(
                      'GrumpyGram',
                      style: GoogleFonts.outfit(
                        color: const Color(0xFF050404),
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    actions: [
                      if (session.nama == null ||
                          session.notelp == null ||
                          session.tanggalLahir == null ||
                          session.jeniskelamin == null ||
                          session.alamat == null)
                        _buildBadge()
                      else
                        IconButton(
                          icon: const Icon(
                            Icons.account_circle_outlined,
                            color: Colors.black,
                            size: 32,
                          ),
                          onPressed: () async {
                            await Get.to(() => const ProfileWidget(),
                                transition: Transition.rightToLeft,
                                duration: const Duration(milliseconds: 300));
                            _onRefresh();
                          },
                        ),
                    ],
                    centerTitle: false,
                    elevation: 0,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: _onRefresh,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // _buildHeaderSection(),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16, 8, 0, 0),
                            child: Text(
                              'Hari Ini',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.outfit(
                                color: const Color(0xFF14181B),
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Obx(() {
                            if (_catatanController.isLoading.value) {
                              // return const Center(
                              //   child: CircularProgressIndicator(),
                              // );
                              return _buildMoodCardEmpty();
                            }
                            final lasts = _catatanController.last.value;
                            if (lasts.isEmpty) {
                              // return Center(
                              //   child: Text(
                              //     "Tidak ada catatan Terakhir",
                              //     style: GoogleFonts.poppins(
                              //       fontSize: 16,
                              //       fontWeight: FontWeight.w400,
                              //       color: Colors.grey,
                              //     ),
                              //   ),
                              // );
                              return _buildMoodCardEmpty();
                            }
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: lasts.length,
                              itemBuilder: (context, index) {
                                final lastdaily = lasts[index];
                                return _buildMoodCard(lastdaily);
                              },
                            );
                          }),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16, 20, 0, 0),
                            child: Text(
                              'Dashboard',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.outfit(
                                color: const Color(0xFF14181B),
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          _buildGridSectionWithCustomCards(),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      height: 130,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.transparent,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
            child: ListView(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                Obx(() {
                  var counts = _catatanController.count;
                  return Row(
                    children: [
                      _buildStatCard(
                        icon: Icons.book,
                        label: 'Journal',
                        value: counts.toString(),
                      ),
                      _buildStatCard(
                        icon: Icons.calendar_month,
                        label: 'Calendar',
                        value: '3',
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
      child: badges.Badge(
        position: badges.BadgePosition.topEnd(top: 0, end: 3),
        badgeContent: const Text(
          '!',
          style: TextStyle(color: Colors.white),
        ),
        child: IconButton(
          icon: const Icon(
            Icons.account_circle_outlined,
            color: Colors.black,
            size: 32,
          ),
          onPressed: () async {
            await Get.to(() => const ProfileWidget(),
                transition: Transition.rightToLeft,
                duration: const Duration(milliseconds: 300));
            _onRefresh();
          },
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            const BoxShadow(
              blurRadius: 4,
              color: Color(0x1F000000),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFF1F4F8),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 45, 0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFF373636),
                radius: 30,
                child: Icon(icon, color: const Color(0xFFE1CF8F), size: 24),
              ),
              const SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.plusJakartaSans(
                      color: const Color(0xFF57636C),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    value,
                    style: GoogleFonts.outfit(
                      color: const Color(0xFF14181B),
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMoodCard(lastdaily) {
    // Catatan
    final catatanDetail = lastdaily.lastdatadetail;
    final judul = catatanDetail?.judul ?? 'Tidak ada Judul';
    final kegiatan = catatanDetail?.kegiatan ?? 'Tidak ada Kegiatan';
    // Mood
    final iconMood = catatanDetail?.mood?.icon ?? '';
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFA8C7BB),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                "Mood Hari Ini",
                style: GoogleFonts.quicksand(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        judul != null
                            ? limitWords(judul, 1)
                            : 'Judul Tidak Ada',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        kegiatan != null
                            ? limitWords(kegiatan, 3)
                            : 'Catatan Tidak Ada',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    // "assets/image/flower.png",
                    "assets/icongif/${iconMood}" ??
                        'assets/icongif/bahagia.gif',
                    height: 70,
                    width: 70,
                  ),

                  // Icon(Icons.sentiment_very_satisfied,
                  //     color: Colors.black, size: 48),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMoodCardEmpty() {
    // Catatan
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFA8C7BB),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                "Mood Hari Ini",
                style: GoogleFonts.quicksand(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tidak ada Judul',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Tidak ada Kegiatan',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  // Image.asset(
                  //   // "assets/image/flower.png",
                  //       'assets/icongif/bahagia.gif',
                  //   height: 70,
                  //   width: 70,
                  // ),

                  const Icon(Icons.sentiment_very_satisfied,
                      color: Color.fromARGB(255, 85, 85, 85), size: 48),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridSectionWithCustomCards() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildCustomCard(
            backgroundColor: const Color.fromARGB(255, 255, 126, 117),
            imageAsset: "assets/image/book.png",
            textColor: const Color.fromARGB(255, 70, 70, 70),
            circleicon: const Color.fromARGB(255, 255, 153, 145),
            title: "Catatan \nJurnal",
            pageIndex: 1,
            height: 75,
            width: 75,
            // title: "My Strengths\n& Qualities",
            // imageAsset: null,
          ),
          _buildCustomCard(
            backgroundColor: const Color(0xFFEAAD75),
            // backgroundColor: const Color.fromARGB(255, 247, 214, 255),
            imageAsset: "assets/image/notebook.png",
            textColor: const Color.fromARGB(255, 70, 70, 70),
            circleicon: const Color.fromARGB(255, 253, 190, 132),
            title: "Ceritakan\nHari Ini",
            pageIndex: 1,
            height: 75,
            width: 75,
          ),
          _buildCustomCard(
            backgroundColor: const Color.fromARGB(255, 200, 223, 244),
            imageAsset: "assets/image/mobile.png",
            textColor: const Color.fromARGB(255, 70, 70, 70),
            circleicon: const Color(0xFFD3EBFF),
            title: "Aktivitas\nKamu",
            pageIndex: 2,
            height: 75,
            width: 75,
            // backgroundColor: Color(0xFFD2E4E4),
            // imageAsset: "assets/icongif/frustasi.gif",
          ),
          _buildCustomCard(
            // backgroundColor: const Color.fromARGB(255, 247, 214, 255),
            backgroundColor: const Color(0xFFFFE5C2),
            imageAsset: "assets/image/review.png",
            textColor: const Color.fromARGB(255, 70, 70, 70),
            circleicon: const Color.fromARGB(255, 255, 238, 216),
            title: "Kegiatan\nRekomendasi",
            pageIndex: 3,
            height: 75,
            width: 75,
            // imageAsset: null,
          ),
        ],
      ),
    );
  }

  Widget _buildCustomCard({
    required String title,
    required Color backgroundColor,
    String? imageAsset,
    required Color circleicon,
    required Color textColor,
    required int pageIndex,
    required double height,
    required double width,
  }) {
    return GestureDetector(
      onTap: () => widget.onNavigate(pageIndex),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            if (imageAsset != null)
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8, left: 8),
                  child: Image.asset(
                    imageAsset,
                    height: height,
                    width: width,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.quicksand(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: circleicon,
                      ),
                      child: const Icon(
                        Icons.arrow_outward,
                        size: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
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
