import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../shared/constants/app_colors.dart';
import '../../shared/constants/app_constants.dart';
import '../../shared/utils/arabic_data.dart';
import '../../domain/models/dhikr.dart';
import '../../shared/widgets/app_scaffold.dart';

class AdhkarScreen extends StatefulWidget {
  const AdhkarScreen({super.key});

  @override
  State<AdhkarScreen> createState() => _AdhkarScreenState();
}

class _AdhkarScreenState extends State<AdhkarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _tabs = const [
    Tab(text: 'الصباح'),
    Tab(text: 'النهار'),
    Tab(text: 'المساء'),
    Tab(text: 'النوم'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      navIndex: 1,
      title: 'الأذكار',
      showSearch: true,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.cardEmerald,
              borderRadius: BorderRadius.circular(16),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: AppColors.gold,
                borderRadius: BorderRadius.circular(12),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: AppColors.darkText,
              unselectedLabelColor: AppColors.mutedText,
              tabs: _tabs,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTimeSlotContent('أذكار الصباح', 'أذكار ما بعد صلاة الفجر حتى طلوع الشمس', ArabicData.morningAdhkar),
                _buildTimeSlotContent('أذكار النهار', 'أذكار منتصف النهار', ArabicData.morningAdhkar),
                _buildTimeSlotContent('أذكار المساء', 'أذكار ما بعد العصر حتى المغرب', ArabicData.eveningAdhkar),
                _buildTimeSlotContent('أذكار النوم', 'أذكار قبل النوم', ArabicData.nightAdhkar),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSlotContent(String title, String description, List<Dhikr> adhkarList) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFeaturedCard(title, description),
          const SizedBox(height: 24),
          const Text('اقتراحات اليوم', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.white, fontFamily: AppConstants.fontArabic)),
          const SizedBox(height: 12),
          _buildSuggestionCard('ذكر اليوم', 'سبحان الله وبحمده 100 مرة', Icons.favorite),
          _buildSuggestionCard('دعاء اليوم', 'اللهم إني أسألك العافية في الدنيا والآخرة', Icons.handshake),
          _buildSuggestionCard('صدقة اليوم', 'التبرع لإطعام وجبة', Icons.card_giftcard),
          const SizedBox(height: 24),
          const Text('الأذكار', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.white, fontFamily: AppConstants.fontArabic)),
          const SizedBox(height: 12),
          ...adhkarList.map((dhikr) => _buildDhikrCard(dhikr)),
        ],
      ),
    );
  }

  Widget _buildFeaturedCard(String title, String description) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.ivory,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: AppColors.goldGlow, blurRadius: 12),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.emeraldGreen.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Icon(Icons.wb_sunny, size: 60, color: AppColors.gold),
            ),
          ),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.darkText, fontFamily: AppConstants.fontArabic)),
          const SizedBox(height: 8),
          Text(description, style: const TextStyle(fontSize: 14, color: AppColors.mutedText)),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildActionChip('استمع', Icons.headphones),
              const SizedBox(width: 8),
              _buildActionChip('اقرأ', Icons.menu_book),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.darkText, fontFamily: AppConstants.fontArabic)),
          const SizedBox(width: 6),
          Icon(icon, size: 18, color: AppColors.darkText),
        ],
      ),
    );
  }

  Widget _buildSuggestionCard(String title, String suggestion, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardEmerald,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gold.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.gold.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.gold, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.gold, fontFamily: AppConstants.fontArabic)),
                const SizedBox(height: 2),
                Text(suggestion, style: const TextStyle(fontSize: 13, color: AppColors.ivory)),
              ],
            ),
          ),
          const Icon(Icons.arrow_back_ios, color: AppColors.mutedText, size: 14),
        ],
      ),
    );
  }

  Widget _buildDhikrCard(Dhikr dhikr) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardEmerald,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gold.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(dhikr.arabicText, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.ivory, fontFamily: AppConstants.fontArabic)),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.repeat, color: AppColors.gold, size: 14),
              const SizedBox(width: 4),
              Text('${dhikr.recommendedCount} مرة', style: const TextStyle(color: AppColors.gold, fontSize: 12)),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.play_circle, color: AppColors.gold, size: 22),
                onPressed: () => context.go('/audio-player/${dhikr.id}'),
              ),
              IconButton(
                icon: const Icon(Icons.favorite_border, color: AppColors.gold, size: 20),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.share, color: AppColors.mutedText, size: 20),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
