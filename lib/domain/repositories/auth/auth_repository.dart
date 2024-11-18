import 'package:boost/core/constants/types.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class AuthRepository {
  FResult<auth.User> createUserWithEmailAndPassword(String emailAddress, String password);
}
