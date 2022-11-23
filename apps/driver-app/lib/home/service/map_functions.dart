import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:latlong2/latlong.dart';

import '../../config.dart';
import '../../graphql/generated/graphql_api.graphql.dart';
import '../../main_bloc.dart';
import '../../widgets/current_location_cubit.dart';

Future<void> onLocationUpdated(Position position, MainBloc bloc, BuildContext context) async {
  final httpLink = HttpLink(
    '${serverUrl}graphql',
  );
  final authLink = AuthLink(
    getToken: () async => 'Bearer ${Hive.box('user').get('jwt')}',
  );
  final link = authLink.concat(httpLink);
  final client = GraphQLClient(
    cache: GraphQLCache(),
    link: link,
  );
  final newLocation = LatLng(position.latitude, position.longitude);
  context.read<CurrentLocationCubit>().setCurrentLocation(newLocation);

  final res = await client.mutate(
    MutationOptions(
      document: UPDATE_DRIVER_LOCATION_MUTATION_DOCUMENT,
      variables: UpdateDriverLocationArguments(
        point: PointInput(
          lat: position.latitude,
          lng: position.longitude,
        ),
      ).toJson(),
      fetchPolicy: FetchPolicy.noCache,
    ),
  );

  bloc.add(AvailableOrdersUpdated(res.data!['updateDriversLocationNew']));
}