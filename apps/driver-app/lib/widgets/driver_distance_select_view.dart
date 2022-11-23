import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'current_location_cubit.dart';
import '../graphql/generated/graphql_api.dart';

class DriverDistanceSelect extends StatelessWidget {
  const DriverDistanceSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Mutation(
        options: MutationOptions(
            document: UPDATE_DRIVER_SEARCH_DISTANCE_MUTATION_DOCUMENT),
        builder: (RunMutation runMutation, QueryResult? result) {
          return BlocBuilder<CurrentLocationCubit, CurrentLocationState>(
            builder: (context, state) {
              return Container(
                width: 60,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.0, 3.0),
                      blurRadius: 6.0,
                      color: Color.fromRGBO(0, 0, 0, 0.35),
                    )
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    CupertinoButton(
                      minSize: 0,
                      padding: EdgeInsets.zero,
                      onPressed: (result?.isLoading ??
                              false || state.radius == null)
                          ? null
                          : () async {
                              if ((state.radius ?? 0) < 10000) {
                                final newDistance = (state.radius ?? 0) + 1000;
                                await runMutation(
                                        UpdateDriverSearchDistanceArguments(
                                                distance: newDistance)
                                            .toJson())
                                    .networkResult;
                                // ignore: use_build_context_synchronously
                                context
                                    .read<CurrentLocationCubit>()
                                    .setRadius(newDistance);
                              }
                            },
                      child: Container(
                        height: 50,
                        width: 60,
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
                    Container(
                      width: 60,
                      padding: const EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                        left: 4,
                        right: 4,
                      ),
                      child: Text(
                        "${((state.radius ?? 0) / 1000).round()} км",
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    CupertinoButton(
                      minSize: 0,
                      padding: EdgeInsets.zero,
                      onPressed: (result?.isLoading ??
                              false || state.radius == null)
                          ? null
                          : () async {
                              if ((state.radius ?? 0) > 1000) {
                                final newDistance = (state.radius ?? 0) - 1000;
                                await runMutation(
                                        UpdateDriverSearchDistanceArguments(
                                                distance: newDistance)
                                            .toJson())
                                    .networkResult;
                                // ignore: use_build_context_synchronously
                                context
                                    .read<CurrentLocationCubit>()
                                    .setRadius(newDistance);
                              }
                            },
                      child: Container(
                          height: 50,
                          width: 60,
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
              );
            },
          );
        });
  }
}
