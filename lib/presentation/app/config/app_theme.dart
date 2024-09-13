import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/app/config/app_colors.dart';

class AppTheme {
    ThemeData theme(){
      return ThemeData(
        primaryColor: AppColors.primaryColor,
        useMaterial3: true
      );
    }
}