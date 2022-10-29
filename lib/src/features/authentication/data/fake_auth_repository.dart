import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/delay.dart';
import '../../../utils/in_memory_store.dart';
import '../models/app_user.dart';

abstract class AuthRepository {
  Stream<AppUser?> authStateChanges();
  AppUser? get currentUser;
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> createUserWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}

class FakeAuthRepository implements AuthRepository {
  FakeAuthRepository({this.addDelay = true});
  final bool addDelay;
  final _authState = InMemoryStore<AppUser?>(null);

  @override
  Stream<AppUser?> authStateChanges() => _authState.stream;
  @override
  AppUser? get currentUser => _authState.value;

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await delay(addDelay);
    _createNewUser(email);
  }

  @override
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    await delay(addDelay);
    _createNewUser(email);
  }

  @override
  Future<void> signOut() async {
    _authState.value = null;
  }

  void dispose() => _authState.close();

  void _createNewUser(String email) {
    _authState.value =
        AppUser(uid: email.split('').reversed.join(), email: email);
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authRepo = FakeAuthRepository();
  ref.onDispose(() => authRepo.dispose());
  return authRepo;
});

final authStateChangesProvider = StreamProvider<AppUser?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});
