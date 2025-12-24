import 'package:Bloomee/blocs/dashboard/cubit/dashboard_cubit.dart';
import 'package:Bloomee/blocs/notification/notification_cubit.dart';
import 'package:Bloomee/screens/screen/home_views/notification_view.dart';
import 'package:Bloomee/screens/screen/home_views/setting_view.dart';
import 'package:Bloomee/screens/screen/home_views/setting_views/about.dart';
import 'package:Bloomee/screens/screen/home_views/timer_view.dart';
import 'package:Bloomee/screens/widgets/dashboard/recent_activity_widget.dart';
import 'package:Bloomee/screens/widgets/dashboard/stats_card_widget.dart';
import 'package:Bloomee/screens/widgets/dashboard/top_content_widget.dart';
import 'package:Bloomee/screens/widgets/sign_board_widget.dart';
import 'package:Bloomee/theme_data/default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:badges/badges.dart' as badges;

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => DashboardCubit(),
        child: Scaffold(
          body: RefreshIndicator(
            onRefresh: () async {
              await context.read<DashboardCubit>().refresh();
            },
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                const _DashboardAppBar(),
                SliverToBoxAdapter(
                  child: BlocBuilder<DashboardCubit, DashboardState>(
                    builder: (context, state) {
                      if (state.isLoading &&
                          state.recentActivity.mediaItems.isEmpty) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(40.0),
                            child: CircularProgressIndicator(
                              color: Default_Theme.accentColor2,
                            ),
                          ),
                        );
                      }

                      if (!state.isLoading &&
                          state.recentActivity.mediaItems.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.all(40.0),
                          child: SignBoardWidget(
                            message:
                                'Start listening to music to see your stats!',
                            icon: MingCute.music_2_line,
                          ),
                        );
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          StatsCardWidget(stats: state.listeningStats),
                          const SizedBox(height: 24),
                          RecentActivityWidget(
                              recentActivity: state.recentActivity),
                          const SizedBox(height: 24),
                          TopContentWidget(
                            topSongs: state.topSongs,
                            topArtists: state.topArtists,
                            selectedPeriod: state.selectedPeriod,
                            onPeriodChanged: (period) {
                              context
                                  .read<DashboardCubit>()
                                  .changePeriod(period);
                            },
                          ),
                          const SizedBox(height: 40),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Default_Theme.themeColor,
        ),
      ),
    );
  }
}

class _DashboardAppBar extends StatelessWidget {
  const _DashboardAppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      surfaceTintColor: Default_Theme.themeColor,
      backgroundColor: Default_Theme.themeColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Dashboard',
            style: Default_Theme.primaryTextStyle.merge(
              const TextStyle(
                fontSize: 34,
                color: Default_Theme.primaryColor1,
              ),
            ),
          ),
          const Spacer(),
          const _NotificationIcon(),
          const _SiteIcon(),
          const _TimerIcon(),
          const _SettingsIcon(),
        ],
      ),
    );
  }
}

class _NotificationIcon extends StatelessWidget {
  const _NotificationIcon();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        if (state is NotificationInitial || state.notifications.isEmpty) {
          return IconButton(
            padding: const EdgeInsets.all(5),
            constraints: const BoxConstraints(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationView(),
                ),
              );
            },
            icon: const Icon(
              MingCute.notification_line,
              color: Default_Theme.primaryColor1,
              size: 30.0,
            ),
          );
        }
        return badges.Badge(
          badgeContent: Padding(
            padding: const EdgeInsets.all(1.5),
            child: Text(
              state.notifications.length.toString(),
              style: Default_Theme.primaryTextStyle.merge(
                const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Default_Theme.primaryColor2,
                ),
              ),
            ),
          ),
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Default_Theme.accentColor2,
            shape: badges.BadgeShape.circle,
          ),
          position: badges.BadgePosition.topEnd(top: -10, end: -5),
          child: IconButton(
            padding: const EdgeInsets.all(5),
            constraints: const BoxConstraints(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationView(),
                ),
              );
            },
            icon: const Icon(
              MingCute.notification_line,
              color: Default_Theme.primaryColor1,
              size: 30.0,
            ),
          ),
        );
      },
    );
  }
}

class _TimerIcon extends StatelessWidget {
  const _TimerIcon();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(5),
      constraints: const BoxConstraints(),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TimerView()),
        );
      },
      icon: const Icon(
        MingCute.stopwatch_line,
        color: Default_Theme.primaryColor1,
        size: 30.0,
      ),
    );
  }
}

class _SettingsIcon extends StatelessWidget {
  const _SettingsIcon();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(5),
      constraints: const BoxConstraints(),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SettingsView()),
        );
      },
      icon: const Icon(
        MingCute.settings_3_line,
        color: Default_Theme.primaryColor1,
        size: 30.0,
      ),
    );
  }
}

class _SiteIcon extends StatelessWidget {
  const _SiteIcon();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(5),
      constraints: const BoxConstraints(),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const About()),
        );
      },
      icon: const Icon(
        MingCute.flower_4_fill,
        color: Default_Theme.primaryColor1,
        size: 28.0,
      ),
    );
  }
}
