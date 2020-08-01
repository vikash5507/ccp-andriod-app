
class Validator {
  bool _isNumeric(String s) {
    for (int i = 0; i < s.length; i++) {
      if (double.tryParse(s[i]) != null) {
        return true;
      }
    }
    return false;
  }

  String validateEmail(String s) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(s)) {
      return 'Please enter an email!';
    } else {
      return null;
    }
  }

  String validateName(String s) {
    if (_isNumeric(s)) {
      return 'Invalid Name!';
    }
    if (s.isEmpty) {
      return 'Don\'t forget your name!';
    }
    return null;
  }

  String validatePassword(String s) {
    if (s.isEmpty) {
      return 'Gotta be secure, enter a password!';
    }
    return null;
  }


  static isValidPassword(String password) {
    //return _passwordRegExp.hasMatch(password);
    int minLength = 6;
    if (password == null || password.isEmpty) {
      return false;
    }

    bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
    //bool hasSpecialCharacters =
    //    password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length > minLength;
    
    return hasDigits &
        hasUppercase &
        hasLowercase &
        hasMinLength;
  }
}
