
import 'package:clean_code/core/error/failures.dart';
import 'package:clean_code/features/Posts/domin/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class DeletePostUsecase{
  final PostsRepository repository;
  DeletePostUsecase(this.repository);

  Future<Either<Failure, Unit>> call(int postId) async{
    return await repository.deletePost(postId);
  }
}