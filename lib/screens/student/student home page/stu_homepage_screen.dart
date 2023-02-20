import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/cubit/cubit.dart';
import '../../../layout/cubit/states.dart';
import '../../../shared/component/constants/constants.dart';
import '../../../widgets/attendance_card.dart';
import '../../../widgets/defaultButton.dart';
import '../../../widgets/today_schedule_card.dart';
import '../../../widgets/searchbar.dart';

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({Key? key}) : super(key: key);
  final double basePadding = 20;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: surfaceColor,
          body: Padding(
            padding: EdgeInsets.all(basePadding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SearchBar(),
                  const SizedBox(height: 26),
                  const AttendanceCard(),
                  const SizedBox(height: 16),
                  _buildActivityTitle(context),
                  const SizedBox(height: 8),
                  _buildActivityItem(),
                  const SizedBox(height: 16),
                  _buildScheduleTitle(context),
                  const SizedBox(height: 8),
                  const TodayScheduleCard(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildActivityTitle(context) => Text(
        'Activity',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
      );

  Widget _buildScheduleTitle(context) => Text(
        'Today\'s Schedule',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
      );

  Widget _buildActivityItem() => Container(
    height: 45,
    child: ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => InkWell(
        onTap: (){},
        child: AnimatedContainer(
          curve: Curves.fastOutSlowIn,
          duration: const Duration(milliseconds: 400),
          width: 200,
          height: 20,
          decoration: BoxDecoration(
            border: Border.all(width: .6, color: surfaceColor),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(
                  Icons.person_search_rounded,
                  color: secondaryColor,
                ),
                SizedBox(width: 12),
                Text('Attendance'),
              ],
            ),
          ),
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(width: 12),
      itemCount: 6,
    ),
  );
}
