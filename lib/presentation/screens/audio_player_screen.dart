import 'package:flutter/material.dart';
import '../../shared/constants/app_colors.dart';
import '../../shared/constants/app_constants.dart';
import '../../shared/widgets/app_scaffold.dart';

class AudioPlayerScreen extends StatefulWidget {
  final String trackId;

  const AudioPlayerScreen({super.key, required this.trackId});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  bool _isPlaying = false;
  double _progress = 0.3;
  bool _isRepeating = false;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      navIndex: 1,
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
          child: Column(
            children: [
              const Spacer(flex: 2),
              // Reciter portrait
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.gold, width: 3),
                  boxShadow: [
                    BoxShadow(color: AppColors.goldGlow, blurRadius: 20),
                  ],
                ),
                child: const CircleAvatar(
                  backgroundColor: AppColors.cardEmerald,
                  child: Icon(Icons.person, size: 60, color: AppColors.gold),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'مشاري راشد العفاسي',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.ivory,
                  fontFamily: AppConstants.fontArabic,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'أذكار الصباح',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.mutedText,
                  fontFamily: AppConstants.fontArabic,
                ),
              ),
              const Spacer(),
              // Progress slider
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 4,
                        activeTrackColor: AppColors.gold,
                        inactiveTrackColor: AppColors.gold.withValues(alpha: 0.3),
                        thumbColor: AppColors.gold,
                        overlayColor: AppColors.goldGlow,
                      ),
                      child: Slider(
                        value: _progress,
                        onChanged: (v) => setState(() => _progress = v),
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('1:24', style: TextStyle(color: AppColors.mutedText, fontSize: 12)),
                        Text('3:45', style: TextStyle(color: AppColors.mutedText, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Main controls
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildControlButton(Icons.skip_previous, 36, () {}),
                  const SizedBox(width: 24),
                  GestureDetector(
                    onTap: () => setState(() => _isPlaying = !_isPlaying),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.gold,
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(color: AppColors.goldGlow, blurRadius: 16)],
                      ),
                      child: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                        color: AppColors.darkText,
                        size: 36,
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  _buildControlButton(Icons.skip_next, 36, () {}),
                ],
              ),
              const Spacer(),
              // Secondary controls
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSecondaryButton(Icons.download, 'تنزيل'),
                    GestureDetector(
                      onTap: () => setState(() => _isRepeating = !_isRepeating),
                      child: Column(
                        children: [
                          Icon(
                            Icons.repeat,
                            color: _isRepeating ? AppColors.gold : AppColors.mutedText,
                            size: 24,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'تكرار',
                            style: TextStyle(
                              color: _isRepeating ? AppColors.gold : AppColors.mutedText,
                              fontSize: 11,
                              fontFamily: AppConstants.fontArabic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _buildSecondaryButton(Icons.timer, 'مؤقت النوم'),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildControlButton(IconData icon, double size, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.cardEmerald,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.gold.withValues(alpha: 0.3)),
        ),
        child: Icon(icon, color: AppColors.ivory, size: size),
      ),
    );
  }

  Widget _buildSecondaryButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: AppColors.mutedText, size: 24),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.mutedText,
            fontSize: 11,
            fontFamily: AppConstants.fontArabic,
          ),
        ),
      ],
    );
  }
}
