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

  /// `Home`
  String get mainHomeBottom {
    return Intl.message(
      'Home',
      name: 'mainHomeBottom',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get mainFavoriteBottom {
    return Intl.message(
      'Favorite',
      name: 'mainFavoriteBottom',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get mainChatBottom {
    return Intl.message(
      'Chat',
      name: 'mainChatBottom',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get mainProfileBottom {
    return Intl.message(
      'Profile',
      name: 'mainProfileBottom',
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
