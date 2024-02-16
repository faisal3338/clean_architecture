
import 'package:clean_code/core/error/failures.dart';
import 'package:clean_code/features/Posts/domin/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/post.dart';

class getAllPostsUsecase{
  final PostsRepository repository;

  getAllPostsUsecase(this.repository);

//we use call rather than get. call = callable concept
Future<Either<Failure, List<Post>>> call() async {
  return await repository.getAllPosts();
}
}