import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../shared/constants/app_colors.dart';
import '../../shared/constants/app_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) context.go('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.emeraldGreen, AppColors.deepEmerald],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomPaint(
                size: Size(MediaQuery.of(context).size.width, 200),
                painter: _MosqueSilhouettePainter(),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.nightlight_round, size: 80, color: AppColors.gold),
                  const SizedBox(height: 24),
                  Text(
                    AppConstants.appName,
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: AppColors.ivory,
                      fontFamily: AppConstants.fontArabic,
                    ),
                  ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.3),
                  const SizedBox(height: 16),
                  Text(
                    AppConstants.tagline,
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.softGold,
                      fontFamily: AppConstants.fontArabic,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: 1200.ms).slideY(begin: 0.3),
                  const SizedBox(height: 8),
                  Text(
                    AppConstants.taglineEn,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.mutedText,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: 1400.ms),
                  const SizedBox(height: 60),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.gold,
                      foregroundColor: AppColors.darkText,
                      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () => context.go('/home'),
                    child: const Text('ابدأ الآن', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ).animate().fadeIn(duration: 1600.ms).slideY(begin: 0.3),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.gold,
                      side: const BorderSide(color: AppColors.gold, width: 1.5),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('تسجيل الدخول', style: TextStyle(fontSize: 16)),
                  ).animate().fadeIn(duration: 1800.ms),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MosqueSilhouettePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.gold.withValues(alpha: 0.08)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height);

    path.quadraticBezierTo(size.width * 0.1, size.height * 0.4, size.width * 0.15, size.height * 0.3);
    path.lineTo(size.width * 0.15, size.height * 0.25);
    path.lineTo(size.width * 0.18, size.height * 0.25);
    path.lineTo(size.width * 0.18, size.height * 0.3);
    path.lineTo(size.width * 0.22, size.height * 0.3);
    path.lineTo(size.width * 0.22, size.height * 0.25);
    path.lineTo(size.width * 0.25, size.height * 0.25);
    path.lineTo(size.width * 0.25, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.3, size.height * 0.4, size.width * 0.35, size.height * 0.35);
    path.quadraticBezierTo(size.width * 0.4, size.height * 0.3, size.width * 0.5, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.6, size.height * 0.3, size.width * 0.65, size.height * 0.35);
    path.quadraticBezierTo(size.width * 0.7, size.height * 0.4, size.width * 0.75, size.height * 0.3);
    path.lineTo(size.width * 0.75, size.height * 0.25);
    path.lineTo(size.width * 0.78, size.height * 0.25);
    path.lineTo(size.width * 0.78, size.height * 0.3);
    path.lineTo(size.width * 0.82, size.height * 0.3);
    path.lineTo(size.width * 0.82, size.height * 0.25);
    path.lineTo(size.width * 0.85, size.height * 0.25);
    path.lineTo(size.width * 0.85, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.9, size.height * 0.4, size.width, size.height * 0.5);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
