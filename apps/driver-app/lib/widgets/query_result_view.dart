import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'error_container.dart';
import '../generated/l10n.dart';

class QueryResultView extends StatelessWidget {
  final QueryResult queryResult;

  const QueryResultView(this.queryResult, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (queryResult.isLoading) {
      return Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator.adaptive(),
          const SizedBox(height: 8),
          Text(
            S.of(context).loading,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ));
    }
    if (queryResult.hasException) {
      print(queryResult.exception);
      if (queryResult.exception != null &&
          queryResult.exception!.linkException is ServerException) {
        return ErrorContainer(
          message: S.of(context).no_connection_description,
          title: S.of(context).title_no_connection,
          image: 'images/no_internet.png',
        );
      } else {
        return ErrorContainer(
          message: S.of(context).unexpected_error_description,
          title: S.of(context).title_unexpected_error,
          image: 'images/no_internet.png',
        );
      }
    }
    return Container();
  }
}
