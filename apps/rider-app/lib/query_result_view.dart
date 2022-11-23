import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'generated/l10n.dart';

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
          Text(
            S.of(context).loading,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ));
    }
    if (queryResult.hasException) {
      print(queryResult.exception);
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Image.asset("images/no_internet.png",
                  color: Colors.deepOrangeAccent),
            ),
            const SizedBox(height: 10),
            Text(
              S.of(context).title_no_connection,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                S.of(context).no_connection_description,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text(
                  S.of(context).menu_logout,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox();
  }
}
