import 'package:boost/core/constants/types.dart';
import 'package:boost/domain/entities/common/failures.dart';
import 'package:boost/domain/repositories/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  FResult<User> createUserWithEmailAndPassword(String emailAddress, String password) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (credential.user == null) {
        return Left(FirebaseFailure('User not found'));
      }

      return Right(credential.user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return Left(FirebaseFailure('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return Left(FirebaseFailure('The account already exists for that email.'));
      } else {
        return Left(FirebaseFailure(e.message!));
      }
    } catch (e) {
      print(e);
      return Left(UnknownFailure(e.toString()));
    }
  }
}
