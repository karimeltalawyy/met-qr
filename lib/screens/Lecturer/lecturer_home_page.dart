import 'package:flutter/material.dart';
import 'package:metqr/shared/component/buttons.dart';
import 'package:metqr/widgets/defaultButton.dart';

import '../../shared/component/constants/constants.dart';

class LecturerHomePage extends StatelessWidget {
  const LecturerHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(basePadding),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   children: [
            //     Expanded(
            //         child: Container(
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 32, vertical: 52),
            //       height: 250,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(15),
            //         color: whiteColor,
            //       ),
            //       child: Row(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text(
            //                 'Good morning Dr,Mustafa!',
            //                 style:
            //                     Theme.of(context).textTheme.headline4!.copyWith(
            //                           fontWeight: FontWeight.bold,
            //                           color: Colors.black,
            //                         ),
            //               ),
            //               const SizedBox(height: 8),
            //               Text(
            //                 'Start new session to take student attendance now.',
            //                 style: Theme.of(context)
            //                     .textTheme
            //                     .titleMedium!
            //                     .copyWith(
            //                       color: Colors.grey.shade600,
            //                     ),
            //               ),
            //               const SizedBox(height: 16),
            //               Expanded(
            //                 child: InkWell(
            //                   onTap: () {},
            //                   child: Container(
            //                     width: 500,
            //                     height: 55,
            //                     decoration: BoxDecoration(
            //                       color: defaultColor,
            //                       borderRadius: BorderRadius.circular(25),
            //                     ),
            //                     child: Row(
            //                       crossAxisAlignment: CrossAxisAlignment.center,
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       children: [
            //                         Text(
            //                           'Start session',
            //                           style: Theme.of(context)
            //                               .textTheme
            //                               .button!
            //                               .copyWith(
            //                                 color: Colors.white,
            //                               ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //           const SizedBox(width: 32),
            //           // const Spacer(),
            //           SizedBox(
            //             width: 200,
            //             height: 400,
            //             child: Image.asset(
            //               'assets/images/doc.png',
            //               fit: BoxFit.cover,
            //             ),
            //           ),
            //         ],
            //       ),
            //     )),
            //   ],
            // ),
            // Container(
            //   height: 200,
            //   width: 80,
            //   color: Colors.black,
            // ),
            // const SizedBox(height: 12),
            // Row(
            //   children: [
            //     Expanded(
            //       child: Container(
            //         height: 200,
            //         color: Colors.black45,
            //       ),
            //     ),
            //     Expanded(
            //       child: Container(
            //         // height: 200,
            //         color: Colors.black,
            //       ),
            //     ),
            //   ],
            // ),
            Container(
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.height / 3,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Good morning doctor Mark,',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.black87,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Start new session to take student attendance now.',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.grey.shade500,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  DefaultButtonLecturer(
                    text: 'Start session',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            //sidebar
            Container(
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.height / 1.8,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
