import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ccp/helper/constant.dart';
import 'package:ccp/helper/enum.dart';
import 'package:ccp/helper/theme.dart';
import 'package:ccp/helper/utility.dart';
import 'package:ccp/model/feedModel.dart';
import 'package:ccp/state/feedState.dart';
import 'package:ccp/widgets/newWidget/customUrlText.dart';
import 'package:ccp/widgets/newWidget/title_text.dart';
import 'package:ccp/widgets/tweet/widgets/parentTweet.dart';
import 'package:ccp/widgets/tweet/widgets/tweetIconsRow.dart';
import 'package:provider/provider.dart';

import '../customWidgets.dart';
import 'widgets/retweetWidget.dart';
import 'widgets/tweetImage.dart';

class Tweet extends StatelessWidget {
  final FeedModel model;
  final Widget trailing;
  final TweetType type;
  final bool isDisplayOnProfile;
  const Tweet(
      {Key key,
      this.model,
      this.trailing,
      this.type = TweetType.Tweet,
      this.isDisplayOnProfile = false})
      : super(key: key);

  void onLongPressedTweet(BuildContext context) {
    if (type == TweetType.Detail || type == TweetType.ParentTweet) {
      var text = ClipboardData(text: model.description);
      Clipboard.setData(text);
      Scaffold.of(context).showSnackBar(
        SnackBar(
          backgroundColor: TwitterColor.black,
          content: Text(
            'Tweet copied to clipboard',
          ),
        ),
      );
    }
  }

  void onTapTweet(BuildContext context) {
    var feedstate = Provider.of<FeedState>(context, listen: false);
    if (type == TweetType.Detail || type == TweetType.ParentTweet) {
      return;
    }
    if (type == TweetType.Tweet && !isDisplayOnProfile) {
      feedstate.clearAllDetailAndReplyTweetStack();
    }
    feedstate.getpostDetailFromDatabase(null, model: model);
    Navigator.of(context).pushNamed('/FeedPostDetail/' + model.key);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        /// Left vertical bar of a tweet
        type != TweetType.ParentTweet
            ? SizedBox.shrink()
            : Positioned.fill(
                child: Container(
                  margin: EdgeInsets.only(
                    left: 38,
                    top: 75,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(width: 3.0, color: Colors.grey.shade400),
                    ),
                  ),
                ),
              ),
        InkWell(
          onLongPress: () {
            onLongPressedTweet(context);
          },
          onTap: () {
            onTapTweet(context);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: type == TweetType.Tweet || type == TweetType.Reply
                      ? 8
                      : 0,
                ),
                child: type == TweetType.Tweet || type == TweetType.Reply
                    ? _TweetBody(
                        isDisplayOnProfile: isDisplayOnProfile,
                        model: model,
                        trailing: trailing,
                        type: type,
                      )
                    : _TweetDetailBody(
                        isDisplayOnProfile: isDisplayOnProfile,
                        model: model,
                        trailing: trailing,
                        type: type,
                      ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 0),
                child: TweetImage(
                  model: model,
                  type: type,
                ),
              ),
              model.childRetwetkey == null
                  ? SizedBox.shrink()
                  : RetweetWidget(
                      childRetwetkey: model.childRetwetkey,
                      type: type,
                      isImageAvailable:
                          model.imagePath != null && model.imagePath.isNotEmpty,
                    ),
              Padding(
                padding:
                    EdgeInsets.only(left: type == TweetType.Detail ? 10 : 40),
                child: TweetIconsRow(
                  type: type,
                  model: model,
                  isTweetDetail: type == TweetType.Detail,
                  iconColor: CcpColor.darkGrey,
                  iconEnableColor: TwitterColor.ceriseRed,
                  size: 20,
                ),
              ),
              type == TweetType.ParentTweet
                  ? SizedBox.shrink()
                  : Divider(height: .5, thickness: .5)
            ],
          ),
        ),
      ],
    );
  }
}

class _TweetBody extends StatelessWidget {
  final FeedModel model;
  final Widget trailing;
  final TweetType type;
  final bool isDisplayOnProfile;
  const _TweetBody(
      {Key key, this.model, this.trailing, this.type, this.isDisplayOnProfile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double descriptionFontSize = type == TweetType.Tweet
        ? 15
        : type == TweetType.Detail || type == TweetType.ParentTweet ? 18 : 14;
    FontWeight descriptionFontWeight =
        type == TweetType.Tweet || type == TweetType.Tweet
            ? FontWeight.w400
            : FontWeight.w400;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                child: GestureDetector(
                  onTap: () {
                    // If tweet is displaying on someone's profile then no need to navigate to same user's profile again.
                    if (isDisplayOnProfile) {
                      return;
                    }
                    Navigator.of(context)
                        .pushNamed('/ProfilePage/' + model?.userId);
                  },
                  child: customImage(context, model.user.profilePic),
                ),
              ),
              SizedBox(width: 10),
              ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: 0, maxWidth: fullWidth(context) * .5),
                child: TitleText(model.user.displayName,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    overflow: TextOverflow.ellipsis),
              ),
              SizedBox(width: 3),
              model.user.isVerified
                  ? Icon(
                      Icons.verified_user,
                      size: 13,
                      color: CcpColor.primary,
                    )
                  /*? customIcon(
                                  context,
                                  icon: AppIcon.blueTick,
                                  istwitterIcon: true,
                                  iconColor: CcpColor.primary,
                                  size: 13,
                                  paddingIcon: 3,
                                )*/
                  : SizedBox(width: 0),
              SizedBox(
                width: model.user.isVerified ? 5 : 0,
              ),
              Flexible(
                child: customText(
                  '${model.user.userName}',
                  style: userNameStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 4),
              customText('  ${getChatTime(model.createdAt)}',
                  style: userNameStyle),
              SizedBox(width: fullHeight(context)*0.12,),
              Container(margin: EdgeInsets.only(bottom: 14), child: trailing == null ? SizedBox() : trailing),
            ],
          ),
        ),
        // SizedBox(width: 20),
        // Container(
        //   width: fullWidth(context) - 80,
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: <Widget>[
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         mainAxisSize: MainAxisSize.max,
        //         children: <Widget>[
        //           Expanded(
        //             child: Row(
        //               children: <Widget>[
        //                 ConstrainedBox(
        //                   constraints: BoxConstraints(
        //                       minWidth: 0, maxWidth: fullWidth(context) * .5),
        //                   child: TitleText(model.user.displayName,
        //                       fontSize: 16,
        //                       fontWeight: FontWeight.w800,
        //                       overflow: TextOverflow.ellipsis),
        //                 ),
        //                 SizedBox(width: 3),
        //                 model.user.isVerified
        //                     ? Icon(
        //                         Icons.verified_user,
        //                         size: 13,
        //                         color: CcpColor.primary,
        //                       )
        //                     /*? customIcon(
        //                         context,
        //                         icon: AppIcon.blueTick,
        //                         istwitterIcon: true,
        //                         iconColor: CcpColor.primary,
        //                         size: 13,
        //                         paddingIcon: 3,
        //                       )*/
        //                     : SizedBox(width: 0),
        //                 SizedBox(
        //                   width: model.user.isVerified ? 5 : 0,
        //                 ),
        //                 Flexible(
        //                   child: customText(
        //                     '${model.user.userName}',
        //                     style: userNameStyle,
        //                     overflow: TextOverflow.ellipsis,
        //                   ),
        //                 ),
        //                 SizedBox(width: 4),
        //                 customText('  ${getChatTime(model.createdAt)}',
        //                     style: userNameStyle),
        //               ],
        //             ),
        //           ),
        //           Container(child: trailing == null ? SizedBox() : trailing),
        //         ],
        //       ),
              Container(
                margin: EdgeInsets.only(top: 8.0, left: 4.0),
                padding: const EdgeInsets.only(left: 8.0),
                child: UrlText(
                  text: model.description,
                  onHashTagPressed: (tag) {
                    cprint(tag);
                  },
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: descriptionFontSize,
                      fontWeight: descriptionFontWeight),
                  urlStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: descriptionFontSize,
                      fontWeight: descriptionFontWeight),
                ),
              ),
        //     ],
        //   ),
        // ),
        SizedBox(width: 10),
      ],
    );
  }
}

class _TweetDetailBody extends StatelessWidget {
  final FeedModel model;
  final Widget trailing;
  final TweetType type;
  final bool isDisplayOnProfile;
  const _TweetDetailBody(
      {Key key, this.model, this.trailing, this.type, this.isDisplayOnProfile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double descriptionFontSize = type == TweetType.Tweet
        ? getDimention(context, 15)
        : type == TweetType.Detail
            ? getDimention(context, 18)
            : type == TweetType.ParentTweet ? getDimention(context, 14) : 10;

    FontWeight descriptionFontWeight =
        type == TweetType.Tweet || type == TweetType.Tweet
            ? FontWeight.w300
            : FontWeight.w400;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        model.parentkey != null &&
                model.childRetwetkey == null &&
                type != TweetType.ParentTweet
            ? ParentTweetWidget(
                childRetwetkey: model.parentkey,
                isImageAvailable: false,
                trailing: trailing)
            : SizedBox.shrink(),
        Container(
          width: fullWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                leading: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('/ProfilePage/' + model?.userId);
                  },
                  child: customImage(context, model.user.profilePic),
                ),
                title: Row(
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          minWidth: 0, maxWidth: fullWidth(context) * .5),
                      child: TitleText(model.user.displayName,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          overflow: TextOverflow.ellipsis),
                    ),
                    SizedBox(width: 3),
                    model.user.isVerified
                        ? Icon(
                            Icons.verified_user,
                            size: 13,
                            color: CcpColor.primary,
                          )
                        /*? customIcon(
                            context,
                            icon: AppIcon.blueTick,
                            istwitterIcon: true,
                            iconColor: AppColor.primary,
                            size: 13,
                            paddingIcon: 3,
                          )*/
                        : SizedBox(width: 0),
                    SizedBox(
                      width: model.user.isVerified ? 5 : 0,
                    ),
                  ],
                ),
                subtitle:
                    customText('${model.user.userName}', style: userNameStyle),
                trailing: trailing,
              ),
              Padding(
                padding: type == TweetType.ParentTweet
                    ? EdgeInsets.only(left: 80, right: 16)
                    : EdgeInsets.symmetric(horizontal: 16),
                child: UrlText(
                  text: model.description,
                  onHashTagPressed: (tag) {
                    cprint(tag);
                  },
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: descriptionFontSize,
                    fontWeight: descriptionFontWeight,
                  ),
                  urlStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: descriptionFontSize,
                    fontWeight: descriptionFontWeight,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
