import 'package:flutter/material.dart';
import 'package:project_name_change/app/constants/app_colors.dart';

class BaseAppbar extends StatelessWidget implements PreferredSizeWidget{
  String title;
  VoidCallback? leadingAction;
  List<Widget> actions = [];
  bool isHome = false;
  BaseAppbar({required this.title,
   this.leadingAction,
    List<Widget> actions = const [], 
    this.isHome = false,
    super.key,
    });
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      leading: !isHome ? IconButton(
        onPressed: leadingAction ?? () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back_ios)
      ) : null,
      title: Text(title),
      actions: [
        ...actions
      ],
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);

  
}