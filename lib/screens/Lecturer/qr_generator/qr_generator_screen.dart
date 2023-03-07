import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRGeneratorScreen extends StatelessWidget {
  const QRGeneratorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QrImage(
      data: 'This QR code has an embedded image as well',
      version: QrVersions.auto,
      size: 320,
      gapless: false,
      embeddedImage: AssetImage('assets/images/my_embedded_image.png'),
      embeddedImageStyle: QrEmbeddedImageStyle(
        size: Size(80, 80),
      ),
    );
  }
}
