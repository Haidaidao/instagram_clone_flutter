import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:instagram_clone/utils/global_variable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResponsiveLayout extends ConsumerWidget {
  const ResponsiveLayout(
      {super.key,
      required this.webScreenLayout,
      required this.mobileScreenLayout});

  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // ref.read(UserProvider.notifier).getUserFromData();
    
    return LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth > webScreenSize) return webScreenLayout;
      return mobileScreenLayout;
    });
  }
}
