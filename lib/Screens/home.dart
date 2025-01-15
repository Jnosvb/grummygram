import 'package:flutter/material.dart';
import 'package:grummygram/Screens/Catatan/add_catatan_screen.dart';
import 'package:grummygram/Screens/Catatan/catatan_screen.dart';
import 'package:grummygram/Screens/dashboard.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grummygram/Screens/Rekomendasi/rekomendasiform.dart';
import 'package:grummygram/Screens/Auth/activity_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      DashboardWidget(onNavigate: _onItemTapped),
      const CatatankuWidget(),
      const ActivityWidget(),
      const RekomendasiFormWidget(),
    ]);
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    if (index == 0) {
      _pages[0] = DashboardWidget(
          onNavigate: _onItemTapped,
          key: ValueKey(DateTime.now().millisecondsSinceEpoch));
    } else if (index == 1) {
      _pages[1] =
          CatatankuWidget(key: ValueKey(DateTime.now().millisecondsSinceEpoch));
    } else if (index == 2) {
      _pages[2] =
          ActivityWidget(key: ValueKey(DateTime.now().millisecondsSinceEpoch));
    } else if (index == 3) {
      _pages[3] = RekomendasiFormWidget(
          key: ValueKey(DateTime.now().millisecondsSinceEpoch));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: NavbarBottomWidget(
        pageIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class NavbarBottomWidget extends StatelessWidget {
  const NavbarBottomWidget({
    super.key,
    required this.pageIndex,
    required this.onItemTapped,
  });

  final int pageIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFF373636),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 3, 3, 3).withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  icon: pageIndex == 0 ? Icons.home_filled : Icons.home_filled,
                  label: 'Home',
                  isActive: pageIndex == 0,
                  onTap: () => onItemTapped(0),
                ),
                _buildNavItem(
                  icon: pageIndex == 1 ? Icons.book : Icons.book,
                  label: 'Jurnal',
                  isActive: pageIndex == 1,
                  onTap: () => onItemTapped(1),
                ),
                const SizedBox(width: 50),
                _buildNavItem(
                  icon: pageIndex == 2 ? Icons.history : Icons.history,
                  label: 'Aktivitas',
                  isActive: pageIndex == 2,
                  onTap: () => onItemTapped(2),
                ),
                _buildNavItem(
                  icon:
                      pageIndex == 3 ? Icons.insert_chart : Icons.insert_chart,
                  label: 'Kegiatan',
                  isActive: pageIndex == 3,
                  onTap: () => onItemTapped(3),
                ),
              ],
            ),
          ),
          Positioned(
            top: -20,
            left: MediaQuery.of(context).size.width / 2 - 35,
            child: GestureDetector(
              onTap: () => Get.to(() => const CatatanWidget(),
                  transition: Transition.downToUp,
                  duration: const Duration(milliseconds: 300)),
              child: StatefulBuilder(
                builder: (context, setState) {
                  bool isPressed = false;
                  return GestureDetector(
                    onTapDown: (_) {
                      setState(() => isPressed = true);
                    },
                    onTapUp: (_) {
                      setState(() => isPressed = false);
                    },
                    onTap: () => Get.to(() => const CatatanWidget(),
                        transition: Transition.downToUp,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOutCubic),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color:
                            isPressed ? Color(0xFFA8C7BB) : Color(0xFFA8C7BB),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 38,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive
                ? const Color(0xFFE5EAF3)
                : const Color.fromARGB(255, 134, 134, 134),
            size: 24,
          ),
         const SizedBox(
            width: 45,
          ),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: isActive
                  ? const Color(0xFFE5EAF3)
                  : const Color.fromARGB(255, 134, 134, 134),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
