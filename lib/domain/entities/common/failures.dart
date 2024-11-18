abstract class Failure {
  final String message;

  Failure(this.message);
}

class UnknownFailure extends Failure {
  UnknownFailure(super.message);
}

class FirebaseFailure extends Failure {
  FirebaseFailure(super.message);
}