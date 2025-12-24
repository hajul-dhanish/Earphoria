import 'package:Bloomee/blocs/explore/cubit/explore_cubits.dart';
import 'package:Bloomee/blocs/settings_cubit/cubit/settings_cubit.dart';
import 'package:Bloomee/screens/screen/chart/chart_widget.dart';
import 'package:Bloomee/screens/screen/chart/show_charts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, settingsState) {
        // Filter charts based on user settings
        final allowedCharts = chartInfoList
            .where((chart) => settingsState.chartMap[chart.title] ?? true)
            .toList();

        if (allowedCharts.isEmpty) {
          return const SizedBox.shrink();
        }

        return CarouselSlider.builder(
          itemCount: allowedCharts.length,
          itemBuilder: (context, index, realIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: BlocProvider(
                create: (context) => ChartCubit(
                  allowedCharts[index],
                  context.read<FetchChartCubit>(),
                ),
                child: ChartWidget(chartInfo: allowedCharts[index]),
              ),
            );
          },
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.35,
            enlargeCenterPage: true,
            autoPlay: settingsState.autoSlideCharts,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            viewportFraction: 0.8,
          ),
        );
      },
    );
  }
}
