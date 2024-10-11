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
        "addNewConversationCTA":
            MessageLookupByLibrary.simpleMessage("Add new conversation"),
        "appTitle": MessageLookupByLibrary.simpleMessage("Shuei AI Chat"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "changeConversationName":
            MessageLookupByLibrary.simpleMessage("Change conversation name"),
        "chatListEmpty": MessageLookupByLibrary.simpleMessage(
            "You do not have any conversation, please add a new one"),
        "chatTitle": MessageLookupByLibrary.simpleMessage("Chat list"),
        "favoriteTitle": MessageLookupByLibrary.simpleMessage("Favorites list"),
        "helloText":
            MessageLookupByLibrary.simpleMessage("Hello! Leave a message here"),
        "loginEmail": MessageLookupByLibrary.simpleMessage("Your Id"),
        "loginPassword": MessageLookupByLibrary.simpleMessage("Password"),
        "loginToYourAccount": MessageLookupByLibrary.simpleMessage("Login"),
        "newConversations":
            MessageLookupByLibrary.simpleMessage("New Conversations"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "pleaseLoginIn": MessageLookupByLibrary.simpleMessage(
            "Please login to use this feature"),
        "select": MessageLookupByLibrary.simpleMessage("Select"),
        "signUpEmailWrongFormat": MessageLookupByLibrary.simpleMessage(
            "Email is not in the correct format"),
        "startAChat": MessageLookupByLibrary.simpleMessage("Start a chat")
      };
}
