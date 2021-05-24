class User {
  String key;
  String email;
  String userId;
  String displayName;
  String userName;
  String mobileNumber;
  String profilePic;
  String contact;
  String bio;
  String primaryLocation;
  String secondaryLocation;
  String dob;
  String createdAt;
  bool isVerified;
  int followers;
  int following;
  int karma;
  int postCount;
  String fcmToken;
  List<String> followersList;
  List<String> followingList;

  User(
      {this.email,
      this.userId,
      this.displayName,
      this.profilePic,
      this.key,
      this.contact,
      this.bio,
      this.dob,
      this.primaryLocation,
      this.secondaryLocation,
      this.createdAt,
      this.userName,
      this.followers,
      this.following,
      this.karma,
      this.postCount,
      this.mobileNumber,
      this.isVerified,
      this.fcmToken,
      this.followersList,
      });

  User.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    if(followersList == null){
      followersList = [];
    }
    email = map['email'];
    userId = map['userId'];
    displayName = map['displayName'];
    profilePic = map['profilePic'];
    key = map['key'];
    dob = map['dob'];
    bio = map['bio'];
    primaryLocation = map['location'];
    secondaryLocation = map['secondaryLocation'];
    contact = map['contact'];
    createdAt = map['createdAt'];
    followers = map['followers'];
    following = map['following'];
    karma = map['karma'];
    postCount = map['postCount'];
    userName = map['userName'];
    mobileNumber = map['mobileNumber'];
    fcmToken = map['fcmToken'];
    isVerified = map['isVerified'] ?? false;
    if(map['followerList'] != null){
      followersList = List<String>();
      map['followerList'].forEach((value){
         followersList.add(value);
     });
   }
   followers = followersList != null ? followersList.length : null;
   if(map['followingList'] != null){
      followingList = List<String>();
      map['followingList'].forEach((value){
         followingList.add(value);
     });
   }
   following = followingList != null ? followingList.length : null;
  }
  toJson() {
    return {
      'key': key,
      "userId": userId,
      "email": email,
      'displayName': displayName,
      'profilePic': profilePic,
      'contact': contact,
      'dob': dob,
      'bio': bio,
      'primaryLocation': primaryLocation,
      'secondaryLocation': secondaryLocation,
      'createdAt': createdAt,
      'followers': followersList != null ? followersList.length : null,
      'following': followingList!= null ? followingList.length : null,
      'userName': userName,
      'mobileNumber': mobileNumber,
      'karma': karma,
      'postCount': postCount,
      'isVerified': isVerified ?? false,
      'fcmToken':fcmToken,
      'followerList' : followersList,
      'followingList':followingList
    };
  }

  User copyWith(
      {String email,
      String userId,
      String displayName,
      String profilePic,
      String key,
      String contact,
      String bio,
      String dob,
      String primaryLocation,
      String secondaryLocation,
      String createdAt,
      String userName,
      int followers,
      int following,
      int karma,
      int postCount,
      String mobileNumber,
      bool isVerified,
      String fcmToken,
      List<String> followingList,
      }) {
    return User(
        email: email ?? this.email,
        bio: bio ?? this.bio,
        contact: contact ?? this.contact,
        createdAt: createdAt ?? this.createdAt,
        displayName: displayName ?? this.displayName,
        dob: dob ?? this.dob,
        followers: followersList != null ? followersList.length : null,
        following: following ?? this.following,
        isVerified: isVerified ?? this.isVerified,
        key: key ?? this.key,
        primaryLocation: primaryLocation ?? this.primaryLocation,
        secondaryLocation: secondaryLocation ?? this.secondaryLocation,
        profilePic: profilePic ?? this.profilePic,
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        karma: karma ?? this.karma,
        postCount: postCount ?? this.postCount,
        fcmToken:fcmToken ?? this.fcmToken,
        followersList: followersList ?? this.followersList,
        );
  }

  String getFollower() {
    return '${this.followers ?? 0}';
  }

  String getFollowing() {
    return '${this.following ?? 0}';
  }
}
