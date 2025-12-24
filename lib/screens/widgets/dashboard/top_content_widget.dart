import 'package:Bloomee/blocs/mediaPlayer/bloomee_player_cubit.dart';
import 'package:Bloomee/model/dashboard_models.dart';
import 'package:Bloomee/theme_data/default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class TopContentWidget extends StatelessWidget {
  final List<TopContentItem> topSongs;
  final List<TopContentItem> topArtists;
  final DashboardPeriod selectedPeriod;
  final Function(DashboardPeriod) onPeriodChanged;

  const TopContentWidget({
    super.key,
    required this.topSongs,
    required this.topArtists,
    required this.selectedPeriod,
    required this.onPeriodChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Content',
                style: Default_Theme.secondoryTextStyle.merge(
                  const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Default_Theme.accentColor2,
                  ),
                ),
              ),
              _PeriodSelector(
                selectedPeriod: selectedPeriod,
                onChanged: onPeriodChanged,
              ),
            ],
          ),
        ),
        if (topSongs.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text(
              'Top Songs',
              style: Default_Theme.secondoryTextStyle.merge(
                TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Default_Theme.primaryColor1.withOpacity(0.8),
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: topSongs.length > 5 ? 5 : topSongs.length,
            itemBuilder: (context, index) {
              final item = topSongs[index];
              return _TopSongItem(
                item: item,
                rank: index + 1,
              );
            },
          ),
        ],
        if (topArtists.isNotEmpty) ...[
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text(
              'Top Artists',
              style: Default_Theme.secondoryTextStyle.merge(
                TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Default_Theme.primaryColor1.withOpacity(0.8),
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: topArtists.length > 5 ? 5 : topArtists.length,
            itemBuilder: (context, index) {
              final item = topArtists[index];
              return _TopArtistItem(
                item: item,
                rank: index + 1,
              );
            },
          ),
        ],
      ],
    );
  }
}

class _PeriodSelector extends StatelessWidget {
  final DashboardPeriod selectedPeriod;
  final Function(DashboardPeriod) onChanged;

  const _PeriodSelector({
    required this.selectedPeriod,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<DashboardPeriod>(
      initialValue: selectedPeriod,
      onSelected: onChanged,
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            selectedPeriod.label,
            style: Default_Theme.secondoryTextStyle.merge(
              const TextStyle(
                fontSize: 12,
                color: Default_Theme.accentColor2,
              ),
            ),
          ),
          const SizedBox(width: 4),
          const Icon(
            MingCute.down_line,
            color: Default_Theme.accentColor2,
            size: 16,
          ),
        ],
      ),
      itemBuilder: (context) => DashboardPeriod.values
          .map(
            (period) => PopupMenuItem(
              value: period,
              child: Text(period.label),
            ),
          )
          .toList(),
    );
  }
}

class _TopSongItem extends StatelessWidget {
  final TopContentItem item;
  final int rank;

  const _TopSongItem({
    required this.item,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 24,
            child: Text(
              '$rank',
              textAlign: TextAlign.center,
              style: Default_Theme.primaryTextStyle.merge(
                TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: rank <= 3
                      ? Default_Theme.accentColor2
                      : Default_Theme.primaryColor1.withOpacity(0.5),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              item.imageUrl ?? '',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Default_Theme.primaryColor1.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(
                    MingCute.music_2_fill,
                    color: Default_Theme.accentColor2,
                    size: 20,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      title: Text(
        item.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Default_Theme.secondoryTextStyle.merge(
          const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Default_Theme.primaryColor1,
          ),
        ),
      ),
      subtitle: Text(
        item.subtitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Default_Theme.secondoryTextStyle.merge(
          TextStyle(
            fontSize: 11,
            color: Default_Theme.primaryColor1.withOpacity(0.6),
          ),
        ),
      ),
      trailing: Text(
        '${item.playCount} plays',
        style: Default_Theme.secondoryTextStyle.merge(
          TextStyle(
            fontSize: 11,
            color: Default_Theme.primaryColor1.withOpacity(0.5),
          ),
        ),
      ),
      onTap: () {
        if (item.mediaItem != null) {
          context.read<BloomeePlayerCubit>().bloomeePlayer.updateQueue(
            [item.mediaItem!],
            doPlay: true,
          );
        }
      },
    );
  }
}

class _TopArtistItem extends StatelessWidget {
  final TopContentItem item;
  final int rank;

  const _TopArtistItem({
    required this.item,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 24,
            child: Text(
              '$rank',
              textAlign: TextAlign.center,
              style: Default_Theme.primaryTextStyle.merge(
                TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: rank <= 3
                      ? Default_Theme.accentColor2
                      : Default_Theme.primaryColor1.withOpacity(0.5),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              item.imageUrl ?? '',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Default_Theme.primaryColor1.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    MingCute.user_4_fill,
                    color: Default_Theme.accentColor2,
                    size: 20,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      title: Text(
        item.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Default_Theme.secondoryTextStyle.merge(
          const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Default_Theme.primaryColor1,
          ),
        ),
      ),
      subtitle: Text(
        item.subtitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Default_Theme.secondoryTextStyle.merge(
          TextStyle(
            fontSize: 11,
            color: Default_Theme.primaryColor1.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}
