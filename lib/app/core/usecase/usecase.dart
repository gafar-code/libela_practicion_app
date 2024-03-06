import 'package:fpdart/fpdart.dart';

import '../error/failure/remote_failure.dart';
import '../network/param.dart';

abstract class UseCase<Type, Argument> {
  Future<Either<RemoteFailure, Type>> call(Argument argument);
}

abstract class UseCaseWithBulkQuery<Type, int, List, String> {
  Future<Either<RemoteFailure, Type>> call(
      int identifier, List queries, String queryKey);
}

abstract class UseCaseLocal<Type, Argument> {
  Future<Either<String, Type>> call(Argument argument);
}

abstract class UseCaseWithParamQuery<Type, Argument, Query extends QueryParam> {
  Future<Either<RemoteFailure, Type>> call(Argument argument, Query query);
}

abstract class UseCaseWithParamBody<Type, Param, Body extends RequestBody> {
  Future<Either<RemoteFailure, Type>> call(Param param, Body body);
}

abstract class UseCaseWithoutArgument<Type> {
  Future<Either<RemoteFailure, Type>> call();
}

abstract class UseCaseWithoutEither<Type> {
  Future<Type> call();
}
