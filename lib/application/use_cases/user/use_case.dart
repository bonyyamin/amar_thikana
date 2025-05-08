import 'package:amar_thikana/core/errors/failure.dart';
import 'package:dartz/dartz.dart';


/// Abstract class for a Use Case in Clean Architecture.
/// [Type] represents the return type of the use case.
/// [Params] represents the input parameters for the use case.
abstract class UseCase<Type, Params> {
  /// Execute the use case with the given parameters.
  /// Returns a [Future] with [Either] containing either a [Failure] or the result of type [Type].
  Future<Either<Failure, Type>> call(Params params);
}

/// A class for use cases that don't require parameters.
class NoParams {
  const NoParams();
}