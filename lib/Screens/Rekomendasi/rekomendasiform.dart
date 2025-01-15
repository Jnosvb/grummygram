import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:grummygram/Screens/Rekomendasi/detail_rekomendasi_screen.dart';
import 'package:grummygram/controllers/mood_controller.dart';
import 'package:grummygram/controllers/rekomendasi_controller.dart';
import 'package:grummygram/Utils/mood_utils.dart';
import 'package:grummygram/Widgets/mood_section.dart';
import 'package:grummygram/controllers/authentication.dart';

class RekomendasiFormWidget extends StatefulWidget {
  final Function(int)? onNavigate;
  const RekomendasiFormWidget({Key? key, this.onNavigate}) : super(key: key);

  @override
  State<RekomendasiFormWidget> createState() => _RekomendasiFormWidgetState();
}

class _RekomendasiFormWidgetState extends State<RekomendasiFormWidget> {
  final TextEditingController _catatanTextController = TextEditingController();
  final TextEditingController _judulTextController = TextEditingController();
  final FocusNode _judulFocusNode = FocusNode();
  final FocusNode _catatanFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RekomendasiController _rekomendasiController =
      Get.put(RekomendasiController());
  final MoodController _moodController = Get.put(MoodController());
  final session = SessionManager();
  int? moodsId;
  String? moodName;

  @override
  void dispose() {
    _judulTextController.dispose();
    _judulFocusNode.dispose();
    _catatanTextController.dispose();
    _catatanFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _refreshSession();
  }

  void _refreshSession() async {
    await session.loadUserDetails();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    print(session.usage);
    return Obx(() {
      if (_moodController.isLoading.value) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Recomended Activity',
                style: GoogleFonts.outfit(
                  color: const Color(0xFF15161E),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            elevation: 0.0,
          ),
          body: const Center(child: CircularProgressIndicator()),
        );
      }

      List<Map<String, dynamic>> moodpositif = _moodController.posts.value
          .where((mood) => mood.id_kategori_mood == 1)
          .map((mood) => {
                'id': mood.id,
                'path': 'assets/icongif/${mood.icon}',
                'name': mood.detail_mood ?? 'No Name'
              })
          .toList();

      List<Map<String, dynamic>> moodnegatif = _moodController.posts.value
          .where((mood) => mood.id_kategori_mood == 2)
          .map((mood) => {
                'id': mood.id,
                'path': 'assets/icongif/${mood.icon}',
                'name': mood.detail_mood ?? 'No Name'
              })
          .toList();

      List<Map<String, dynamic>> moodnetral = _moodController.posts.value
          .where((mood) => mood.id_kategori_mood == 3)
          .map((mood) => {
                'id': mood.id,
                'path': 'assets/icongif/${mood.icon}',
                'name': mood.detail_mood ?? 'No Name'
              })
          .toList();

      return GestureDetector(
          child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeader(),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(height: 20.0),
                        MoodSection(
                          title: 'Mood Positif',
                          iconData: moodpositif,
                          selectedMoodId: moodsId,
                          onMoodSelected: (id, mood) {
                            setState(() {
                              moodsId = id;
                              moodName = mood;
                            });
                          },
                        ),
                        MoodSection(
                          title: 'Mood Negatif',
                          iconData: moodnegatif,
                          selectedMoodId: moodsId,
                          onMoodSelected: (id, mood) {
                            setState(() {
                              moodsId = id;
                              moodName = mood;
                            });
                          },
                        ),
                        MoodSection(
                          title: 'Mood Netral',
                          iconData: moodnetral,
                          selectedMoodId: moodsId,
                          onMoodSelected: (id, mood) {
                            setState(() {
                              moodsId = id;
                              moodName = mood;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (session.usage == 5)
                                    Text(
                                      'Batas Percobaan Sudah Habis \nCoba lagi besok.',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFF606A85),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  if (session.usage != 5)
                                    Text(
                                      '*Pilih terlebih dulu mood kamu.',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFF606A85),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: moodsId == null ||
                                      _rekomendasiController
                                          .isLoadingRespon.value
                                  ? null
                                  : session.usage == 3 ||
                                          _rekomendasiController
                                              .isLoadingRespon.value
                                      ? null
                                      : () async {
                                          _rekomendasiController
                                              .isLoadingRespon.value = true;
                                          var result =
                                              await _rekomendasiController
                                                  .recomendationsend(
                                            mood: moodName.toString(),
                                          );

                                          if (result == true) {
                                            var rekomendasi =
                                                _rekomendasiController
                                                    .rekomendasi.value;

                                            Map<String, dynamic> selectedMood =
                                                getMoodById(
                                              moodsId,
                                              [
                                                ...moodpositif,
                                                ...moodnegatif,
                                                ...moodnetral
                                              ],
                                            );

                                            Get.off(
                                              () => DetailRekomendasiWidget(
                                                kegiatan: rekomendasi,
                                                moodicon: selectedMood['path'],
                                                detailMood:
                                                    selectedMood['name'],
                                              ),
                                              duration: const Duration(
                                                  milliseconds: 500),
                                            );
                                          } else {
                                            Get.snackbar(
                                              'Pesan',
                                              result.toString(),
                                              snackPosition: SnackPosition.TOP,
                                              backgroundColor: Colors.red,
                                              titleText: Text(
                                                'Pesan',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              messageText: Text(
                                                result.toString(),
                                                style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ),
                                            );
                                          }
                                          _rekomendasiController
                                              .isLoadingRespon.value = false;
                                        },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 162, 194, 135),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                              child: Obx(() {
                                return _rekomendasiController
                                        .isLoadingRespon.value
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        'Kirim',
                                        style: GoogleFonts.figtree(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600),
                                      );
                              }),
                            ),
                          ],
                        ),

                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
    });
  }
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
              'Rekomendasi Kegiatan',
              style: GoogleFonts.outfit(
                color: const Color(0xFF15161E),
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Fitur ini menggunakan Model Qwen \n(Qwen2.5-Coder-32B-Instruct).',
              style: GoogleFonts.outfit(
                color: const Color(0xFF606A85),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
