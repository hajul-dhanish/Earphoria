import 'package:Bloomee/theme_data/default.dart';
import 'package:flutter/material.dart';

class HorizontalCardView extends StatelessWidget {
  final Map<String, dynamic> data;

  const HorizontalCardView({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final String title = data['title'] ?? 'Unknown';
    final List<dynamic> contents = data['contents'] ?? [];

    if (contents.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            title,
            style: Default_Theme.primaryTextStyle.merge(
              const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Default_Theme.primaryColor1,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            itemCount: contents.length,
            itemBuilder: (context, index) {
              final item = contents[index];
              return _buildCard(context, item);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context, Map<String, dynamic> item) {
    final String title = item['title'] ?? 'Unknown';
    final String subtitle = item['subtitle'] ?? '';
    final String imageUrl = item['image'] ?? '';

    return Container(
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      child: InkWell(
        onTap: () {
          // Handle tap - you can implement navigation to playlist/album view
          _handleCardTap(context, item);
        },
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Album/Playlist artwork
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: imageUrl.isNotEmpty
                  ? Image.network(
                      imageUrl,
                      height: 160,
                      width: 160,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _buildPlaceholder();
                      },
                    )
                  : _buildPlaceholder(),
            ),
            const SizedBox(height: 8),
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Default_Theme.primaryTextStyle.merge(
                  const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Default_Theme.primaryColor1,
                  ),
                ),
              ),
            ),
            // Subtitle
            if (subtitle.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Default_Theme.secondoryTextStyle.merge(
                    const TextStyle(
                      fontSize: 12,
                      color: Default_Theme.primaryColor2,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      height: 160,
      width: 160,
      decoration: BoxDecoration(
        color: Default_Theme.primaryColor2.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.music_note,
        size: 60,
        color: Default_Theme.primaryColor2,
      ),
    );
  }

  void _handleCardTap(BuildContext context, Map<String, dynamic> item) {
    // TODO: Implement navigation to playlist/album detail view
    // You can use the browseId to fetch more details
    // For now, this is a placeholder
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Tapped: ${item['title']}'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
