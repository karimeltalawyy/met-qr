import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../providers/session_provider.dart';
import '../../shared/component/constants/constants.dart';

class DropDownFutureItem extends HookWidget {
  const DropDownFutureItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedLecture = useState<String>('0');
    final lecturerAuth = Provider.of<AuthProvider>(context);
    final textTheme = Theme.of(context).textTheme;
    return FutureBuilder(
      future: Provider.of<SessionProvider>(context).getLecture(
        lecturerId: lecturerAuth.lecturerModel!.id!,
      ),
      builder: (context, snapshot) {
        List<DropdownMenuItem> lecturesItems = [];

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          final lectures = snapshot.data?.toList();
          lecturesItems.add(
            const DropdownMenuItem(
              value: '0',
              child: Text('Select lecture'),
            ),
          );
          for (var items in lectures!) {
            lecturesItems.add(
              DropdownMenuItem(
                value: items.lectureId,
                child: Text(
                  items.name!,
                ),
              ),
            );
          }
          return DropdownButtonFormField(
            decoration: defaultDropDownInputDecoration,
            items: lecturesItems,
            onChanged: (val) {
              selectedLecture.value = val;
              debugPrint(val);
            },
            value: selectedLecture.value,
            isExpanded: false,
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container();
      },
    );
  }
}
