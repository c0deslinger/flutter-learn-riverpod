import 'package:graphql/client.dart';

class Graphql {
  var baseUrl = "https://graphqlzero.almansi.me/api";

  static Graphql? _instance;
  GraphQLClient? _client;

  Graphql._internal() {
    setGraphQlClient();
    _instance = this;
  }

  Future<void> setGraphQlClient() async {
    HttpLink httpLink = HttpLink(baseUrl);
    _client = GraphQLClient(
        link: httpLink, cache: GraphQLCache(store: InMemoryStore()));
  }

  Future<GraphQLClient> client() async {
    return _client!;
  }

  static Graphql get instance {
    return _instance ?? Graphql._internal();
  }
}
