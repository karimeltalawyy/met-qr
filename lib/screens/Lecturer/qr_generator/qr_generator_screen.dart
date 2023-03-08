import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:metqr/model/SessionSchudle.dart';
import 'package:metqr/providers/auth_provider.dart';
import 'package:metqr/providers/session_provider.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRGeneratorScreen extends StatelessWidget {
  const QRGeneratorScreen({
    Key? key,
    this.session,
  }) : super(key: key);
  final Session? session;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final id = auth.lecturerModel!.id;

    print(auth.lecturerModel!.id!);

    return id != null
        ? FutureBuilder(
            future: Provider.of<SessionProvider>(context)
                .getCurrentLecture(lecturerId: auth.lecturerModel!.id!),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const SizedBox.shrink();
              }
              return QrImage(
                data: json.encode(session!.toJson()),
                version: QrVersions.auto,
                backgroundColor: Colors.white,
                size: 320,
                gapless: false,
                embeddedImageStyle: QrEmbeddedImageStyle(
                  size: const Size(80, 80),
                ),
              );
            })
        : const CircularProgressIndicator();
  }
}
