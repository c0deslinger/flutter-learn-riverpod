import 'package:either_option/either_option.dart';
import 'package:flutter_learn_riverpod/app/modules/home/datasources/home_api_datasource.dart';
import 'package:flutter_learn_riverpod/app/modules/home/models/home.dart';
import 'package:flutter_learn_riverpod/error/error.dart';
import 'package:flutter_learn_riverpod/error/exceptions.dart';

abstract class IHomeRepository {
  Future<Either<Failure, HomeResponse>> getHome();
}

class HomeRepository extends IHomeRepository {
  final IHomeApiDatasource homeApiDatasource;

  HomeRepository(this.homeApiDatasource);

  @override
  Future<Either<Failure, HomeResponse>> getHome() async {
    try {
      final data = await homeApiDatasource.getPost();
      return Right(data);
    } on NoResultsFoundException {
      return Left(NoResultsFoundFailure());
    } on Exception {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnhandledFailure());
    }
  }
}
