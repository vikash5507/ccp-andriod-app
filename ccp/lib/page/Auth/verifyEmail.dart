import 'package:flutter/material.dart';
import 'package:ccp/helper/theme.dart';
import 'package:ccp/state/authState.dart';
import 'package:ccp/widgets/customWidgets.dart';
import 'package:ccp/widgets/newWidget/emptyList.dart';
import 'package:ccp/widgets/newWidget/title_text.dart';
import 'package:provider/provider.dart';

class VerifyEmailPage extends StatefulWidget {
  final VoidCallback loginCallback;

  const VerifyEmailPage({Key key, this.loginCallback}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget _body(BuildContext context) {
    return Container(child: Text("Verify Email!!"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: TwitterColor.mystic,
      appBar: AppBar(
        title: customText(
          'Email Verification',
          context: context,
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: CcpColor.primary,
      ),
      body: _body(context),
    );
  }
}
