import 'package:dartz/dartz.dart';
import 'package:movieapp/tdd_with_bloc/core/error/failure.dart';
import 'package:movieapp/tdd_with_bloc/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaReposiroty {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
