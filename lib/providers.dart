import 'package:flutter_learn_riverpod/app/modules/home/datasources/home_api_datasource.dart';
import 'package:flutter_learn_riverpod/app/modules/home/notifier/home.notifier.dart';
import 'package:flutter_learn_riverpod/app/modules/home/repository/home_repository.dart';
import 'package:flutter_learn_riverpod/controller/graphql.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeDataSourceApiProvider =
    Provider<IHomeApiDatasource>((ref) => HomeApiDatasource(Graphql.instance));

final homeRepositoryProvider = Provider<IHomeRepository>(
    (ref) => HomeRepository(ref.read(homeDataSourceApiProvider)));

final homeProvider = ChangeNotifierProvider.autoDispose<HomeNotifier>(
    (ref) => HomeNotifier(ref.read(homeRepositoryProvider)));
