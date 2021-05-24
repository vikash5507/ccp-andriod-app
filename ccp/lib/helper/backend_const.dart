class BackendConstants {
  static const String backendRootUrl = "http://10.0.2.2:8000";//10.0.2.2: is an alias of localhost
  static const String signUpUrl = backendRootUrl+'/auth/register/';
  static const String loginUrl = backendRootUrl+'/auth/login/';
  static const String getProfileUrl = backendRootUrl+'/user/get_profile/';
  static const String getUserUrl = backendRootUrl+'/user/get_user/';
}