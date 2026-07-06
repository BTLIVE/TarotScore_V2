import 'package:flutter/material.dart';

class AppListTile extends StatelessWidget {
  final Widget title;

  final Widget? subtitle;

  final Widget? leading;

  final Widget? trailing;

  final VoidCallback? onTap;

  const AppListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
    );
  }
}