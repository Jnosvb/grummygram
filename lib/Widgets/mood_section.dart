import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoodSection extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> iconData;
  final double iconSize;
  final int? selectedMoodId;
  final Function(int id, String mood) onMoodSelected;

  const MoodSection({
    Key? key,
    required this.title,
    required this.iconData,
    this.iconSize = 50.0,
    required this.selectedMoodId,
    required this.onMoodSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.outfit(
            color: const Color(0xFF606A85),
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: iconData.map((data) {
            bool isSelected = selectedMoodId == data['id'];
            return GestureDetector(
              onTap: () => onMoodSelected(data['id'], data['name']),
              child: Column(
                children: [
                  AnimatedScale(
                    scale: isSelected ? 1.5 : 1.0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        isSelected
                            ? Colors.transparent
                            : Colors.white.withOpacity(1),
                        BlendMode.saturation,
                      ),
                      child: Image.asset(
                        data['path'],
                        width: iconSize,
                        height: iconSize,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: isSelected ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        data['name'],
                        style: GoogleFonts.outfit(
                          color: const Color(0xFF15161E),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12.0),
      ],
    );
  }
}
