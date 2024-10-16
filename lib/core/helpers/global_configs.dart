class GlobalConfig {
  static const String baseUrl =
      'https://personal-ai.hayato-enomoto.workers.dev/api/';

  // Locale
  static const String languageJa = 'ja';
  static const String languageEn = 'en';

  // Dio
  static const int connectTimeOut = 50000;
  static const int receiveTimeout = 50000;

  // Format date time
  static const dateTimeFormatHeader = 'EEE d MMMM, yyyy';
  static const dateTimeFormatArticle = 'MMM dd';
  static const dateTimeFormatArticleDetail = 'MMM dd, y';

  // .env
  static const String envPath = '.env';
  static const String difyApiKey = 'difyApiKey';
  static const String xApiKey = 'xApiKey';

  // PageSize
  static const int pageSize = 20;

  // Hive
  static String hiveLaskBox = 'laskBox';
  static String hiveArticles = 'articles';
  static String hiveBookmarks = 'bookmarks';
}
