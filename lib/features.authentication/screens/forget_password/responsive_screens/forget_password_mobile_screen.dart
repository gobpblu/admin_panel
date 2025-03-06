import 'package:ecommerce_admin_panel/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';

import '../widgets/header_and_form.dart';

class ForgetPasswordMobileScreen extends StatelessWidget {
  const ForgetPasswordMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: HeaderAndForm(),
        ),
      ),
    );
  }
}
