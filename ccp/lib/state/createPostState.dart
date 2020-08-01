import 'package:ccp/model/feedModel.dart';
import 'package:flutter/material.dart';
import 'package:ccp/state/searchState.dart';

class CreatePostState extends ChangeNotifier {
  bool showUserList = false;
  bool enableSubmitButton = false;
  bool hideUserList = false;
  String description = "";
  String serverToken;
  final usernameRegex = r'(@\w*[a-zA-Z1-9]$)';

  bool _isScrollingDown = false;
  bool get isScrollingDown => _isScrollingDown;
  set setIsScrolllingDown(bool value) {
    _isScrollingDown = value;
    notifyListeners();
  }

  /// Display/Hide userlist on the basis of username availability in description
  /// To display userlist in compose screen two condion is required
  /// First is value of `status` should be true
  /// Second value of  `hideUserList` should be false
  bool get displayUserList {
    RegExp regExp = new RegExp(usernameRegex);
    var status = regExp.hasMatch(description);
    if (status && !hideUserList) {
      return true;
    } else {
      return false;
    }
  }

  /// Hide userlist when a  user select a username from userlist
  void onUserSelected() {
    hideUserList = true;
    notifyListeners();
  }

  /// This method will trigger every time when user writes tweet description.
  /// `hideUserList` is set to false to reset user list show flag.
  /// If description is not empty and its lenth is lesser then 280 characters
  /// then value of `enableSubmitButton` is set to true.
  ///
  /// `enableSubmitButton` is responsible to enable/disable tweet submit button
  void onDescriptionChanged(String text, SearchState searchState) {
    description = text;
    hideUserList = false;
    if (text.isEmpty || text.length > 280) {
      /// Disable submit button if description is not availabele
      enableSubmitButton = false;
      notifyListeners();
      return;
    }

    /// Enable submit button if description is availabele
    enableSubmitButton = true;
    var last = text.substring(text.length - 1, text.length);

    /// Regex to search last username available from description
    /// Ex. `Hello @john do you know @ricky`
    /// In above description reegex is serch for last username ie. `@ricky`.

    RegExp regExp = new RegExp(usernameRegex);
    var status = regExp.hasMatch(text);
    if (status) {
      Iterable<Match> _matches = regExp.allMatches(text);
      var name = text.substring(_matches.last.start, _matches.last.end);

      /// If last character is `@` then reset search user list
      if (last == "@") {
        /// Reset user list
        searchState.filterByUsername("");
      } else {
        /// Filter user list according to name
        searchState.filterByUsername(name);
      }
    } else {
      /// Hide userlist if no matched username found
      hideUserList = false;
      notifyListeners();
    }
  }

  /// When user select user from userlist it will add username in description
  String getDescription(String username) {
    RegExp regExp = new RegExp(usernameRegex);
    Iterable<Match> _matches = regExp.allMatches(description);
    var name = description.substring(0, _matches.last.start);
    description = '$name $username';
    return description;
  }

  /// Fecth FCM server key from firebase Remote config
  /// send notification to user once fcmToken is retrieved from firebase
  Future<void> sendNotification(FeedModel model, SearchState state) async {
    final usernameRegex = r"(@\w*[a-zA-Z1-9])";
    RegExp regExp = new RegExp(usernameRegex);
    var status = regExp.hasMatch(description);
    /// Check if username is availeble in description or not
    /// ToDO Implement Notification Service
    if (status) {
      print(status);
    }
  }

}
