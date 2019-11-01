import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/view_state.dart';
import '../../core/viewmodels/login_model.dart';
import '../shared/app_colors.dart';
import '../widgets/login_header.dart';
import 'base_view.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      model: LoginModel(authenticationService: Provider.of(context)),
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginHeader(
                controller: controller, validationMessage: model.errorMessage),
            model.state == ViewState.Busy
                ? CircularProgressIndicator()
                : FlatButton(
                    color: Colors.white,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      var loginSuccess = await model.login(controller.text);
                      if (loginSuccess) {
                        print("loginSuccess");
                        Navigator.pushNamed(context, '/');
                      }
                    })
          ],
        ),
      ),
    );
  }
}
