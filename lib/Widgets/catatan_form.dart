import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatatanForm extends StatelessWidget {
  final TextEditingController judulController;
  final TextEditingController catatanController;
  final FocusNode judulFocusNode;
  final FocusNode catatanFocusNode;

  const CatatanForm({
    Key? key,
    required this.judulController,
    required this.catatanController,
    required this.judulFocusNode,
    required this.catatanFocusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: judulController,
          focusNode: judulFocusNode,
          decoration: InputDecoration(
            labelText: "Judul Cerita Kamu",
            labelStyle: GoogleFonts.outfit(
              color: const Color.fromARGB(255, 81, 80, 80),
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFE5E7EB),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 81, 80, 80),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(16.0),
          ),
          style: GoogleFonts.figtree(
            color: const Color(0xFF15161E),
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: catatanController,
          focusNode: catatanFocusNode,
          decoration: InputDecoration(
            labelText: 'Ceritakan Perasaan Kamu',
            labelStyle: GoogleFonts.outfit(
              color: const Color.fromARGB(255, 81, 80, 80),
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFE5E7EB),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 81, 80, 80),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(16.0),
          ),
          style: GoogleFonts.figtree(
            color: const Color(0xFF15161E),
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 9,
          minLines: 5,
        ),
      ],
    );
  }
}
