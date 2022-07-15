import 'package:bnparisbas/widgets/appbar.dart';
import 'package:flutter/material.dart';

class DownloadRIB extends StatelessWidget {
  static const routeName = "/download_RIB";
  const DownloadRIB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const MyAppBar(title: "COMPTE DE CHÈQUES"),
      body: const Center(
        child: Text("Download RIB"),
      ),
    );
  }
}
