// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Already have an account?",
    ),
    "authValidationMessage": MessageLookupByLibrary.simpleMessage(
      "email or password isn\'t correct",
    ),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("Confirm Password"),
    "continueText": MessageLookupByLibrary.simpleMessage("Continue"),
    "dontHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account?",
    ),
    "emailValidation": MessageLookupByLibrary.simpleMessage(
      "email can\'t be empty",
    ),
    "enterEmailAddress": MessageLookupByLibrary.simpleMessage(
      "Enter Email Address",
    ),
    "forgetPass": MessageLookupByLibrary.simpleMessage("Forget Password?"),
    "joinNowMessage": MessageLookupByLibrary.simpleMessage(
      "Join now and start your learning journey!",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "now": MessageLookupByLibrary.simpleMessage("Now"),
    "or": MessageLookupByLibrary.simpleMessage("Or"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordNotMatch": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "passwordResetEmail": MessageLookupByLibrary.simpleMessage(
      "A password reset link has been sent to your email",
    ),
    "passwordValidation": MessageLookupByLibrary.simpleMessage(
      "password can\'t be empty",
    ),
    "phoneNumberValidation": MessageLookupByLibrary.simpleMessage(
      "Please enter your phone number",
    ),
    "register": MessageLookupByLibrary.simpleMessage("Register"),
    "sendLink": MessageLookupByLibrary.simpleMessage("Send Link"),
    "username": MessageLookupByLibrary.simpleMessage("Username"),
    "usernameValidation": MessageLookupByLibrary.simpleMessage(
      "Please enter your username",
    ),
  };
}
