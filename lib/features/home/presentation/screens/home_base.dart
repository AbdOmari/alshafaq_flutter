import 'package:ashafaq/config/resources/image_manger.dart';
import 'package:ashafaq/config/router/navigation_cubit.dart';
import 'package:ashafaq/config/shared/drawer/app_drawer.dart';
import 'package:ashafaq/core/directions_handler/text_direction_handler.dart';
import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class HomeBase extends StatelessWidget {
  const HomeBase({super.key, required this.child});
  final Widget child;
  static GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(padding: const EdgeInsets.only(top: 40), child: child),
      bottomNavigationBar: const AnimatedBottomNavBar(),
      drawer: AppDrawer(scaffoldKey: _scaffoldKey),
    );
  }
}

class AnimatedBottomNavBar extends StatefulWidget {
  const AnimatedBottomNavBar({super.key});

  @override
  State<AnimatedBottomNavBar> createState() => _AnimatedBottomNavBarState();
}

class _AnimatedBottomNavBarState extends State<AnimatedBottomNavBar>
    with SingleTickerProviderStateMixin {
  final List<String> _icons = [
    ImageManger.homeIcon,
    ImageManger.requestsIcon,
    ImageManger.subscriptionsIcon,
    ImageManger.chatIcon,
    ImageManger.moreIcon,
  ];

  List<String> _labels(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return [
      appLocalizations.home,
      appLocalizations.requests,
      appLocalizations.subscriptions,
      appLocalizations.chats,
      appLocalizations.more,
    ];
  }

  final double _circleSize = 57;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final d = Dimensions(size);
    double itemWidth = size.width / _icons.length;
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: Builder(
        builder: (context) {
          return SizedBox(
            height: d.getComponentH(uiH: 114),
            child: BlocBuilder<NavigationCubit, int>(
              builder: (context, state) {
                final textDir = TextDirectionHandler.getDirection(context);
                final isLtr = textDir == TextDirection.ltr;
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      left:
                          isLtr
                              ? state * itemWidth +
                                  itemWidth / 2 -
                                  _circleSize / 2
                              : null,
                      right:
                          !isLtr
                              ? state * itemWidth +
                                  itemWidth / 2 -
                                  _circleSize / 2
                              : null,
                      top: 7,
                      child: Container(
                        width: _circleSize,
                        height: _circleSize,
                        decoration: const BoxDecoration(
                          color: Color(0xff1A1E51),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(_icons.length, (index) {
                          final isSelected = state == index;
                          return Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                if (index == _icons.length - 1) {
                                  _scaffoldKey.currentState?.openDrawer();

                                  return;
                                }
                                if (!isSelected) {
                                  context.read<NavigationCubit>().navigateTo(
                                    index,
                                  );
                                  context.go(homeRoutes[index]);
                                }
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: isSelected ? 10 : 20),
                                  SvgPicture.asset(
                                    _icons[index],

                                    color:
                                        isSelected
                                            ? Colors.white
                                            : Colors.black,
                                    width: 26,
                                    height: 26,
                                  ),
                                  SizedBox(height: isSelected ? 15 : 10),
                                  const SizedBox(height: 5),
                                  AnimatedDefaultTextStyle(
                                    duration: const Duration(milliseconds: 300),
                                    style: TextStyle(
                                      color:
                                          isSelected
                                              ? const Color(0xff1A1E51)
                                              : Colors.black,
                                      fontSize: 10,
                                      fontWeight:
                                          isSelected
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                    ),
                                    child: Text(_labels(context)[index]),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
