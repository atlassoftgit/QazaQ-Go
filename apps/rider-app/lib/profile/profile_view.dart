import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:client_shared/components/back_button.dart';
import 'package:client_shared/components/user_avatar_view.dart';
import 'package:ridy/data/images.dart';
import 'package:ridy/generated/l10n.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import '../config.dart';
import '../graphql/generated/graphql_api.graphql.dart';
import '../main/bloc/jwt_cubit.dart';
import '../main/bloc/rider_profile_cubit.dart';
import '../query_result_view.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late GetRider$Query$Rider rider;

  @override
  Widget build(BuildContext context) {
    return Mutation(
      options: MutationOptions(document: UPDATE_PROFILE_MUTATION_DOCUMENT),
      builder: (
        RunMutation runMutation,
        QueryResult? result,
      ) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: SafeArea(
              minimum: const EdgeInsets.all(16),
              child: Query(
                options: QueryOptions(
                    document: GET_RIDER_QUERY_DOCUMENT,
                    fetchPolicy: FetchPolicy.noCache),
                builder: (QueryResult result,
                    {Future<QueryResult?> Function()? refetch,
                    FetchMore? fetchMore}) {
                  if (result.hasException || result.isLoading) {
                    return QueryResultView(result);
                  }

                  rider = GetRider$Query.fromJson(result.data!).rider!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          RidyBackButton(
                              titleRidyBackButton: S.of(context).action_back),
                          const Spacer(),
                          PopupMenuButton(
                            itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                child:
                                    Text(S.of(context).action_delete_account),
                                onTap: () {
                                  Future.delayed(
                                      const Duration(seconds: 0),
                                      () => showDialog(
                                          context: context,
                                          builder: (BuildContext ncontext) {
                                            return AlertDialog(
                                              title: Text(S
                                                  .of(context)
                                                  .delete_account_title),
                                              content: Text(S
                                                  .of(context)
                                                  .delete_account_body),
                                              actions: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8),
                                                      child: Mutation(
                                                          options: MutationOptions(
                                                              document:
                                                                  DELETE_USER_MUTATION_DOCUMENT),
                                                          builder: (RunMutation
                                                                  runMutation,
                                                              QueryResult?
                                                                  result) {
                                                            return TextButton(
                                                                onPressed:
                                                                    () async {
                                                                  await runMutation(
                                                                          {})
                                                                      .networkResult;
                                                                  await Hive.box(
                                                                          'user')
                                                                      .delete(
                                                                          'jwt');
                                                                  await Hive.box(
                                                                          'user')
                                                                      .delete(
                                                                          'jwt');
                                                                  context
                                                                      .read<
                                                                          RiderProfileCubit>()
                                                                      .updateProfile(
                                                                          null);
                                                                  context
                                                                      .read<
                                                                          JWTCubit>()
                                                                      .logOut();
                                                                  await Hive.box(
                                                                          'user')
                                                                      .delete(
                                                                          'jwt');
                                                                  context
                                                                      .read<
                                                                          RiderProfileCubit>()
                                                                      .updateProfile(
                                                                          null);
                                                                  context
                                                                      .read<
                                                                          JWTCubit>()
                                                                      .logOut();
                                                                  Navigator.popUntil(
                                                                      context,
                                                                      (route) =>
                                                                          route
                                                                              .isFirst);
                                                                },
                                                                child: Text(
                                                                  S
                                                                      .of(context)
                                                                      .action_delete_account,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: const TextStyle(
                                                                      color: Color(
                                                                          0xffb20d0e)),
                                                                ));
                                                          }),
                                                    ),
                                                    const Spacer(),
                                                    TextButton(
                                                        onPressed: () =>
                                                            Navigator.of(
                                                                    context)
                                                                .pop(),
                                                        child: Text(
                                                          S
                                                              .of(context)
                                                              .action_cancel,
                                                          textAlign:
                                                              TextAlign.end,
                                                        ))
                                                  ],
                                                ),
                                              ],
                                            );
                                          }));
                                },
                              )
                            ];
                          })
                        ],
                      ),

                      SingleChildScrollView(
                          child: Column(children: [
                        const SizedBox(height: 16),
                        SizedBox(
                          width: 250,
                          child: Stack(
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: UserAvatarView(
                                    urlPrefix: serverUrl,
                                    url: rider.media?.address,
                                    image: Images.defaultUser,
                                    cornerRadius: 100,
                                    size: 150,
                                  ),
                                ),
                              ),
                              Positioned(
                                  left: 60,
                                  bottom: 20,
                                  child: InkWell(
                                    onTap: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform
                                              .pickFiles(type: FileType.image);

                                      if (result != null &&
                                          result.files.single.path != null) {
                                        await uploadFile(
                                            result.files.single.path!);
                                        refetch!();
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: CustomTheme
                                              .primaryColors.shade300,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Icon(
                                        Icons.add,
                                        color:
                                            CustomTheme.neutralColors.shade500,
                                      ),
                                    ),
                                  )),
                              Positioned(
                                right: 0,
                                child: SizedBox(
                                  width: 100,
                                  // height: 175,
                                  child: Image.asset(Images.iconBatyr),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Телефон',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        const SizedBox(height: 10),
                        Form(
                          key: _formKey,
                          child: Column(children: [
                            Text(
                              "+${rider.mobileNumber}",
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            const Divider(
                                thickness: 0.5,
                                color: Colors.black54,
                                height: 0.5),
                            const SizedBox(height: 10),
                            TextFormField(
                              textAlign: TextAlign.center,
                              initialValue: rider.firstName,
                              onChanged: (value) => rider.firstName = value,
                              decoration: InputDecoration(
                                  label: Center(
                                      child: Text(
                                          S.of(context).profile_firstname)),
                                  fillColor:
                                      CustomTheme.primaryColors.shade100),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              textAlign: TextAlign.center,
                              initialValue: rider.lastName,
                              onChanged: (value) {
                                rider.lastName = value;
                              },
                              decoration: InputDecoration(
                                label: Center(
                                    child:
                                        Text(S.of(context).profile_lastname)),
                                fillColor: CustomTheme.primaryColors.shade100,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              textAlign: TextAlign.center,
                              initialValue: rider.email == 'E-Mail'
                                  ? 'Add e-mail'
                                  : rider.email,
                              onChanged: (value) {
                                rider.email = value;
                              },
                              decoration: InputDecoration(
                                label: Center(
                                    child: Text(S.of(context).profile_email)),
                                fillColor: CustomTheme.primaryColors.shade100,
                              ),
                            ),
                          ]).pSymmetric(h: 20),
                        ),
                      ])),
                      const SizedBox(height: 40),
                      const Text(
                        'Батыр \n'
                        'В этом месяце Вы получаете:\n'
                        'Скидку 5% на все поездки \n'
                        'Кэшбек 5% при оплате поездки с кошелька QazaQ GO\n'
                        '\n'
                        'Для поддержания статуса Вам осталось:\n'
                        '5 поездок из 5\n'
                        '\n'
                        'Для перехода на статус Батыр / Бай / Хан Вам осталось:\n'
                        '15 поездок из 15',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ).pSymmetric(h: 20),
                      // const Spacer(),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          Expanded(
                            child: Mutation(
                              options: MutationOptions(
                                  document: UPDATE_PROFILE_MUTATION_DOCUMENT),
                              builder: (RunMutation runMutation,
                                  QueryResult? result) {
                                return SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                    ),
                                    child: Text(
                                      S.of(context).action_save,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                    onPressed: () async {
                                      final args = UpdateProfileArguments(
                                          firstName: rider.firstName ?? "",
                                          lastName: rider.lastName ?? "",
                                          email: rider.email,
                                          gender: rider.gender);
                                      await runMutation(args.toJson())
                                          .networkResult;
                                      refetch!();
                                    },
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  uploadFile(String path) async {
    var postUri = Uri.parse("${serverUrl}upload_profile");
    var request = http.MultipartRequest("POST", postUri);
    request.headers['Authorization'] =
        'Bearer ${Hive.box('user').get('jwt').toString()}';
    request.files.add(await http.MultipartFile.fromPath('file', path));
    await request.send();
  }
}
