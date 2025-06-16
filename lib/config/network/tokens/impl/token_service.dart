import 'package:ashafaq/config/helpers/secure_storage.dart';
import 'package:ashafaq/config/network/tokens/interface/i_tokens.dart';
import 'package:ashafaq/core/constants/json_keys.dart';

final class TokensService implements TokenServiceInterface {
  final _secureStorage = SecureStorage();
  @override
  Future deleteAccessToken() async =>
      _secureStorage.delete(JsonKeys.accessToken);

  @override
  Future deleteRefreshToken() async =>
      await _secureStorage.delete(JsonKeys.refreshToken);

  @override
  Future<String?> fetchAccessToken() async =>
      await _secureStorage.read(JsonKeys.accessToken);

  @override
  Future<String?> fetchRefreshToken() async =>
      await _secureStorage.read(JsonKeys.refreshToken);

  @override
  Future<bool> storeAccessToken(String value) async =>
      await _secureStorage.store(JsonKeys.accessToken, value);

  @override
  Future<bool> storeRefreshToken(String value) async =>
      await _secureStorage.store(JsonKeys.refreshToken, value);

  @override
  Future<bool> updateAccessToken(String value) async =>
      await _secureStorage.update(JsonKeys.accessToken, value);

  @override
  Future<bool> updateRefreshToken(String value) async =>
      await _secureStorage.update(JsonKeys.refreshToken, value);
}
