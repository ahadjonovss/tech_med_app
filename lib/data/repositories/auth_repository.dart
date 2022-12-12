import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthRepository {
  final FirebaseAuth _auth;

  AuthRepository({required FirebaseAuth firebaseAuth}) : _auth = firebaseAuth;

  Future<void> signUp({required email, required password}) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> signIn({required email, required password}) async {
      return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Stream<User?> authState() async* {
    yield* _auth.authStateChanges();
  }
}
