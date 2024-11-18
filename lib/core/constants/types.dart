import 'package:dartz/dartz.dart';

import '../../domain/entities/common/failures.dart';

typedef Result<T> = Either<Failure, T>;
typedef FResult<T> = Future<Result<T>>;