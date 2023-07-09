import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social/providers/user_provider.dart';
import 'package:social/utils/glob_var.dart';

class Responsiveness extends StatefulWidget {
  final Widget webScreenLay;
  final Widget mobileScreenLay;
  const Responsiveness(
      {super.key, required this.webScreenLay, required this.mobileScreenLay});

  @override
  State<Responsiveness> createState() => _ResponsivenessState();
}

class _ResponsivenessState extends State<Responsiveness> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          //web screen
          return widget.webScreenLay;
        }
        //mobile screen
        return widget.mobileScreenLay;
      },
    );
  }
}
