import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/tdd_with_bloc/core/error/failure.dart';
import 'package:movieapp/tdd_with_bloc/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:movieapp/tdd_with_bloc/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaReposiroty reposiroty;

  GetConcreteNumberTrivia(this.reposiroty);

  Future<Either<Failure, NumberTrivia>> execute({
    @required int number,
  }) async {
    return await reposiroty.getConcreteNumberTrivia(number);
  }
}
