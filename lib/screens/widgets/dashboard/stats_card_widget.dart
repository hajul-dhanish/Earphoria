import 'package:Bloomee/model/dashboard_models.dart';
import 'package:Bloomee/theme_data/default.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class StatsCardWidget extends StatelessWidget {
  final ListeningStats stats;

  const StatsCardWidget({
    super.key,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Default_Theme.primaryColor1.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Music Stats',
              style: Default_Theme.secondoryTextStyle.merge(
                const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Default_Theme.accentColor2,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _StatItem(
                    icon: MingCute.music_2_fill,
                    label: 'Total Plays',
                    value: stats.totalPlayCount.toString(),
                  ),
                ),
                Expanded(
                  child: _StatItem(
                    icon: MingCute.time_fill,
                    label: 'Listening Time',
                    value: stats.formattedListeningTime,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _StatItem(
                    icon: MingCute.heart_fill,
                    label: 'Favorites',
                    value: stats.favoriteSongsCount.toString(),
                  ),
                ),
                Expanded(
                  child: _StatItem(
                    icon: MingCute.download_2_fill,
                    label: 'Downloads',
                    value: stats.downloadedSongsCount.toString(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: Default_Theme.accentColor2,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: Default_Theme.secondoryTextStyle.merge(
                TextStyle(
                  fontSize: 12,
                  color: Default_Theme.primaryColor1.withOpacity(0.7),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 28),
          child: Text(
            value,
            style: Default_Theme.primaryTextStyle.merge(
              const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Default_Theme.primaryColor1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
