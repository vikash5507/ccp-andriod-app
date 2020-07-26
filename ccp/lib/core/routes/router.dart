import 'package:auto_route/auto_route_annotations.dart';
import 'package:ccp/ui/auth/app_widget.dart';
import 'package:ccp/ui/auth/pages/choose_location.dart';
import 'package:ccp/ui/auth/pages/landing_page.dart';
import 'package:ccp/ui/auth/pages/login.dart';
import 'package:ccp/ui/auth/pages/otp_verification_after_signup.dart';
import 'package:ccp/ui/auth/pages/signup.dart';
import 'package:ccp/ui/auth/pages/signup_complete.dart';
import 'package:ccp/ui/auth/pages/upload_dp_after_otp.dart';


@MaterialAutoRouter(generateNavigationHelperExtension: true, routes: [
  MaterialRoute(page: AppWidget, initial: true),
  MaterialRoute(page: LandingPageChooseLanguage),
  MaterialRoute(page: SignUpScreen),
  MaterialRoute(page: LoginScreen),
  MaterialRoute(page: SignUpComplete),
  MaterialRoute(page: VerifyOtp),
  MaterialRoute(page: ChooseLocation),
  MaterialRoute(page: UploadProfilePic),
])
class $Router {}
