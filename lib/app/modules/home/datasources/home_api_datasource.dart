import 'package:flutter/material.dart';
import 'package:flutter_learn_riverpod/app/modules/home/models/home.dart';
import 'package:flutter_learn_riverpod/controller/graphql.dart';
import 'package:flutter_learn_riverpod/controller/query.dart';
import 'package:graphql/client.dart';

abstract class IHomeApiDatasource {
  Future<HomeResponse> getPost();
}

class HomeApiDatasource extends IHomeApiDatasource {
  final Graphql graphqlInstance;

  HomeApiDatasource(this.graphqlInstance);

  @override
  Future<HomeResponse> getPost() async {
    try {
      var client = await graphqlInstance.client();
      final response = await client.query(QueryOptions(
          document: gql(getLastPost), fetchPolicy: FetchPolicy.networkOnly));
      debugPrint("[DATASOURCE] Response Data: " + response.data.toString());
      if (response.hasException) {
        throw response.exception!;
      }
      var homeResponse = HomeResponse.fromJson(response.data!);
      return homeResponse;
    } catch (e) {
      debugPrint("Error: " + e.toString());
      rethrow;
    }
  }
}
