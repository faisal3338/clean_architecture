//talk to data source that are API or DataBase local

import 'package:clean_code/core/error/exceptions.dart';
import 'package:clean_code/core/error/failures.dart';
import 'package:clean_code/core/network/network_info.dart';
import 'package:clean_code/features/Posts/data/datasources/post_local_data_source.dart';
import 'package:clean_code/features/Posts/data/datasources/post_remote_data_source.dart';
import 'package:clean_code/features/Posts/domin/entities/post.dart';
import 'package:clean_code/features/Posts/domin/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class PostsRepositoryImpl implements PostsRepository {
  final PostRemoteDataSource remoteDateSource;
  final PostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostsRepositoryImpl({required this.remoteDateSource, required this.localDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, Unit>> addPost(Post post) {

  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) {
      // TODO: implement deletePost
      throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async{

    if(isDeviceConnected){
      try {
        final remotePosts = await remoteDateSource.getAllPosts();
        localDataSource.cachePosts(remotePosts);
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await localDataSource.getCachedPosts();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
    
  
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }

  
}