import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:grummygram/Screens/home.dart';

class DetailSubmitWidget extends StatefulWidget {
  final String judul;
  final String kegiatan;
  final String moodicon;
  final String detailMood;

  const DetailSubmitWidget(
      {required this.judul,
      required this.kegiatan,
      required this.moodicon,
      required this.detailMood,
      Key? key})
      : super(key: key);

  @override
  State<DetailSubmitWidget> createState() => _DetailSubmitWidgetState();
}

class _DetailSubmitWidgetState extends State<DetailSubmitWidget> {
  late String judul;
  late String kegiatan;
  late String moodicon;
  late String moodDetail;

  @override
  void initState() {
    super.initState();
    judul = widget.judul;
    kegiatan = widget.kegiatan;
    moodDetail = widget.detailMood;
    moodicon = widget.moodicon;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF1F4F8),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF1F4F8),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(
                    maxWidth: 770,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        color: Color(0x33000000),
                        offset: Offset(0, 1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color(0xFFE5E7EB),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, -1),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 239, 220, 152),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 233, 213, 149),
                                  width: 4,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  child: Image.asset(
                                    moodicon,
                                    width: 84,
                                    height: 84,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, -1),
                          child: Text(
                            moodDetail,
                            style: GoogleFonts.poppins(
                              color: Color(0xFF15161E),
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, -1),
                          child: Text(
                            judul,
                            style: GoogleFonts.poppins(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Divider(
                          height: 24,
                          thickness: 2,
                          color: Color(0xFFE5E7EB),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          child: Text(
                            kegiatan,
                            style: GoogleFonts.poppins(
                              color: Color(0xFF606A85),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.off(const HomeScreen());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 162, 194, 135),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                'Home',
                                style: GoogleFonts.figtree(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
