 import 'package:class1/core/error/failures.dart';
import 'package:class1/core/usecase.dart';
import 'package:class1/features/auth/domain/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class UserSignUp  implements Usecase<String, UserSignUpParams>{
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, String>> call(UserSignUpParams params)  async{
 return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password);
  }


 }
 class UserSignUpParams{
  final String name;
 final String email;
 final String password;

  UserSignUpParams({
     required this.name,
    required this.email,
    required this.password,
 });
 }