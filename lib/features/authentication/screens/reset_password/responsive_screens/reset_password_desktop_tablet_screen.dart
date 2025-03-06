import 'package:ecommerce_admin_panel/common/widgets/layouts/templates/login_template.dart';
import 'package:ecommerce_admin_panel/routes/app_routes.dart';
import 'package:ecommerce_admin_panel/utils/constants/app_sizes.dart';
import 'package:ecommerce_admin_panel/utils/constants/app_texts.dart';
import 'package:ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../widgets/reset_password_widget.dart';

class ResetPasswordDesktopTabletScreen extends StatelessWidget {
  const ResetPasswordDesktopTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final email = Get.parameters['email'] ?? '';
    return LoginTemplate(
      child: ResetPasswordWidget(),
    );
  }
}

