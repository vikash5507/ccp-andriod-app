import 'package:ccp/model/chatModel.dart';
import 'package:ccp/model/user.dart';
import 'package:ccp/state/appState.dart';

class ChatState extends AppState {
  bool setIsChatScreenOpen;
  // final FirebaseDatabase _database = FirebaseDatabase.instance;

  List<ChatMessage> _messageList;
  List<ChatMessage> _chatUserList;
  User _chatUser;
  String serverToken = "<FCM SERVER KEY>";

  /// Get FCM server key from firebase project settings
  User get chatUser => _chatUser;
  set setChatUser(User model) {
    _chatUser = model;
  }

  String _channelName;
  //Query messageQuery;

  List<ChatMessage> get messageList {
    if (_messageList == null) {
      return null;
    } else {
      _messageList.sort((x, y) => DateTime.parse(x.createdAt)
          .toLocal()
          .compareTo(DateTime.parse(y.createdAt).toLocal()));
      _messageList.reversed;
      _messageList = _messageList.reversed.toList();
      return List.from(_messageList);
    }
  }

  List<ChatMessage> get chatUserList {
    if (_chatUserList == null) {
      return null;
    } else {
      return List.from(_chatUserList);
    }
  }

  void databaseInit(String userId, String myId) async {
    
  }

  /// Fecth FCM server key from firebase Remote config
  /// FCM server key is stored in firebase remote config
  /// you have to add server key in firebase remote config
  /// To fetch this key go to project setting in firebase
  /// Click on `cloud messaging` tab
  /// Copy server key from `Project credentials`
  /// Now goto `Remote Congig` section in fireabse
  /// Add [FcmServerKey]  as paramerter key and below json in Default vslue
  ///  ``` json
  ///  {
  ///    "key": "FCM server key here"
  ///  } ```
  /// For more detail visit:- https://github.com/TheAlphamerc/ccp/issues/28#issue-611695533
  /// For package detail check:-  https://pub.dev/packages/firebase_remote_config#-readme-tab-
  void getFCMServerKey() async {
    
  }

  /// Fetch users list to who have ever engaged in chat message with logged-in user
  void getUserchatList(String userId) {
    
  }

  /// Fetch chat  all chat messages
  /// `_channelName` is used as primary key for chat message table
  /// `_channelName` is created from  by combining first 5 letters from user ids of two users
  void getchatDetailAsync() async {
    
  }

  void onMessageSubmitted(ChatMessage message, {User myUser, User secondUser}) {
    print(chatUser.userId);
    
  }

  String getChannelName(String user1, String user2) {
    user1 = user1.substring(0, 5);
    user2 = user2.substring(0, 5);
    List<String> list = [user1, user2];
    list.sort();
    _channelName = '${list[0]}-${list[1]}';
    // cprint(_channelName); //2RhfE-5kyFB
    return _channelName;
  }
  
}
