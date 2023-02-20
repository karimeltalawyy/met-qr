import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metqr/shared/component/constants/constants.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';

class StudentLayoutPage extends StatelessWidget {
  const StudentLayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor:surfaceColor,
          appBar: AppBar(
            backgroundColor: surfaceColor,
            actions: AppCubit.get(context).currentIndex==0 ?[
               IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_outlined),
              ),
            ]:<Widget>[],
            title:AppCubit.get(context).currentIndex==0 ? _buildTitleWidget(context):null,
            centerTitle: false,
          ),
          body: AppCubit.get(context).screens[AppCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              AppCubit.get(context).changeBottomNav(index);
            },
            currentIndex: AppCubit.get(context).currentIndex,
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
          ),
        );
      },
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
