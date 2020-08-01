import 'dart:async';
import 'package:ccp/helper/enum.dart';
import 'package:ccp/model/feedModel.dart';
import 'package:ccp/model/notificationModel.dart';
import 'package:ccp/model/user.dart';
import 'package:ccp/state/appState.dart';

class NotificationState extends AppState {
  String fcmToken;
  NotificationType _notificationType = NotificationType.NOT_DETERMINED;
  String notificationReciverId, notificationTweetId;
  FeedModel notificationTweetModel;
  NotificationType get notificationType => _notificationType;
  set setNotificationType(NotificationType type) {
    _notificationType = type;
  }

  // FcmNotificationModel notification;
  String notificationSenderId;
  //dabase.Query query;
  List<User> userList = [];

  //final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  List<NotificationModel> _notificationList;

  List<NotificationModel> get notificationList => _notificationList;

  /// [Intitilise firebase notification kDatabase]
  Future<bool> databaseInit(String userId) {
    return Future.value(true);
    // try {
    //   if (query == null) {
    //     query = kDatabase.child("notification").child(userId);
    //     query.onChildAdded.listen(_onNotificationAdded);
    //     query.onChildChanged.listen(_onNotificationChanged);
    //     query.onChildRemoved.listen(_onNotificationRemoved);
    //   }

    //   return Future.value(true);
    // } catch (error) {
    //   cprint(error, errorIn: 'databaseInit');
    //   return Future.value(false);
    // }
  }

  /// get [Notification list] from firebase realtime database
  void getDataFromDatabase(String userId) {
    // try {
    //   loading = true;
    //   _notificationList = [];
    //   kDatabase
    //       .child('notification')
    //       .child(userId)
    //       .once()
    //       .then((DataSnapshot snapshot) {
    //     if (snapshot.value != null) {
    //       var map = snapshot.value;
    //       if (map != null) {
    //         map.forEach((tweetKey, value) {
    //           var model = NotificationModel.fromJson(
    //               tweetKey, value["updatedAt"], snapshot.value["type"]);
    //           _notificationList.add(model);
    //         });
    //         _notificationList.sort((x, y) {
    //           if (x.updatedAt != null && y.updatedAt != null) {
    //             return DateTime.parse(y.updatedAt)
    //                 .compareTo(DateTime.parse(x.updatedAt));
    //           } else if (x.updatedAt != null) {
    //             return 1;
    //           } else
    //             return 0;
    //         });
    //       }
    //     }
    //     loading = false;
    //   });
    // } catch (error) {
    //   loading = false;
    //   cprint(error, errorIn: 'getDataFromDatabase');
    // }
  }

  /// get `Tweet` present in notification
  // Future<FeedModel> getTweetDetail(String tweetId) async {
  //   FeedModel _tweetDetail;
  //   var snapshot = await kDatabase.child('tweet').child(tweetId).once();
  //   if (snapshot.value != null) {
  //     var map = snapshot.value;
  //     _tweetDetail = FeedModel.fromJson(map);
  //     _tweetDetail.key = snapshot.key;
  //     return _tweetDetail;
  //   } else {
  //     return null;
  //   }
  // }

  /// get user who liked your tweet
  Future<User> getuserDetail(String userId) async {
    
    User user;
    return user;
    // if (userList.length > 0 && userList.any((x) => x.userId == userId)) {
    //   return Future.value(userList.firstWhere((x) => x.userId == userId));
    // }
    // var snapshot = await kDatabase.child('profile').child(userId).once();
    // if (snapshot.value != null) {
    //   var map = snapshot.value;
    //   user = User.fromJson(map);
    //   user.key = snapshot.key;
    //   userList.add(user);
    //   return user;
    // } else {
    //   return null;
    // }
  }

  /// Remove notification if related Tweet is not found or deleted
  void removeNotification(String userId, String tweetkey) async {
    //kDatabase.child('notification').child(userId).child(tweetkey).remove();
  }
  
}
