// import 'package:dartz/dartz.dart';
// import 'package:mockito/mockito.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:movieapp/tdd_with_bloc/features/number_trivia/domain/entities/number_trivia.dart';
// import 'package:movieapp/tdd_with_bloc/features/number_trivia/domain/repositories/number_trivia_repository.dart';
// import 'package:movieapp/tdd_with_bloc/features/number_trivia/domain/usecases/get_concrate_number_trivia.dart';

// class MockNumberTriviaRepository extends Mock
//     implements NumberTriviaReposiroty {}

// void main() {
//   GetConcreteNumberTrivia usecase;
//   MockNumberTriviaRepository mockNumberTriviaRepository;
//   setUp(() {
//     mockNumberTriviaRepository = MockNumberTriviaRepository();
//     usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
//   });

//   final tNumber = 1;
//   final tNumberTrivia = NumberTrivia(text: 'Test louuur', number: 1);

//   test(
//     'Bisa ambil nomor dari repo',
//     () async {
//       //arrange
//       when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
//           .thenAnswer((_) async => Right(tNumberTrivia));
//       //act
//       final result = await usecase.execute(number: tNumber);
//       //assetr
//       expect(result, Right(tNumberTrivia));
//       verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
//       verifyNoMoreInteractions(mockNumberTriviaRepository);
//     },
//   );
// }
