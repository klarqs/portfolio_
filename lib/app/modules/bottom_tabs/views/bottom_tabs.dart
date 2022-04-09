import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lots_/app/modules/dashboard/dashboard.dart';
import 'package:lots_/app/utils/colors.dart';

import '../../../utils/assets.dart';

class BottomTabs extends StatefulWidget {
  final int tabIndex;

  const BottomTabs({Key? key, this.tabIndex = 0}) : super(key: key);
  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int _currentIndex = 0;
  final List<Map<String, dynamic>> _children = [];

  @override
  void initState() {
    _children.add({
      "title": "Home",
      "widget": Dashboard(),
    });
    _children.add({
      "title": "Leaderboard",
      "widget": Container(),
    });
    _children.add({
      "title": "Wallet",
      "widget": Container(),
    });
    _children.add({
      "title": "E-shop",
      "widget": Container(),
    });
    _children.add({
      "title": "More",
      "widget": Container(),
    });
    _currentIndex = widget.tabIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        highlightElevation: 0,
        disabledElevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        backgroundColor: CustomColors.primaryYellow,
        onPressed: () {},
        child: Image.asset(Assets.homeNaira),
      ),
      bottomNavigationBar: SizedBox(
        height: 72,
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
          ),
          child: BottomAppBar(
            color: CustomColors.primaryYellow,
            shape: const CircularNotchedRectangle(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              height: 56,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/svg_assets/fluent_savings-16-filled.svg',
                      color: _currentIndex == 0 ? Colors.white : Colors.white70,
                    ),
                    onPressed: () {
                      HapticFeedback.selectionClick();
                      setState(() => _currentIndex = 0);
                    },
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/svg_assets/wallet.png',
                      color: _currentIndex == 1 ? Colors.white : Colors.white70,
                      height: 22,
                    ),
                    onPressed: () {
                      HapticFeedback.selectionClick();
                      setState(() => _currentIndex = 1);
                    },
                  ),
                  const SizedBox(width: 48), // The dummy child
                  IconButton(
                    icon: Image.asset(
                      'assets/svg_assets/person.png',
                      height: 22,
                      color: _currentIndex == 3 ? Colors.white : Colors.white70,
                    ),
                    onPressed: () {
                      HapticFeedback.selectionClick();
                      setState(() => _currentIndex = 3);
                    },
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/svg_assets/shop.png',
                      height: 22,
                      color: _currentIndex == 4 ? Colors.white : Colors.white70,
                    ),
                    onPressed: () {
                      HapticFeedback.selectionClick();
                      setState(() => _currentIndex = 4);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: _children.length >= 3
          ? _children[_currentIndex]['widget']
          : Container(),
    );
  }
}
