// ignore_for_file: public_member_api_docs

import 'package:Bloomee/model/songModel.dart';

/// Represents overall listening statistics for the user
class ListeningStats {
  final int totalPlayCount;
  final Duration totalListeningTime;
  final int favoriteSongsCount;
  final int downloadedSongsCount;
  final int playlistsCount;

  const ListeningStats({
    required this.totalPlayCount,
    required this.totalListeningTime,
    required this.favoriteSongsCount,
    required this.downloadedSongsCount,
    required this.playlistsCount,
  });

  factory ListeningStats.empty() {
    return const ListeningStats(
      totalPlayCount: 0,
      totalListeningTime: Duration.zero,
      favoriteSongsCount: 0,
      downloadedSongsCount: 0,
      playlistsCount: 0,
    );
  }

  String get formattedListeningTime {
    final hours = totalListeningTime.inHours;
    final minutes = totalListeningTime.inMinutes.remainder(60);

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}

/// Represents top content (songs or artists) with play counts
class TopContentItem {
  final String id;
  final String title;
  final String subtitle;
  final String? imageUrl;
  final int playCount;
  final MediaItemModel? mediaItem; // For songs

  const TopContentItem({
    required this.id,
    required this.title,
    required this.subtitle,
    this.imageUrl,
    required this.playCount,
    this.mediaItem,
  });
}

/// Represents listening trends over a time period
class ListeningTrend {
  final DateTime date;
  final int playCount;
  final Duration listeningTime;

  const ListeningTrend({
    required this.date,
    required this.playCount,
    required this.listeningTime,
  });
}

/// Time period for filtering dashboard data
enum DashboardPeriod {
  week,
  month,
  allTime;

  String get label {
    switch (this) {
      case DashboardPeriod.week:
        return 'This Week';
      case DashboardPeriod.month:
        return 'This Month';
      case DashboardPeriod.allTime:
        return 'All Time';
    }
  }

  DateTime get startDate {
    final now = DateTime.now();
    switch (this) {
      case DashboardPeriod.week:
        return now.subtract(const Duration(days: 7));
      case DashboardPeriod.month:
        return now.subtract(const Duration(days: 30));
      case DashboardPeriod.allTime:
        return DateTime(2000); // Far past date
    }
  }
}
