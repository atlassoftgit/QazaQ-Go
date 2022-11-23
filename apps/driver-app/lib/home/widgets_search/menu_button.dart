import 'package:client_shared/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../data/keys.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            offset: Offset(3, 3),
            blurRadius: 25,
          ),
        ],
      ),
      child: FloatingActionButton(
        heroTag: 'fabMenu',
        elevation: 0,
        mini: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () => scaffoldKey.currentState?.openDrawer(),
        backgroundColor: CustomTheme.primaryColors.shade50,
        child: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
      ),
    );
  }
}
