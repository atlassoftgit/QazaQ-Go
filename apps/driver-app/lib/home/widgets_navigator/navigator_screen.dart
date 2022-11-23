import 'package:client_shared/theme/theme.dart';
import 'package:client_shared/utility/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../data/global_variables.dart';
import '../../graphql/generated/graphql_api.graphql.dart';
import '../../main_bloc.dart';
import '../service/map_mode_cubit.dart';
import '../widgets_search/current_view_button.dart';
import '../widgets_service/order_update_button.dart';
import 'next_bend_container.dart';
import 'trip_progress_container.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  @override
  initState() {
    super.initState();

    mapEngine.cameraService.moveToCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final mapMode = context.read<MapModeCubit>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const NextBendContainer(),
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                      border: Border.all(
                        width: 4,
                        color: CustomTheme.renLine,
                      )),
                  child: Center(
                    child: Text(
                      mpsToKph(navigationService.route.speedLimits.first)
                          .toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(flex: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 53,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    children: [
                      CupertinoButton(
                        minSize: 0,
                        padding: EdgeInsets.zero,
                        onPressed: () => mapEngine.cameraService.zoomIn(),
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.all(14),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 6.0,
                                  color: Color.fromRGBO(0, 0, 0, 0.35),
                                )
                              ]),
                          child: const Icon(
                            Icons.add,
                            size: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CupertinoButton(
                        minSize: 0,
                        padding: EdgeInsets.zero,
                        onPressed: () => mapEngine.cameraService.zoomOut(),
                        child: Container(
                            height: 50,
                            padding: const EdgeInsets.all(14),
                            decoration: const BoxDecoration(
                                color: Color(0xffF8F8F8),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0.0, -2.0),
                                    blurRadius: 6.0,
                                    color: Color.fromRGBO(0, 0, 0, 0.35),
                                  )
                                ]),
                            child: const Icon(
                              Icons.remove,
                              size: 25,
                              color: Colors.black,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      mapEngine.cameraService.switchDimensions();
                      setState(() {});
                    },
                    icon: Text(
                      mapEngine.cameraService.dimension,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: mapMode.switchToMap,
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 26,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Mutation(
                    options: MutationOptions(
                        document: UPDATE_ORDER_STATUS_MUTATION_DOCUMENT),
                    builder: (RunMutation runMutation, QueryResult? result) {
                      return BlocBuilder<MainBloc, MainState>(
                          builder: (context, state) {
                        if (state.driver == null) {
                          return Container();
                        }
                        final order = state.driver!.currentOrders.first;

                        if (order.status == OrderStatus.waitingForPostPay) {
                          mapMode.switchToMap();
                        }

                        return OrderUpdateButton(
                          result: result,
                          order: order,
                          runMutation: runMutation,
                        );
                      });
                    },
                  ),
                ),
                const CurrentViewButton(),
              ],
            ),
            const SizedBox(height: 15),
            const TripProgressContainer(),
          ],
        ),
      ),
    );
  }
}
