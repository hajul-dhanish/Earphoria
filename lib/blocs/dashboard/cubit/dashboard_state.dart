// ignore_for_file: public_member_api_docs

part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  final ListeningStats listeningStats;
  final List<TopContentItem> topSongs;
  final List<TopContentItem> topArtists;
  final MediaPlaylist recentActivity;
  final List<ListeningTrend> listeningTrends;
  final DashboardPeriod selectedPeriod;
  final bool isLoading;

  const DashboardState({
    required this.listeningStats,
    required this.topSongs,
    required this.topArtists,
    required this.recentActivity,
    required this.listeningTrends,
    this.selectedPeriod = DashboardPeriod.week,
    this.isLoading = false,
  });

  factory DashboardState.initial() {
    return DashboardState(
      listeningStats: ListeningStats.empty(),
      topSongs: const [],
      topArtists: const [],
      recentActivity: const MediaPlaylist(
        mediaItems: [],
        playlistName: 'Recent Activity',
      ),
      listeningTrends: const [],
      selectedPeriod: DashboardPeriod.week,
      isLoading: true,
    );
  }

  DashboardState copyWith({
    ListeningStats? listeningStats,
    List<TopContentItem>? topSongs,
    List<TopContentItem>? topArtists,
    MediaPlaylist? recentActivity,
    List<ListeningTrend>? listeningTrends,
    DashboardPeriod? selectedPeriod,
    bool? isLoading,
  }) {
    return DashboardState(
      listeningStats: listeningStats ?? this.listeningStats,
      topSongs: topSongs ?? this.topSongs,
      topArtists: topArtists ?? this.topArtists,
      recentActivity: recentActivity ?? this.recentActivity,
      listeningTrends: listeningTrends ?? this.listeningTrends,
      selectedPeriod: selectedPeriod ?? this.selectedPeriod,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        listeningStats,
        topSongs,
        topArtists,
        recentActivity,
        listeningTrends,
        selectedPeriod,
        isLoading,
      ];
}
