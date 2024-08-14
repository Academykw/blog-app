import 'package:class1/core/error/exception.dart';
import 'package:class1/core/error/failures.dart';
import 'package:class1/features/auth/data/auth_remote_data_source.dart';
import 'package:class1/features/auth/domain/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, String>> loginUpWithEmailPassword({required String email, required String password,}) {
    // TODO: implement loginUpWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,


  }) async{
  try{
   final userId = await remoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password);
    return right(userId);
  } on ServerException catch (e){
     return left(Failure(e.message));
  }
  }
  
}