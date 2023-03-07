import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:metqr/shared/component/constants/constants.dart';

import '../../screens/student/reports/reports_screen.dart';
import '../../screens/student/student home page/stu_homepage_screen.dart';
import '../../screens/student/student schedule/schedule_screen.dart';
import '../../screens/student/student settings/settings_screen.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class StudentLayoutPage extends HookWidget {
  const StudentLayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState<int>(0);
    final changeNavBar = useCallback(
      (index) {
        currentIndex.value = index;
      },
      ['changeNavBar'],
    );
    final screens = useState<List<Widget>>([
      const StudentHomePage(),
      const ScheduleScreen(),
      const ReportsScreen(),
      const SettingsScreen(),
    ]);
    return Scaffold(
      backgroundColor: surfaceColor,
      body: screens.value[currentIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          changeNavBar.call(index);
        },
        currentIndex: currentIndex.value,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_page_break_outlined),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildTitleWidget(context) => Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.deepOrange,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Morning',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                'Karim',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ],
      );
}
