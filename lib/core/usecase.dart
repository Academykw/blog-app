import 'package:class1/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class Usecase<SuccessType,Params>{
 Future<Either<Failure,SuccessType>> call( Params params);

}