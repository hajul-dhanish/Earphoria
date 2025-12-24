// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:developer';
import 'package:Bloomee/model/MediaPlaylistModel.dart';
import 'package:Bloomee/model/dashboard_models.dart';
import 'package:Bloomee/services/db/bloomee_db_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  StreamSubscription<void>? _recentlyPlayedWatcher;

  DashboardCubit() : super(DashboardState.initial()) {
    loadDashboardData();
    _watchRecentlyPlayed();
  }

  Future<void> _watchRecentlyPlayed() async {
    _recentlyPlayedWatcher =
        (await BloomeeDBService.watchRecentlyPlayed()).listen((event) {
      log('Recently played updated, refreshing dashboard', name: 'Dashboard');
      loadDashboardData();
    });
  }

  Future<void> loadDashboardData({DashboardPeriod? period}) async {
    emit(state.copyWith(isLoading: true));

    try {
      final selectedPeriod = period ?? state.selectedPeriod;

      // Load all dashboard data in parallel
      final results = await Future.wait([
        BloomeeDBService.getListeningStats(),
        BloomeeDBService.getTopSongs(
          limit: 10,
          since: selectedPeriod.startDate,
        ),
        BloomeeDBService.getTopArtists(
          limit: 10,
          since: selectedPeriod.startDate,
        ),
        BloomeeDBService.getRecentlyPlayed(limit: 20),
        BloomeeDBService.getListeningTrends(days: 7),
      ]);

      emit(state.copyWith(
        listeningStats: results[0] as ListeningStats,
        topSongs: results[1] as List<TopContentItem>,
        topArtists: results[2] as List<TopContentItem>,
        recentActivity: results[3] as MediaPlaylist,
        listeningTrends: results[4] as List<ListeningTrend>,
        selectedPeriod: selectedPeriod,
        isLoading: false,
      ));

      log('Dashboard data loaded successfully', name: 'Dashboard');
    } catch (e) {
      log('Error loading dashboard data: $e', name: 'Dashboard', error: e);
      emit(state.copyWith(isLoading: false));
    }
  }

  void changePeriod(DashboardPeriod period) {
    if (period != state.selectedPeriod) {
      loadDashboardData(period: period);
    }
  }

  Future<void> refresh() async {
    await loadDashboardData();
  }

  @override
  Future<void> close() {
    _recentlyPlayedWatcher?.cancel();
    return super.close();
  }
}
