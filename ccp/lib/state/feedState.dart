import 'dart:async';
import 'dart:io';
import 'package:ccp/helper/constant.dart';
import 'package:ccp/helper/enum.dart';
import 'package:ccp/model/feedModel.dart';
import 'package:ccp/helper/utility.dart';
import 'package:ccp/model/user.dart';
import 'package:ccp/state/appState.dart';
// import 'authState.dart';

class FeedState extends AppState {
  bool isBusy = false;
  Map<String, List<FeedModel>> tweetReplyMap = {};
  FeedModel _tweetToReplyModel;
  FeedModel get tweetToReplyModel => _tweetToReplyModel;
  set setTweetToReply(FeedModel model) {
    _tweetToReplyModel = model;
  }

  List<FeedModel> _commentlist;

  List<FeedModel> _feedlist;
  List<FeedModel> _tweetDetailModelList;
  List<String> _userfollowingList;
  List<String> get followingList => _userfollowingList;

  List<FeedModel> get tweetDetailModel => _tweetDetailModelList;

  //temp
  static User usertemp = User(email: "vikash@gmail.com", userId: "1234", displayName: "Mintu Duck", profilePic: dummyProfilePic, key: "1", contact: "12333", bio: "President of Duck", dob: "22222", location: "Intenet", createdAt: "Home", userName: "Duck123", isVerified: true, followers: 1234334, following: 7, fcmToken: "ghanta", webSite: "dumroo.com", followersList: ["alpha", "beta"]); //ToDO remove this after integrating it backend
  FeedModel feedModelcommon = new FeedModel(key: '12345666', parentkey: '234544', childRetwetkey: '345677', description: 'This is my first dummy post!! Wish me luck.', userId: '123', likeCount: 1234, likeList: ['alpha', 'beta'], commentCount: 12, retweetCount: 4, createdAt: '2020-07-31 21:47:46.596949', imagePath: postProfilePicList[5], tags: ['chinu', 'pintu'], replyTweetKeyList: ['ola', 'bola', 'chola'], user: usertemp);

  /// `feedlist` always [contain all tweets] fetched from firebase database
  List<FeedModel> get feedlist {
    if (_feedlist == null) {
      return null;
    } else {
      return List.from(_feedlist.reversed);
    }
  }

  /// contain tweet list for home page
  List<FeedModel> getTweetList(User userModel) {
    // if (userModel == null) {
    //   return null;
    // }
    return feedlist;
    // List<FeedModel> list;

    // if (!isBusy && feedlist != null && feedlist.isNotEmpty) {
    //   list = feedlist.where((x) {
    //     /// If Tweet is a comment then no need to add it in tweet list
    //     if (x.parentkey != null &&
    //         x.childRetwetkey == null &&
    //         x.user.userId != userModel.userId) {
    //       return false;
    //     }

    //     /// Only include Tweets of logged-in user's and his following user's
    //     if (x.user.userId == userModel.userId ||
    //         (userModel?.followingList != null &&
    //             userModel.followingList.contains(x.user.userId))) {
    //       return true;
    //     } else {
    //       return false;
    //     }
    //   }).toList();
    //   if (list.isEmpty) {
    //     list = null;
    //   }
    // }
    // return list;
  }

  /// set tweet for detail tweet page
  /// Setter call when tweet is tapped to view detail
  /// Add Tweet detail is added in _tweetDetailModelList
  /// It makes `Fwitter` to view nested Tweets
  set setFeedModel(FeedModel model) {
    if (_tweetDetailModelList == null) {
      _tweetDetailModelList = [];
    }

    /// [Skip if any duplicate tweet already present]
    if (_tweetDetailModelList.length >= 0) {
      _tweetDetailModelList.add(model);
      cprint(
          "Detail Tweet added. Total Tweet: ${_tweetDetailModelList.length}");
      notifyListeners();
    }
  }

  /// `remove` last Tweet from tweet detail page stack
  /// Function called when navigating back from a Tweet detail
  /// `_tweetDetailModelList` is map which contain lists of commment Tweet list
  /// After removing Tweet from Tweet detail Page stack its commnets tweet is also removed from `_tweetDetailModelList`
  void removeLastTweetDetail(String tweetKey) {
    if (_tweetDetailModelList != null && _tweetDetailModelList.length > 0) {
      // var index = _tweetDetailModelList.in
      FeedModel removeTweet =
          _tweetDetailModelList.lastWhere((x) => x.key == tweetKey);
      _tweetDetailModelList.remove(removeTweet);
      tweetReplyMap.removeWhere((key, value) => key == tweetKey);
      cprint(
          "Last Tweet removed from stack. Remaining Tweet: ${_tweetDetailModelList.length}");
    }
  }

  /// [clear all tweets] if any tweet present in tweet detail page or comment tweet
  void clearAllDetailAndReplyTweetStack() {
    if (_tweetDetailModelList != null) {
      _tweetDetailModelList.clear();
    }
    if (tweetReplyMap != null) {
      tweetReplyMap.clear();
    }
    cprint('Empty tweets from stack');
  }

  /// [Subscribe Tweets] firebase Database //ToDO
  Future<bool> databaseInit() {
    return Future.value(true);
  }

  /// get [Tweet list] from firebase realtime database //ToDo
  void getDataFromDatabase() {
    try {
      isBusy = true;
      _feedlist = null;
      notifyListeners();
      User usertmp1 = User(email: "vikash@gmail.com", userId: "1234", displayName: "Chintu Duck", profilePic: dummyProfilePicList[4], key: "133", contact: "12333", bio: "President of Duck", dob: "22222", location: "Intenet", createdAt: "Home", userName: "Duck123", isVerified: true, followers: 1234334, following: 7, fcmToken: "ghanta", webSite: "dumroo.com", followersList: ["alpha", "beta"]); //ToDO remove this after integrating it backend
      User usertmp2 = User(email: "vikash@gmail.com", userId: "123466", displayName: "Pitroda Duck", profilePic: dummyProfilePicList[2], key: "13343", contact: "12333", bio: "President of Duck", dob: "22222", location: "Intenet", createdAt: "Home", userName: "Duck123", isVerified: true, followers: 1334, following: 7, fcmToken: "ghanta", webSite: "dumroo.com", followersList: ["alpha", "beta"]); //ToDO remove this after integrating it backend
      User usertmp3 = User(email: "vikash@gmail.com", userId: "123456666", displayName: "Pintu Duck", profilePic: dummyProfilePicList[1], key: "123343", contact: "12333", bio: "President of Duck", dob: "22222", location: "Intenet", createdAt: "Home", userName: "Duck123", isVerified: true, followers: 14334, following: 7, fcmToken: "ghanta", webSite: "dumroo.com", followersList: ["alpha", "beta"]); //ToDO remove this after integrating it backend
      FeedModel feedModel = new FeedModel(key: '1234', parentkey: '2345', childRetwetkey: '233', description: 'Loved your post!!', userId: '123', likeCount: 1234, likeList: ['alpha', 'beta'], commentCount: 12, retweetCount: 4, createdAt: '2020-07-13 21:47:46.596949', imagePath: postProfilePicList[1], tags: ['chinu', 'pintu'], replyTweetKeyList: ['ola', 'bola', 'chola'], user: usertmp1);
      String sampleDestriction2 = 'Human mindset can be understood by the fact that most phrases etc are derogatory to dogs, whereas they are the most loyal friends of human. The only specie on earth which is ultra selfish- humans. Why was God so partial';
      FeedModel feedModel2 = new FeedModel(key: '123564', parentkey: '23fefe45', description: sampleDestriction2, userId: '123', likeCount: 564, likeList: ['alpha', 'beta'], commentCount: 5, retweetCount: 33, createdAt: '2020-07-23 21:47:46.596949', imagePath: postProfilePicList[0], tags: ['chinu', 'pintu'], replyTweetKeyList: ['ola', 'bola', 'chola'], user: usertmp2);
      String sampleDes3 = 'If you are into B2B SaaS, I would love you to join our NCR-SaaS group. We have 50+ startups in the club now, and focus on helping improve your business thru sharing. Its also picking up attention from investors and we arrange AMA with top investors / early-stage investors who have a long-term thesis on B2B SaaS. If you are interested to join, please message me. Strictly and only for founders.';
      FeedModel feedModel3 = new FeedModel(key: '12399974', parentkey: '234dfff5', description: sampleDes3, userId: '123', likeCount: 334, likeList: ['alpha', 'beta'], commentCount: 412, retweetCount: 67, createdAt: '2020-07-01 21:47:46.596949', tags: ['chinu', 'pintu'], replyTweetKeyList: ['ola', 'bola', 'chola'], user: usertmp3);
      FeedModel feedModel4 = new FeedModel(key: '12399974', parentkey: '234dfff5', description: 'This is my third dummy post!! Wish me luck.', userId: '123', likeCount: 334, likeList: ['alpha', 'beta'], commentCount: 412, retweetCount: 67, createdAt: '2020-07-01 21:47:46.596949', tags: ['chinu', 'pintu'], replyTweetKeyList: ['ola', 'bola', 'chola'], user: usertmp3);
      FeedModel feedModel5 = new FeedModel(key: '123564', parentkey: '23fefe45', description: sampleDestriction2, userId: '123', likeCount: 64, likeList: ['alpha', 'beta'], commentCount: 0, retweetCount: 3, createdAt: '2020-07-23 01:47:46.596949', imagePath: postProfilePicList[2], tags: ['chinu', 'pintu'], replyTweetKeyList: ['ola', 'bola', 'chola'], user: usertmp2);
      FeedModel feedModel6 = new FeedModel(key: '123564', parentkey: '23fefe45', description: sampleDestriction2, userId: '123', likeCount: 4, likeList: ['alpha', 'beta'], commentCount: 1, retweetCount: 0, createdAt: '2020-04-03 14:47:46.596949', imagePath: postProfilePicList[3], tags: ['chinu', 'pintu'], replyTweetKeyList: ['ola', 'bola', 'chola'], user: usertmp2);
      FeedModel feedModel7 = new FeedModel(key: '1234', parentkey: '2345', childRetwetkey: '233w', description: 'Loved your post!!', userId: '123', likeCount: 1234, likeList: ['alpha', 'beta'], commentCount: 12, retweetCount: 4, createdAt: '2020-07-13 21:47:46.596949', imagePath: null, tags: ['chinu', 'pintu'], replyTweetKeyList: ['ola', 'bola', 'chola'], user: usertmp1);
      _feedlist = List<FeedModel>();
      _feedlist.add(feedModel);
      _feedlist.add(feedModel2);
      _feedlist.add(feedModel3);
      _feedlist.add(feedModel4);
      _feedlist.add(feedModel5);
      _feedlist.add(feedModel6);
      _feedlist.add(feedModel7);
      isBusy = false;
      notifyListeners();
    //   kDatabase.child('tweet').once().then((DataSnapshot snapshot) {
    //     _feedlist = List<FeedModel>();
    //     if (snapshot.value != null) {
    //       var map = snapshot.value;
    //       if (map != null) {
    //         map.forEach((key, value) {
    //           var model = FeedModel.fromJson(value);
    //           model.key = key;
    //           if (model.isValidTweet) {
    //             _feedlist.add(model);
    //           }
    //         });

    //         /// Sort Tweet by time
    //         /// It helps to display newest Tweet first.
    //         _feedlist.sort((x, y) => DateTime.parse(x.createdAt)
    //             .compareTo(DateTime.parse(y.createdAt)));
    //       }
    //     } else {
    //       _feedlist = null;
    //     }
    //     isBusy = false;
    //     notifyListeners();
    //   });
    } catch (error) {
      isBusy = false;
      cprint(error, errorIn: 'getDataFromDatabase');
    }
  }

  /// get [Tweet Detail] from firebase realtime kDatabase
  /// If model is null then fetch tweet from firebase
  /// [getpostDetailFromDatabase] is used to set prepare Tweetr to display Tweet detail
  /// After getting tweet detail fetch tweet coments from firebase
  void getpostDetailFromDatabase(String postID, {FeedModel model}) async {
    // try {
    //   FeedModel _tweetDetail;
    //   if (model != null) {
    //     // set tweet data from tweet list data.
    //     // No need to fetch tweet from firebase db if data already present in tweet list
    //     _tweetDetail = model;
    //     setFeedModel = _tweetDetail;
    //     postID = model.key;
    //   } else {
    //     // Fetch tweet data from firebase
    //     kDatabase
    //         .child('tweet')
    //         .child(postID)
    //         .once()
    //         .then((DataSnapshot snapshot) {
    //       if (snapshot.value != null) {
    //         var map = snapshot.value;
    //         _tweetDetail = FeedModel.fromJson(map);
    //         _tweetDetail.key = snapshot.key;
    //         setFeedModel = _tweetDetail;
    //       }
    //     });
    //   }

    //   if (_tweetDetail != null) {
    //     // Fetch comment tweets
    //     _commentlist = List<FeedModel>();
    //     // Check if parent tweet has reply tweets or not
    //     if (_tweetDetail.replyTweetKeyList != null &&
    //         _tweetDetail.replyTweetKeyList.length > 0) {
    //       _tweetDetail.replyTweetKeyList.forEach((x) {
    //         if (x == null) {
    //           return;
    //         }
    //         kDatabase
    //             .child('tweet')
    //             .child(x)
    //             .once()
    //             .then((DataSnapshot snapshot) {
    //           if (snapshot.value != null) {
    //             var commentmodel = FeedModel.fromJson(snapshot.value);
    //             var key = snapshot.key;
    //             commentmodel.key = key;

    //             /// add comment tweet to list if tweet is not present in [comment tweet ]list
    //             /// To reduce duplicacy
    //             if (!_commentlist.any((x) => x.key == key)) {
    //               _commentlist.add(commentmodel);
    //             }
    //           } else {}
    //           if (x == _tweetDetail.replyTweetKeyList.last) {
    //             /// Sort comment by time
    //             /// It helps to display newest Tweet first.
    //             _commentlist.sort((x, y) => DateTime.parse(y.createdAt)
    //                 .compareTo(DateTime.parse(x.createdAt)));
    //             tweetReplyMap.putIfAbsent(postID, () => _commentlist);
    //             notifyListeners();
    //           }
    //         });
    //       });
    //     } else {
    //       tweetReplyMap.putIfAbsent(postID, () => _commentlist);
    //       notifyListeners();
    //     }
    //   }
    // } catch (error) {
    //   cprint(error, errorIn: 'getpostDetailFromDatabase');
    // }
  }

  /// Fetch `Retweet` model from firebase realtime kDatabase.
  /// Retweet itself  is a type of `Tweet`
  Future<FeedModel> fetchTweet(String postID) async {
    FeedModel _tweetDetail;

    /// If tweet is availabe in feedlist then no need to fetch it from firebase
    if (feedlist.any((x) => x.key == postID)) {
      _tweetDetail = feedlist.firstWhere((x) => x.key == postID);
    }

    /// If tweet is not available in feedlist then need to fetch it from firebase
    else {
      cprint("Fetched from DB: " + postID);
      _tweetDetail = feedModelcommon;
      // if (model != null) {
      //   _tweetDetail = model;
      // } else {
      //   cprint("Fetched null value from  DB");
      // }
    }
    return _tweetDetail;
  }

  /// [Delete tweet] in Firebase kDatabase
  /// Remove Tweet if present in home page Tweet list
  /// Remove Tweet if present in Tweet detail page or in comment
  deleteTweet(String tweetId, TweetType type, {String parentkey}) {
    try {
      /// Delete tweet if it is in nested tweet detail page
      
    } catch (error) {
      cprint(error, errorIn: 'deleteTweet');
    }
  }


  /// upload [file] to firebase storage and return its  path url
  Future<String> uploadFile(File file) async {
    try {
      isBusy = true;
      notifyListeners();
      print(file.path);
      return file.path;
    } catch (error) {
      cprint(error, errorIn: 'uploadFile');
      return null;
    }
  }

  /// create [New Tweet]
  createTweet(FeedModel model) {
    ///  Create tweet in [Firebase kDatabase]
    isBusy = true;
    notifyListeners();
    //ToDO -> push tweet data to DB
    print("Push this tweet data to DB"+model.toString());
    try {
      //kDatabase.child('tweet').push().set(model.toJson());
      print(model.toString());
    } catch (error) {
      cprint(error, errorIn: 'createTweet');
    }
    isBusy = false;
    notifyListeners();
  }

  ///  It will create tweet in [Firebase kDatabase] just like other normal tweet.
  ///  update retweet count for retweet model
  createReTweet(FeedModel model) {
    try {
      createTweet(model);
      _tweetToReplyModel.retweetCount += 1;
      updateTweet(_tweetToReplyModel);
    } catch (error) {
      cprint(error, errorIn: 'createReTweet');
    }
  }

  /// [update] tweet
  updateTweet(FeedModel model) async {
    //await kDatabase.child('tweet').child(model.key).set(model.toJson());
  }

  /// Add [new comment tweet] to any tweet
  /// Comment is a Tweet itself
  addcommentToPost(FeedModel replyTweet) {
    try {
      isBusy = true;
      notifyListeners();
      if (_tweetToReplyModel != null) {
        FeedModel tweet =
            _feedlist.firstWhere((x) => x.key == _tweetToReplyModel.key);
        //var json = replyTweet.toJson();
        // kDatabase.child('tweet').push().set(json).then((value) {
        //   tweet.replyTweetKeyList.add(_feedlist.last.key);
        //   updateTweet(tweet);
        // });
      }
    } catch (error) {
      cprint(error, errorIn: 'addcommentToPost');
    }
    isBusy = false;
    notifyListeners();
  }

  /// Add/Remove like on a Tweet
  /// [postId] is tweet id, [userId] is user's id who like/unlike Tweet
  addLikeToTweet(FeedModel tweet, String userId) {
    try {
      if (tweet.likeList != null &&
          tweet.likeList.length > 0 &&
          tweet.likeList.any((id) => id == userId)) {
        // If user wants to undo/remove his like on tweet
        tweet.likeList.removeWhere((id) => id == userId);
        tweet.likeCount -= 1;
      } else {
        // If user like Tweet
        if (tweet.likeList == null) {
          tweet.likeList = [];
        }
        tweet.likeList.add(userId);
        tweet.likeCount += 1;
      }
      // update likelist of a tweet

      // Sends notification to user who created tweet
      // User owner can see notification on notification page
      
    } catch (error) {
      cprint(error, errorIn: 'addLikeToTweet');
    }
  }
}
