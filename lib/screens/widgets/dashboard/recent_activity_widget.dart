import 'package:Bloomee/blocs/mediaPlayer/bloomee_player_cubit.dart';
import 'package:Bloomee/model/MediaPlaylistModel.dart';
import 'package:Bloomee/screens/widgets/more_bottom_sheet.dart';
import 'package:Bloomee/theme_data/default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class RecentActivityWidget extends StatelessWidget {
  final MediaPlaylist recentActivity;

  const RecentActivityWidget({
    super.key,
    required this.recentActivity,
  });

  @override
  Widget build(BuildContext context) {
    if (recentActivity.mediaItems.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Text(
            'Recent Activity',
            style: Default_Theme.secondoryTextStyle.merge(
              const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Default_Theme.accentColor2,
              ),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: recentActivity.mediaItems.length > 10
              ? 10
              : recentActivity.mediaItems.length,
          itemBuilder: (context, index) {
            final song = recentActivity.mediaItems[index];
            return ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  song.artUri?.toString() ?? '',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Default_Theme.primaryColor1.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        MingCute.music_2_fill,
                        color: Default_Theme.accentColor2,
                      ),
                    );
                  },
                ),
              ),
              title: Text(
                song.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Default_Theme.secondoryTextStyle.merge(
                  const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Default_Theme.primaryColor1,
                  ),
                ),
              ),
              subtitle: Text(
                song.artist ?? 'Unknown Artist',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Default_Theme.secondoryTextStyle.merge(
                  TextStyle(
                    fontSize: 12,
                    color: Default_Theme.primaryColor1.withOpacity(0.6),
                  ),
                ),
              ),
              trailing: IconButton(
                icon: const Icon(
                  MingCute.more_2_fill,
                  color: Default_Theme.primaryColor1,
                  size: 20,
                ),
                onPressed: () => showMoreBottomSheet(context, song),
              ),
              onTap: () {
                context.read<BloomeePlayerCubit>().bloomeePlayer.updateQueue(
                  [song],
                  doPlay: true,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
