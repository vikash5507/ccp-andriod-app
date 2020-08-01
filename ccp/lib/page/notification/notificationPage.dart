import 'package:ccp/helper/localization/language_constants.dart';
import 'package:flutter/material.dart';
import 'package:ccp/helper/constant.dart';
import 'package:ccp/helper/theme.dart';
import 'package:ccp/model/feedModel.dart';
import 'package:ccp/model/notificationModel.dart';
import 'package:ccp/model/user.dart';
import 'package:ccp/state/authState.dart';
import 'package:ccp/state/feedState.dart';
import 'package:ccp/state/notificationState.dart';
import 'package:ccp/widgets/customAppBar.dart';
import 'package:ccp/widgets/customWidgets.dart';
import 'package:ccp/widgets/newWidget/customUrlText.dart';
import 'package:ccp/widgets/newWidget/emptyList.dart';
import 'package:ccp/widgets/newWidget/title_text.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key key, this.scaffoldKey}) : super(key: key);

  /// scaffoldKey used to open sidebaar drawer
  final GlobalKey<ScaffoldState> scaffoldKey;

  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var state = Provider.of<NotificationState>(context, listen: false);
      var authstate = Provider.of<AuthState>(context, listen: false);
      state.getDataFromDatabase(authstate.userId);
    });
  }

  void onSettingIconPressed() {
    Navigator.pushNamed(context, '/NotificationPage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TwitterColor.mystic,
      appBar: CustomAppBar(
        scaffoldKey: widget.scaffoldKey,
        title: customTitleText(
          getTranslated(context, 'notification_page_title'),
        ),
        icon: AppIcon.settings,
        onActionPressed: onSettingIconPressed,
      ),
      body: NotificationPageBody(),
    );
  }
}

class NotificationPageBody extends StatelessWidget {
  const NotificationPageBody({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var state = Provider.of<NotificationState>(context);
    var list = state.notificationList;
    if (state?.isbusy ?? true && (list == null || list.isEmpty)) {
      return SizedBox(
        height: 3,
        child: LinearProgressIndicator(),
      );
    } else if (list == null || list.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: EmptyList(
          'No Notification available yet',
          subTitle: 'When new notifiction found, they\'ll show up here.',
        ),
      );
    }
    return ListView.builder(itemBuilder: (context, index) => null);//TODO genrate notification tile list
  }
}

class NotificationTile extends StatelessWidget {
  final FeedModel model;
  const NotificationTile({Key key, this.model}) : super(key: key);
  Widget _userList(BuildContext context, List<String> list) {
    // List<String> names = [];
    var length = list.length;
    List<Widget> avaterList = [];
    final int noOfUser = list.length;
    var state = Provider.of<NotificationState>(context);
    if (list != null && list.length > 5) {
      list = list.take(5).toList();
    }
    avaterList = list.map((userId) {
      return _userAvater(userId, state, (name) {
        // names.add(name);
      });
    }).toList();
    if (noOfUser > 5) {
      avaterList.add(
        Text(
          " +${noOfUser - 5}",
          style: subtitleStyle.copyWith(fontSize: 16),
        ),
      );
    }

    var col = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(width: 20),
            customIcon(context,
                icon: AppIcon.heartFill,
                iconColor: TwitterColor.ceriseRed,
                istwitterIcon: true,
                size: 25),
            SizedBox(width: 10),
            Row(children: avaterList),
          ],
        ),
        // names.length > 0 ? Text(names[0]) : SizedBox(),
        Padding(
          padding: EdgeInsets.only(left: 60, bottom: 5, top: 5),
          child: TitleText(
            '$length people like your Tweet',
            fontSize: 18,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
    return col;
  }

  Widget _userAvater(
      String userId, NotificationState state, ValueChanged<String> name) {
    return FutureBuilder(
      future: state.getuserDetail(userId),
      //  initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.hasData) {
          name(snapshot.data.displayName);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/ProfilePage/' + snapshot.data?.userId);
              },
              child: customImage(context, snapshot.data.profilePic, height: 30),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var description = model.description.length > 150
        ? model.description.substring(0, 150) + '...'
        : model.description;
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          color: TwitterColor.white,
          child: ListTile(
            onTap: () {
              var state = Provider.of<FeedState>(context, listen: false);
              state.getpostDetailFromDatabase(null, model: model);
              Navigator.of(context).pushNamed('/FeedPostDetail/' + model.key);
            },
            title: _userList(context, model.likeList),
            subtitle: Padding(
              padding: EdgeInsets.only(left: 60),
              child: UrlText(
                text: description,
                style: TextStyle(
                  color: AppColor.darkGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        Divider(height: 0, thickness: .6)
      ],
    );
  }
}
