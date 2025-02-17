import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveDb {
  static const String _hiveBox = 'hive_box';

  static late Box _box;

  static Future<void> initHive() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    _box = await Hive.openBox(_hiveBox);
  }

  /// has signed up

  static bool get hasSignedUp => _box.get(
        _HiveKeys.hasSignedUp,
        defaultValue: false,
      );

  static Future<void> setHasSignedUp(bool value) async {
    await _box.put(_HiveKeys.hasSignedUp, value);
  }

  /// username

  static String get username => _box.get(
        _HiveKeys.username,
        defaultValue: '',
      );

  static Future<void> setUsername(String value) async {
    await _box.put(_HiveKeys.username, value);
  }

  /// signed up date

  static DateTime? get signedUpDate {
    final dateString = _box.get(_HiveKeys.signedUpDate);
    return dateString != null ? DateTime.parse(dateString) : null;
  }

  static Future<void> setsignedUpDate(DateTime? value) async {
    await _box.put(_HiveKeys.signedUpDate, value?.toIso8601String());
  }

  /// pin code

  static int? get pinCode => _box.get(_HiveKeys.pinCode);

  static Future<void> setpinCode(int? value) async {
    await _box.put(_HiveKeys.pinCode, value);
  }

  /// currency

  static String get currency => _box.get(
        _HiveKeys.currency,
        defaultValue: 'SO’M',
      );

  static Future<void> setCurrency(String value) async {
    await _box.put(_HiveKeys.currency, value);
  }

  /// language

  static String get language => _box.get(
        _HiveKeys.language,
        defaultValue: 'UZ',
      );

  static Future<void> setLanguage(String value) async {
    await _box.put(_HiveKeys.language, value);
  }
}

class _HiveKeys {
  static const String hasSignedUp = 'hasSignedUp';
  static const String username = 'username';
  static const String signedUpDate = 'signedUpDate';
  static const String pinCode = 'pinCode';
  static const String currency = 'currency';
  static const String language = 'language';
}
