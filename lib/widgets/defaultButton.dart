import 'package:flutter/material.dart';
import 'package:metqr/shared/component/constants/constants.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class DefaultButton extends StatefulWidget {
  const DefaultButton({Key? key}) : super(key: key);

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  final qrController = TextEditingController();

  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSheet(context);
      },
      child: Container(
        width: double.infinity,
        height: 51,
        decoration: BoxDecoration(
            color: defaultColor, borderRadius: BorderRadius.circular(50)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.qr_code_scanner_outlined,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Text(
              'Scan Qr Code',
              style: Theme.of(context).textTheme.button!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Future showSheet(context) => showSlidingBottomSheet(
        context,
        builder: (context) => SlidingSheetDialog(
          avoidStatusBar: true,
          cornerRadius: 15,
          snapSpec: const SnapSpec(
            initialSnap: 0.9,
            snappings: [.4, 0.9],
          ),
          builder: buildSheet,
        ),
      );

  Widget buildSheet(context, state) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(basePadding),
          child: Column(
            children: [
              Text(
                'Scan the qr code',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 6),
              Text(
                'Scan QR code now to take attendance in this lecture',
                style: Theme.of(context).textTheme.caption,
              ),
              const SizedBox(height: 12),
              // QrImage(
              //   data: qrController.text,
              //   size: 400,
              // ),
              Container(
                width: double.infinity,
                height: 400,
                color: Colors.black,
                child: buildQRView(context),
              ),
            ],
          ),
        ),
      );

  Widget buildQRView(BuildContext context) =>
      QRView(key: qrKey, onQRViewCreated: onQRViewCreated);

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
  }
}
