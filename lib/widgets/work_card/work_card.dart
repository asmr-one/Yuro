import 'package:flutter/material.dart';
import 'package:asmrapp/data/models/works/work.dart';
import 'components/work_cover_image.dart';
import 'components/work_info_section.dart';

class WorkCard extends StatelessWidget {
  final Work work;
  final VoidCallback? onTap;

  const WorkCard({
    super.key,
    required this.work,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: isDark ? 0 : 1,
      color: isDark 
          ? Theme.of(context).colorScheme.surfaceVariant
          : Theme.of(context).colorScheme.surface,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WorkCoverImage(
              imageUrl: work.mainCoverUrl ?? '',
              rjNumber: 'RJ${work.id ?? 0}',
            ),
            Expanded(
              child: WorkInfoSection(work: work),
            ),
          ],
        ),
      ),
    );
  }
}
