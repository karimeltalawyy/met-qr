import 'package:flutter/material.dart';
import 'package:metqr/shared/component/constants/constants.dart';
import 'package:metqr/widgets/defaultButton.dart';

class LecturerLayout extends StatelessWidget {
  const LecturerLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surfaceColor,
      appBar: AppBar(
        title: appTitle(context),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(basePadding),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 52),
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: whiteColor,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good morning Dr,Mustafa!',
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Start new session to take student attendance now.',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.grey.shade600,
                                ),
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                width: 500,
                                height: 55,
                                decoration: BoxDecoration(
                                  color: defaultColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Start session',
                                      style: Theme.of(context)
                                          .textTheme
                                          .button!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 32),
                      // const Spacer(),
                      SizedBox(
                        width: 200,
                        height: 400,
                        child: Image.asset(
                          'assets/images/doc.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget appTitle(BuildContext context) => Text(
        'METQ.',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
      );
}
