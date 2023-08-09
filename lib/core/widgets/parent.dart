// ignore_for_file: library_private_types_in_public_api

import 'package:time2Travel/utils/utils.dart';
import 'package:flutter/material.dart';

class Parent extends StatefulWidget {
  final Widget? child;
  final PreferredSize? appBar;
  final bool avoidBottomInset;
  final Widget? floatingButton;
  final Widget? bottomNavigation;
  final Widget? drawer;
  final Widget? endDrawer;
  final Color? backgroundColor;
  final Key? scaffoldKey;
  final bool extendBodyBehindAppBar;
  final String? backgroundAsset;

  const Parent({
    super.key,
    this.child,
    this.appBar,
    this.avoidBottomInset = true,
    this.floatingButton,
    this.backgroundColor,
    this.bottomNavigation,
    this.drawer,
    this.scaffoldKey,
    this.endDrawer,
    this.extendBodyBehindAppBar = false,
    this.backgroundAsset,
  });

  @override
  _ParentState createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          key: widget.scaffoldKey,
          backgroundColor: widget.backgroundColor,
          resizeToAvoidBottomInset: widget.avoidBottomInset,
          extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
          appBar: widget.appBar,
          body: widget.backgroundAsset != null
              ? Container(
                  height: context.height,
                  width: context.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.backgroundAsset!),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: widget.child,
                )
              : widget.child,
          drawer: widget.drawer,
          endDrawer: widget.endDrawer,
          floatingActionButton: widget.floatingButton,
          bottomNavigationBar: widget.bottomNavigation,
        ),
      ),
    );
  }
}
