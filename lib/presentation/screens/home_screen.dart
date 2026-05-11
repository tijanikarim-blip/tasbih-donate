import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../shared/constants/app_colors.dart';
import '../../shared/constants/app_constants.dart';
import '../../shared/utils/arabic_data.dart';
import '../../shared/utils/dummy_data.dart';
import '../../shared/widgets/app_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _counter = 0;
  int _currentDhikrIndex = 0;
  late AnimationController _beadsController;
  late AnimationController _counterScaleController;
  final List<_FloatingWord> _floatingWords = [];
  late PageController _pageController;

  final List<_FloatingWordTemplate> _wordTemplates = [
    _FloatingWordTemplate('تقبل الله', AppColors.gold),
    _FloatingWordTemplate('في سبيل الله', AppColors.softGold),
    _FloatingWordTemplate('سبحان الله', AppColors.ivory),
  ];

  @override
  void initState() {
    super.initState();
    _beadsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _counterScaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _pageController = PageController();
  }

  @override
  void dispose() {
    _beadsController.dispose();
    _counterScaleController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    HapticFeedback.lightImpact();
    setState(() {
      _counter++;
      _addFloatingWord();
    });
    _beadsController.forward(from: 0);
    _counterScaleController.forward(from: 0);
  }

  void _addFloatingWord() {
    final template = _wordTemplates[_counter % _wordTemplates.length];
    final word = _FloatingWord(template.text, template.color, DateTime.now());
    _floatingWords.add(word);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _floatingWords.remove(word);
        });
      }
    });
  }

  void _changeDhikr(int index) {
    setState(() {
      _counter = 0;
      _currentDhikrIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dhikr = ArabicData.defaultAdhkar[_currentDhikrIndex];
    final user = DummyData.currentUser;

    return AppScaffold(
      navIndex: 0,
      showMenu: true,
      showSearch: true,
      extendBodyBehindAppBar: true,
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
        child: SafeArea(
          child: Stack(
            children: [
              // Geometric pattern background
              Positioned.fill(
                child: CustomPaint(
                  painter: _GeometricPatternPainter(),
                ),
              ),
              // Floating words
              ..._floatingWords.map((w) => _buildFloatingWord(w)),
              // Main content
              Column(
                children: [
                  const SizedBox(height: 16),
                  // Dhikr title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
                    child: Text(
                      dhikr.arabicText,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.ivory,
                        fontFamily: AppConstants.fontArabic,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Counter area with prayer beads
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Swipe arrows
                        Positioned(left: 8, child: _buildArrow(Icons.chevron_left)),
                        Positioned(right: 8, child: _buildArrow(Icons.chevron_right)),
                        // Prayer beads circle
                        AnimatedBuilder(
                          animation: _beadsController,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: _beadsController.value * 0.1,
                              child: child,
                            );
                          },
                          child: _buildPrayerBeads(),
                        ),
                        // Counter
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedBuilder(
                              animation: _counterScaleController,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: 1 + (_counterScaleController.value * 0.1),
                                  child: child,
                                );
                              },
                              child: Text(
                                '$_counter',
                                style: const TextStyle(
                                  fontSize: 72,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.ivory,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'تسبيحة',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.softGold,
                                fontFamily: AppConstants.fontArabic,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Swipe button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    child: GestureDetector(
                      onTap: _incrementCounter,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(color: AppColors.gold, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.goldGlow,
                              blurRadius: 16,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            dhikr.arabicText,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.ivory,
                              fontFamily: AppConstants.fontArabic,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Swipe hint
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.swipe, color: AppColors.mutedText, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        'اسحب لليمين أو اليسار لتغيير الذكر',
                        style: const TextStyle(color: AppColors.mutedText, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Statistics cards
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: _buildStatCard('إجمالي التسبيحات', '${user.totalTasbih}', Icons.favorite)),
                            const SizedBox(width: 8),
                            Expanded(child: _buildStatCard('الإعلانات المشاهدة', '${user.adsViewed}', Icons.visibility)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(child: _buildStatCard('مساهمتك من الإعلانات', '\$${user.estimatedAdContribution.toStringAsFixed(2)}', Icons.attach_money)),
                            const SizedBox(width: 8),
                            Expanded(child: _buildStatCard('السلسلة اليومية', '${user.dailyStreak} أيام', Icons.local_fire_department)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArrow(IconData icon) {
    return GestureDetector(
      onTap: () {
        final newIndex = icon == Icons.chevron_left
            ? (_currentDhikrIndex + 1) % ArabicData.defaultAdhkar.length
            : (_currentDhikrIndex - 1 + ArabicData.defaultAdhkar.length) % ArabicData.defaultAdhkar.length;
        _changeDhikr(newIndex);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.gold.withValues(alpha: 0.15),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.gold, size: 28),
      ),
    );
  }

  Widget _buildPrayerBeads() {
    return SizedBox(
      width: 220,
      height: 220,
      child: CustomPaint(
        painter: _PrayerBeadsPainter(),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardEmerald,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gold.withValues(alpha: 0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.gold, size: 16),
              const SizedBox(width: 4),
              Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.white)),
            ],
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12, color: AppColors.mutedText, fontFamily: AppConstants.fontArabic)),
        ],
      ),
    );
  }

  Widget _buildFloatingWord(_FloatingWord word) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(seconds: 2),
      builder: (context, value, child) {
        return Positioned(
          top: 200 - (value * 150),
          left: MediaQuery.of(context).size.width * 0.3 + (value * 40),
          child: Opacity(
            opacity: 1 - value,
            child: Text(
              word.text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: word.color.withValues(alpha: 1 - value),
                fontFamily: AppConstants.fontArabic,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _GeometricPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.gold.withValues(alpha: 0.04)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (double i = 0; i < size.width; i += 30) {
      for (double j = 0; j < size.height; j += 30) {
        canvas.drawCircle(Offset(i, j), 8, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _PrayerBeadsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 12;
    final beadRadius = 8.0;
    final beadCount = 33;

    for (int i = 0; i < beadCount; i++) {
      final angle = (i / beadCount) * 3.14159 * 2 - 3.14159 / 2;
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);

      final beadPaint = Paint()
        ..shader = RadialGradient(
          colors: [
            AppColors.emeraldGreen.withValues(alpha: 0.9),
            AppColors.gold.withValues(alpha: 0.3),
          ],
        ).createShader(Rect.fromCircle(center: Offset(x, y), radius: beadRadius));

      canvas.drawCircle(Offset(x, y), beadRadius, beadPaint);

      if (i == beadCount - 1) {
        final tasselPaint = Paint()
          ..color = AppColors.gold.withValues(alpha: 0.6)
          ..strokeWidth = 2;
        canvas.drawLine(
          Offset(x, y + beadRadius),
          Offset(x, y + beadRadius + 16),
          tasselPaint,
        );
        canvas.drawCircle(Offset(x, y + beadRadius + 18), 3, tasselPaint);
      }
    }

    final innerPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          AppColors.gold.withValues(alpha: 0.1),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius - beadRadius - 4));
    canvas.drawCircle(center, radius - beadRadius - 4, innerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _FloatingWordTemplate {
  final String text;
  final Color color;
  _FloatingWordTemplate(this.text, this.color);
}

class _FloatingWord {
  final String text;
  final Color color;
  final DateTime createdAt;
  _FloatingWord(this.text, this.color, this.createdAt);
}


