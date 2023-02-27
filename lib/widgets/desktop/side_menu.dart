import 'package:flutter/material.dart';
import 'package:metqr/shared/component/constants/constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(basePadding),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'METQ.',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black45,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
