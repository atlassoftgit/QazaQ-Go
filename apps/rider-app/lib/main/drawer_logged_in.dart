import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:ridy/address/address_list_view.dart';
import 'package:ridy/generated/l10n.dart';
import 'package:ridy/graphql/generated/graphql_api.graphql.dart';
import 'package:ridy/main/bloc/current_location_cubit.dart';
import 'package:ridy/main/bloc/main_bloc.dart';

import 'bloc/jwt_cubit.dart';
import 'bloc/rider_profile_cubit.dart';

class DrawerLoggedIn extends StatelessWidget {
  final GetCurrentOrder$Query$Rider rider;

  const DrawerLoggedIn({required this.rider, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 16, bottom: 16, right: 5, left: 5),
      child: ListView(children: [
        const SizedBox(
          height: 16,
        ),
        ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(
            S.of(context).menu_profile,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            '★ 5.0',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          onTap: () {
            Navigator.pushNamed(context, 'profile');
          },
        ),
        const Divider(),
        ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(
            S.of(context).menu_programme,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          onTap: () {
            Navigator.pushNamed(context, 'program');
          },
        ),
        const Divider(),
        ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(
            S.of(context).menu_announcements,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          onTap: () {
            Navigator.pushNamed(context, 'announcements');
          },
        ),
        const Divider(),
        ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.titleLarge,
                children: [
                  TextSpan(text: S.of(context).menu_wallet),
                  const TextSpan(
                      text: ' Q', style: TextStyle(color: Colors.red)),
                  const TextSpan(text: 'GO')
                ]),
          ),
          onTap: () {
            Navigator.pushNamed(context, 'wallet');
          },
        ),
        const Divider(
          thickness: 10,
        ),
        ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(S.of(context).menu_saved_locations,
              style: Theme.of(context).textTheme.titleLarge),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: BlocProvider.of<CurrentLocationCubit>(context),
                  child: const AddressListView(),
                ),
              ),
            );
          },
        ),
        const Divider(),
        ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          trailing:
              BlocBuilder<MainBloc, MainBlocState>(builder: (context, state) {
            if (state is! SelectingPoints || state.bookingsCount == 0) {
              return const SizedBox(width: 5, height: 5);
            }
            return Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(50)),
              child: Text(
                state.bookingsCount.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            );
          }),
          title: Text(S.of(context).menu_reserved_rider,
              style: Theme.of(context).textTheme.titleLarge),
          onTap: () {
            Navigator.pushNamed(context, 'reserves');
          },
        ),
        const Divider(),
        ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(S.of(context).menu_trip_history,
              style: Theme.of(context).textTheme.titleLarge),
          onTap: () {
            Navigator.pushNamed(context, 'history');
          },
        ),
        const Divider(
          thickness: 10,
        ),
        ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(
            S.of(context).menu_logout,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          onTap: () async {
            await Hive.box('user').delete('jwt');
            Future.delayed(const Duration(milliseconds: 200), () {
              context.read<JWTCubit>().logOut();
            });
            Future.delayed(const Duration(milliseconds: 500), () {
              context.read<RiderProfileCubit>().updateProfile(null);
            });
          },
        )
      ]),
    );
  }
}
