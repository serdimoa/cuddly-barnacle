import 'package:qredo_sample/shared/shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_controller.g.dart';

const _dummyUser = Auth.signedIn(
  id: -1,
  displayName: 'My Name',
  email: 'My Email',
  token: 'some-updated-secret-auth-token',
);

@riverpod
class AuthController extends _$AuthController {
  late SharedPreferences _sharedPreferences;
  static const _sharedPrefsKey = 'token';

  @override
  Future<Auth> build() async {
    _sharedPreferences = await SharedPreferences.getInstance();

    _persistenceRefreshLogic();

    return _loginRecoveryAttempt();
  }

  /// Tries to perform a login with the saved token on the persistant storage.
  /// If _anything_ goes wrong, deletes the internal token and returns a [User.signedOut].
  Future<Auth> _loginRecoveryAttempt() async {
    try {
      final savedToken = _sharedPreferences.getString(_sharedPrefsKey);
      if (savedToken == null) {
        throw const UnauthorizedException('No auth token found');
      }

      return await _loginWithToken(savedToken);
    } catch (_, __) {
      await _sharedPreferences.remove(_sharedPrefsKey);
      return const Auth.signedOut();
    }
  }

  /// Mock of a request performed on logout (might be common, or not, whatevs).
  Future<void> logout() async {
    await Future<void>.delayed(networkRoundTripTime);
    state = const AsyncValue<Auth>.data(Auth.signedOut());
  }

  /// Mock of a successful login attempt, which results come from the network.
  Future<void> login(String email, String password) async {
    state = await AsyncValue.guard<Auth>(() async {
      return Future.delayed(
        networkRoundTripTime,
        () => _dummyUser,
      );
    });
  }

  /// Mock of a login request performed with a saved token.
  /// If such request fails, this method will throw an [UnauthorizedException].
  Future<Auth> _loginWithToken(String token) async {
    final logInAttempt = await Future.delayed(
      networkRoundTripTime,
      () => true, // edit this if you wanna play around
    );

    if (logInAttempt) return _dummyUser;

    throw const UnauthorizedException('401 Unauthorized or something');
  }

  /// Internal method used to listen authentication state changes.
  /// When the auth object is in a loading state, nothing happens.
  /// When the auth object is in a error state, we choose to remove the token
  /// Otherwise, we expect the current auth value to be reflected in our persitence API
  void _persistenceRefreshLogic() {
    ref.listenSelf((_, next) {
      if (next.isLoading) return;
      if (next.hasError) {
        _sharedPreferences.remove(_sharedPrefsKey);
        return;
      }

      next.requireValue.map<void>(
        signedIn: (signedIn) =>
            _sharedPreferences.setString(_sharedPrefsKey, signedIn.token),
        signedOut: (signedOut) {
          _sharedPreferences.remove(_sharedPrefsKey);
        },
      );
    });
  }
}

/// Simple mock of a 401 exception
class UnauthorizedException implements Exception {
  const UnauthorizedException(this.message);
  final String message;
}

const networkRoundTripTime = Duration(milliseconds: 750);
