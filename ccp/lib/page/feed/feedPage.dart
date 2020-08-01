import 'package:ccp/helper/enum.dart';
import 'package:ccp/helper/localization/language_constants.dart';
import 'package:ccp/widgets/tweet/tweet.dart';
import 'package:ccp/widgets/tweet/widgets/tweetBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:ccp/helper/theme.dart';
import 'package:ccp/model/feedModel.dart';
import 'package:ccp/state/authState.dart';
import 'package:ccp/state/feedState.dart';
import 'package:ccp/widgets/customWidgets.dart';
import 'package:ccp/widgets/newWidget/customLoader.dart';
import 'package:ccp/widgets/newWidget/emptyList.dart';
import 'package:provider/provider.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key key, this.scaffoldKey, this.refreshIndicatorKey})
      : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CcpColor.extraLightGrey,
      body: SafeArea(
        child: Container(
          height: fullHeight(context),
          width: fullWidth(context),
          child: RefreshIndicator(
            key: refreshIndicatorKey,
            onRefresh: () async {
              /// refresh home page feed
              var feedState = Provider.of<FeedState>(context, listen: false);
              feedState.getDataFromDatabase();
              return Future.value(true);
            },
            child: _FeedPageBody(
              refreshIndicatorKey: refreshIndicatorKey,
              scaffoldKey: scaffoldKey,
            ),
          ),
        ),
      ),
    );
  }
}

class _FeedPageBody extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;

  const _FeedPageBody({Key key, this.scaffoldKey, this.refreshIndicatorKey})
      : super(key: key);
  Widget _getUserAvatar(BuildContext context) {
    var authState = Provider.of<AuthState>(context);
    return Padding(
      padding: EdgeInsets.all(10),
      child: customInkWell(
        context: context,
        onPressed: () {
          /// Open up sidebaar drawer on user avatar tap
          scaffoldKey.currentState.openDrawer();
          //scaffoldKey.currentState.openEndDrawer(); //for right side drawer
        },
        child:
            customImage(context, authState.userModel?.profilePic, height: 30),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var authstate = Provider.of<AuthState>(context, listen: false);
    return Consumer<FeedState>(
      builder: (context, state, child) {
        final List<FeedModel> list = state.getTweetList(authstate.userModel);
        return CustomScrollView(
          slivers: <Widget>[
            child,
            state.isBusy && list == null
                ? SliverToBoxAdapter(
                    child: Container(
                      height: fullHeight(context) - 135,
                      child: CustomScreenLoader(
                        height: double.infinity,
                        width: fullWidth(context),
                        backgroundColor: CcpColor.white,
                      ),
                    ),
                  )
                : !state.isBusy && list == null
                    ? SliverToBoxAdapter(
                        child: EmptyList(
                          'No Post added yet',
                          subTitle:
                              'When new Post added, they\'ll show up here \n Tap Create Post button to add new',
                        ),
                      )
                    : SliverList(
                        delegate: SliverChildListDelegate(
                          list.map(
                            (model) {
                              return Container(
                                color: CcpColor.white,
                                //child: Text(model.description),
                                child: Tweet( 
                                  model: model,
                                  trailing: TweetBottomSheet().tweetOptionIcon(
                                    context,
                                    model,
                                    TweetType.Tweet,
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      )
          ],
        );
      },
      child: SliverAppBar(
        floating: true,
        elevation: 0,
        leading: _getUserAvatar(context),
        //actions: <Widget>[_getUserAvatar(context)],//for right side picture
        title: customTitleText(getTranslated(context, 'home_page_title')),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Theme.of(context).appBarTheme.color,
        bottom: PreferredSize(
          child: Container(
            color: CcpColor.extraExtraLightGrey,
            height: 1.0,
          ),
          preferredSize: Size.fromHeight(0.0),
        ),
      ),
    );
  }
}
