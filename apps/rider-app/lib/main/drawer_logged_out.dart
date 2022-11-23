import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ridy/generated/l10n.dart';
import 'package:ridy/main/bloc/jwt_cubit.dart';
import '../login/login_number_view.dart';

class DrawerLoggedOut extends StatelessWidget {
  const DrawerLoggedOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 16, bottom: 16, right: 5, left: 5),
      child: Column(children: [
        const SizedBox(height: 16),
        ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          minLeadingWidth: 20.0,
          title: Text(S.of(context).menu_login,
              style: Theme.of(context).textTheme.titleLarge),
          onTap: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                constraints: const BoxConstraints(maxWidth: 600),
                builder: (context) {
                  return BlocProvider.value(
                    value: context.read<JWTCubit>(),
                    child: const LoginNumberView(),
                  );
                });
          },
        ),
      ]),
    );
  }
}
