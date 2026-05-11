import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../shared/constants/app_colors.dart';
import '../../shared/constants/app_constants.dart';
import '../../shared/utils/dummy_data.dart';
import '../../domain/models/charity_item.dart';
import '../../shared/widgets/app_scaffold.dart';

class BabAlAjrScreen extends StatefulWidget {
  const BabAlAjrScreen({super.key});

  @override
  State<BabAlAjrScreen> createState() => _BabAlAjrScreenState();
}

class _BabAlAjrScreenState extends State<BabAlAjrScreen> {
  final _categories = [
    'الكل', 'إطعام وجبة', 'علاج ودواء', 'سقي ماء', 'مصحف', 'بناء بئر',
  ];
  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      navIndex: 2,
      title: 'باب الأجر',
      showSearch: true,
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.cardEmerald,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: AppColors.mutedText),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: AppColors.white),
                      decoration: InputDecoration(
                        hintText: 'ابحث في باب الأجر...',
                        hintStyle: TextStyle(color: AppColors.mutedText),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Category chips
          SizedBox(
            height: 44,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final isSelected = _selectedCategory == index;
                return Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedCategory = index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.gold : AppColors.cardEmerald,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected ? AppColors.gold : AppColors.gold.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Text(
                        _categories[index],
                        style: TextStyle(
                          color: isSelected ? AppColors.darkText : AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          fontFamily: AppConstants.fontArabic,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          // Charity items / Projects
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: DummyData.charityItems.length,
              itemBuilder: (context, index) {
                final item = DummyData.charityItems[index];
                return _buildCharityCard(item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCharityCard(CharityItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
              color: AppColors.emeraldGreen.withValues(alpha: 0.3),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Center(
              child: Icon(
                item.isProject ? Icons.construction : Icons.card_giftcard,
                size: 48,
                color: AppColors.gold.withValues(alpha: 0.5),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.cardEmerald,
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
              border: Border.all(color: AppColors.gold.withValues(alpha: 0.15)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.ivory,
                          fontFamily: AppConstants.fontArabic,
                        ),
                      ),
                    ),
                    if (item.isProject)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.gold.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'مشروع',
                          style: TextStyle(color: AppColors.gold, fontSize: 11, fontFamily: AppConstants.fontArabic),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  item.description,
                  style: const TextStyle(color: AppColors.mutedText, fontSize: 13),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      item.isProject ? '\$${item.raisedAmount?.toStringAsFixed(0) ?? '0'} من \$${item.targetAmount?.toStringAsFixed(0) ?? '0'}' : '\$${item.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.gold,
                      ),
                    ),
                    const Spacer(),
                    if (item.isProject && item.contributorsCount != null)
                      Text(
                        '${item.contributorsCount} متبرع',
                        style: const TextStyle(color: AppColors.mutedText, fontSize: 12, fontFamily: AppConstants.fontArabic),
                      ),
                  ],
                ),
                if (item.isProject) ...[
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: item.progress.clamp(0.0, 1.0),
                      backgroundColor: AppColors.deepEmerald,
                      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.gold),
                      minHeight: 6,
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.gold,
                      foregroundColor: AppColors.darkText,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (item.isProject) {
                        context.go('/project-details/${item.id}');
                      }
                    },
                    child: Text(
                      item.isProject ? 'تبرع للمشروع' : 'تبرع الآن',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: AppConstants.fontArabic,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
