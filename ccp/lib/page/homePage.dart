import 'package:ccp/state/feedState.dart';
import 'package:flutter/material.dart';
import 'package:ccp/page/feed/feedPage.dart';
import 'package:ccp/page/message/chatListPage.dart';
import 'package:ccp/state/appState.dart';
import 'package:ccp/widgets/bottomMenuBar/bottomMenuBar.dart';
import 'package:provider/provider.dart';
import 'common/sidebar.dart';
import 'notification/notificationPage.dart';
import 'search/SearchPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();
  int pageIndex = 0;

  final PageStorageBucket bucket = PageStorageBucket();

  // final List<Widget> pages = [
  //   FeedPage(
  //     key: PageStorageKey('Page1'),
  //   ),
  //   SearchPage(
  //     key: PageStorageKey('Page2'),
  //   ),
  //   NotificationPage(
  //     key: PageStorageKey('Page3'),
  //   ),
  //   ChatListPage(
  //     key: PageStorageKey('Page4'),
  //   ),
  // ];


  // final FeedPage _feedPage = new FeedPage();
  // final SearchPage _searchPage = new SearchPage();
  // final NotificationPage _notificationPage = new NotificationPage();
  // final ChatListPage _chatListPage = new ChatListPage();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var state = Provider.of<AppState>(context, listen: false);
      print("inside HomePage init state");//ToDo remove this comment
      state.setpageIndex = 0;
      initTweets();
      // initProfile();
      // initSearch();
      // initNotificaiton();
      // initChat();
    });
    super.initState();
  }

  void initTweets() {
    print("in the initTweets");
    var state = Provider.of<FeedState>(context, listen: false);
    state.databaseInit();
    state.getDataFromDatabase();
  }

  // void initProfile() {
  //   var state = Provider.of<AuthState>(context, listen: false);
  //   state.databaseInit();
  // }

  // void initSearch() {
  //   var searchState = Provider.of<SearchState>(context, listen: false);
  //   searchState.getDataFromDatabase();
  // }

  // void initNotificaiton() {
  //   var state = Provider.of<NotificationState>(context, listen: false);
  //   var authstate = Provider.of<AuthState>(context, listen: false);
  //   state.databaseInit(authstate.userId);
  //   state.initfirebaseService();
  // }

  // void initChat() {
  //   final chatState = Provider.of<ChatState>(context, listen: false);
  //   final state = Provider.of<AuthState>(context, listen: false);
  //   chatState.databaseInit(state.userId, state.userId);
  //   /// It will update fcm token in database 
  //   /// fcm token is required to send firebase notification
  //   state.updateFCMToken();
  //   /// It get fcm server key 
  //   /// Server key is required to configure firebase notification
  //   /// Without fcm server notification can not be sent
  //   chatState.getFCMServerKey();
  // }

  /// On app launch it checks if app is launch by tapping on notification from notification tray
  /// If yes, it checks for  which type of notification is recieve
  /// If notification type is `NotificationType.Message` then chat screen will open
  /// If notification type is `NotificationType.Mention` then user profile will open who taged you in a tweet
  ///
  /*void _checkNotification() {
    final authstate = Provider.of<AuthState>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var state = Provider.of<NotificationState>(context);

      /// Check if user recieve chat notification from firebase
      /// Redirect to chat screen
      /// `notificationSenderId` is a user id who sends you a message
      /// `notificationReciverId` is a your user id.
      if (state.notificationType == NotificationType.Message &&
          state.notificationReciverId == authstate.userModel.userId) {
        state.setNotificationType = null;
        state.getuserDetail(state.notificationSenderId).then((user) {
          cprint("Opening user chat screen");
          final chatState = Provider.of<ChatState>(context, listen: false);
          chatState.setChatUser = user;
          Navigator.pushNamed(context, '/ChatScreenPage');
        });
      }

      /// Checks for user tag tweet notification
      /// If you are mentioned in tweet then it redirect to user profile who mentioed you in a tweet
      /// You can check that tweet on his profile timeline
      /// `notificationSenderId` is user id who tagged you in a tweet
      else if (state.notificationType == NotificationType.Mention &&
          state.notificationReciverId == authstate.userModel.userId) {
        state.setNotificationType = null;
        Navigator.of(context)
            .pushNamed('/ProfilePage/' + state.notificationSenderId);
      }
    });
  }*/

  Widget _body() {
    //_checkNotification();
    print("inside HomePage body!!");
    return PageStorage(
          child: SafeArea(
        child: Container(
          //child: pages[Provider.of<AppState>(context).pageIndex],
          child: _getPage(Provider.of<AppState>(context).pageIndex),
        ),
      ),
      bucket: bucket,
    );
  }

  Widget _getPage(int index) { //ToDo -> removed it after using PageStorage for persistant bottom navigation bar

    switch (index) {
      case 0:
        //return _feedPage;
        return FeedPage(
          key: PageStorageKey('Page1'),
          scaffoldKey: _scaffoldKey,
          refreshIndicatorKey: refreshIndicatorKey,
        );
        break;
      case 1:
        //return _searchPage;
        return SearchPage(key: PageStorageKey('Page2'), scaffoldKey: _scaffoldKey);
        break;
      case 2:
        //return _notificationPage;
        return NotificationPage(key: PageStorageKey('Page3'), scaffoldKey: _scaffoldKey);
        break;
      case 3:
        //return _chatListPage;
        return ChatListPage(key: PageStorageKey('Page4'), scaffoldKey: _scaffoldKey);
        break;
      default:
        //return _feedPage;
        return FeedPage(key: PageStorageKey('Page1'), scaffoldKey: _scaffoldKey);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("inside HomePage build");
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: BottomMenubar(),
      drawer: SidebarMenu(),
      //endDrawer: SidebarMenu(),//for right side
      body: _body(),
    );
  }
}
