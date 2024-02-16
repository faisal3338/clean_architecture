
import 'package:clean_code/core/error/failures.dart';
import 'package:clean_code/features/Posts/domin/entities/post.dart';
import 'package:clean_code/features/Posts/domin/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class AddPostUsecase{
  final PostsRepository repository;
  AddPostUsecase(this.repository);

  Future<Either<Failure, Unit>> call(Post post) async{
    return await repository.addPost(post);
  }
}