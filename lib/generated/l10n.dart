// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Shuei AI Chat`
  String get appTitle {
    return Intl.message(
      'Shuei AI Chat',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add new conversation`
  String get addNewConversationCTA {
    return Intl.message(
      'Add new conversation',
      name: 'addNewConversationCTA',
      desc: '',
      args: [],
    );
  }

  /// `You do not have any conversation, please add a new one`
  String get chatListEmpty {
    return Intl.message(
      'You do not have any conversation, please add a new one',
      name: 'chatListEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Start a chat`
  String get startAChat {
    return Intl.message(
      'Start a chat',
      name: 'startAChat',
      desc: '',
      args: [],
    );
  }

  /// `New Conversations`
  String get newConversations {
    return Intl.message(
      'New Conversations',
      name: 'newConversations',
      desc: '',
      args: [],
    );
  }

  /// `Hello! Leave a message here`
  String get helloText {
    return Intl.message(
      'Hello! Leave a message here',
      name: 'helloText',
      desc: '',
      args: [],
    );
  }

  /// `Change conversation name`
  String get changeConversationName {
    return Intl.message(
      'Change conversation name',
      name: 'changeConversationName',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginToYourAccount {
    return Intl.message(
      'Login',
      name: 'loginToYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Your Id`
  String get loginUserName {
    return Intl.message(
      'Your Id',
      name: 'loginUserName',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get loginEmail {
    return Intl.message(
      'Email address',
      name: 'loginEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email is not in the correct format`
  String get signUpEmailWrongFormat {
    return Intl.message(
      'Email is not in the correct format',
      name: 'signUpEmailWrongFormat',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get loginPassword {
    return Intl.message(
      'Password',
      name: 'loginPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password confirmation`
  String get loginRePassword {
    return Intl.message(
      'Password confirmation',
      name: 'loginRePassword',
      desc: '',
      args: [],
    );
  }

  /// `Password confirmation does not match`
  String get loginRePasswordNotMatch {
    return Intl.message(
      'Password confirmation does not match',
      name: 'loginRePasswordNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Please login to use this feature`
  String get pleaseLoginIn {
    return Intl.message(
      'Please login to use this feature',
      name: 'pleaseLoginIn',
      desc: '',
      args: [],
    );
  }

  /// `Favorites list`
  String get favoriteTitle {
    return Intl.message(
      'Favorites list',
      name: 'favoriteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Chat list`
  String get chatTitle {
    return Intl.message(
      'Chat list',
      name: 'chatTitle',
      desc: '',
      args: [],
    );
  }

  /// `Speech is not available`
  String get speechIsNotAvailable {
    return Intl.message(
      'Speech is not available',
      name: 'speechIsNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Place`
  String get place {
    return Intl.message(
      'Place',
      name: 'place',
      desc: '',
      args: [],
    );
  }

  /// `Account setting`
  String get profileTitle {
    return Intl.message(
      'Account setting',
      name: 'profileTitle',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logOut {
    return Intl.message(
      'Log out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Do not have an account?`
  String get doNotHaveAccount {
    return Intl.message(
      'Do not have an account?',
      name: 'doNotHaveAccount',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ja'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
