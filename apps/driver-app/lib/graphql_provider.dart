import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';

ValueNotifier<GraphQLClient> clientFor(
    {required String uri, required String subscriptionUri, String? jwtToken}) {
  final WebSocketLink websocketLink = jwtToken != null
      ? WebSocketLink(subscriptionUri,
          config: SocketClientConfig(initialPayload: {"authToken": jwtToken}))
      : WebSocketLink(subscriptionUri);
  final HttpLink httpLink = jwtToken != null
      ? HttpLink(uri, defaultHeaders: {"Authorization": "Bearer $jwtToken"})
      : HttpLink(uri);
  final Link link = Link.split((request) => request.isSubscription, websocketLink, httpLink);
  final GraphQLCache cache = GraphQLCache(store: HiveStore());
  return ValueNotifier<GraphQLClient>(
    GraphQLClient(
      cache: cache,
      link: link,
      defaultPolicies: DefaultPolicies(
        query: Policies(fetch: FetchPolicy.noCache),
        mutate: Policies(fetch: FetchPolicy.noCache),
        subscribe: Policies(
          fetch: FetchPolicy.noCache,
        ),
      ),
    ),
  );
}

/// Wraps the root application with the `graphql_flutter` client.
/// We use the cache for all state management.
class MyGraphqlProvider extends StatelessWidget {
  MyGraphqlProvider({
    Key? key,
    required this.child,
    required String uri,
    required String subscriptionUri,
    String? jwt,
  })  : client = clientFor(
          uri: uri,
          subscriptionUri: subscriptionUri,
          jwtToken: jwt,
        ),
        super(key: key);

  final Widget child;
  final ValueNotifier<GraphQLClient> client;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: child,
    );
  }
}
