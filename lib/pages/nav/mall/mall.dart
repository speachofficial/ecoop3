import 'package:flutter/material.dart';

import '../../../widgets/notavailable.dart';

class MainMallPageContent extends StatefulWidget {
  const MainMallPageContent({super.key});

  @override
  State<MainMallPageContent> createState() => _MainMallPageContentState();
}

class _MainMallPageContentState extends State<MainMallPageContent> {
  @override
  Widget build(BuildContext context) {
    return const NotAvailableNotice();
  }
}
