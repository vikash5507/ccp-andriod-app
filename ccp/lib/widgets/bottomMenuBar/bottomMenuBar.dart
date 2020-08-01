// import 'package:fancy_bottom_navigation/internal/tab_item.dart';
import 'package:ccp/helper/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ccp/helper/constant.dart';
import 'package:ccp/state/appState.dart';
import 'package:ccp/state/authState.dart';
import 'package:ccp/widgets/bottomMenuBar/tabItem.dart';
import 'package:provider/provider.dart';
import '../customWidgets.dart';
// import 'customBottomNavigationBar.dart';

class BottomMenubar extends StatefulWidget {
  const BottomMenubar({this.pageController});
  final PageController pageController;
  _BottomMenubarState createState() => _BottomMenubarState();
}

class _BottomMenubarState extends State<BottomMenubar> {
  PageController _pageController;
  int _selectedIcon = 0;
  static const double CreateButtonWidth = 40.0;
  @override
  void initState() {
    _pageController = widget.pageController;
    super.initState();
  }

  Widget _iconRow() {
    var state = Provider.of<AppState>(
      context,
    );
    return Container(
      height: 55,
      decoration:
          BoxDecoration(color: Theme.of(context).bottomAppBarColor, boxShadow: [
        BoxShadow(color: Colors.black12, offset: Offset(0, -.1), blurRadius: 0)
      ]),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _icon(Icons.home, 0,
              icon: 0 == state.pageIndex ? AppIcon.homeFill : AppIcon.home,
              isCustomIcon: false),
          _icon(Icons.search, 1,
              icon: 1 == state.pageIndex ? AppIcon.searchFill : AppIcon.search,
              isCustomIcon: false),
          customCreateIcon,
          _icon(
              2 == state.pageIndex
                  ? Icons.notifications
                  : Icons.notifications_none,
              2,
              icon: 2 == state.pageIndex
                  ? AppIcon.notificationFill
                  : AppIcon.notification,
              isCustomIcon: false),
          _icon(3 == state.pageIndex ? Icons.mail : Icons.mail_outline, 3,
              icon: 3 == state.pageIndex
                  ? AppIcon.messageFill
                  : AppIcon.messageEmpty,
              isCustomIcon: false),
        ],
      ),
    );
  }

  Widget _icon(IconData iconData, int index,
      {bool isCustomIcon = false, int icon}) {
    var state = Provider.of<AppState>(
      context,
    );
    return Expanded(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: AnimatedAlign(
          duration: Duration(milliseconds: ANIM_DURATION),
          curve: Curves.easeIn,
          alignment: Alignment(0, ICON_ON),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: ANIM_DURATION),
            opacity: ALPHA_ON,
            child: IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              padding: EdgeInsets.all(0),
              alignment: Alignment(0, 0),
              icon: isCustomIcon
                  ? customIcon(context,
                      icon: icon,
                      size: 24,
                      istwitterIcon: true,
                      isEnable: index == state.pageIndex)
                  : Icon(
                      iconData,
                      color: index == state.pageIndex
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).textTheme.caption.color,
                      size: 28,
                    ),
              onPressed: () {
                setState(() {
                  _selectedIcon = index;
                  state.setpageIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget get customCreateIcon => InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/CreateFeedPage/tweet');
        },
        child: Container(
            width: 45.0,
            height: 40.0,
            margin: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Center(
                child: Container(
              height: double.infinity,
              width: CreateButtonWidth,
              decoration: BoxDecoration(
                  color: CcpColor.primary,
                  borderRadius: BorderRadius.circular(15.0)),
              child: Icon(Icons.add, size: 28.0, color: CcpColor.white),
            ))),
      );

  @override
  Widget build(BuildContext context) {
    return _iconRow();
  }
}
