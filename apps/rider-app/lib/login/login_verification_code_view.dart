import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:client_shared/components/sheet_title_view.dart';
import 'package:pinput/pinput.dart';
import 'package:ridy/generated/l10n.dart';
import '../graphql/generated/graphql_api.graphql.dart';

import '../main/bloc/jwt_cubit.dart';

class LoginVerificationCodeView extends StatefulWidget {
  final String verificationId;
  final TextEditingController codeController = TextEditingController();

  LoginVerificationCodeView({Key? key, required this.verificationId})
      : super(key: key);

  @override
  State<LoginVerificationCodeView> createState() =>
      _LoginVerificationCodeViewState();
}

class _LoginVerificationCodeViewState extends State<LoginVerificationCodeView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String code = "";
  var focusNode = FocusNode();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16),
        child: Mutation(
            options: MutationOptions(
                document:
                    LoginMutation(variables: LoginArguments(firebaseToken: ""))
                        .document),
            builder: (RunMutation runMutation, QueryResult? result) {
              return Form(
                key: _formKey,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SheetTitleView(
                        title: S.of(context).title_enter_code,
                        closeAction: () => Navigator.pop(context),
                      ),
                      Text(
                        S.of(context).body_enter_code,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Flexible(
                            child: Pinput(
                              focusNode: focusNode,
                              length: 6,
                              controller: widget.codeController,
                              onCompleted: (value) {
                                setState(() {
                                  isLoading = true;
                                });
                                login(value, runMutation);
                              },
                            ),
                          ),
                        ],
                      ),
                    ]),
              );
            }));
  }

  void login(String code, RunMutation runMutation) async {
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId, smsCode: code);
    try {
      final UserCredential cr =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final String? firebaseToken = await cr.user?.getIdToken();
      final QueryResult? qe =
          await runMutation({"firebaseToken": firebaseToken}).networkResult;
      if (qe?.data == null) {
        widget.codeController.clear();
        const snackBar =
            SnackBar(content: Text("Unable to connect to the backend"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setState(() {
          isLoading = false;
        });
        return;
      }
      final String jwt = Login$Mutation.fromJson(qe!.data!).login.jwtToken;
      final Box box = await Hive.openBox('user');
      box.put("jwt", jwt);
      context.read<JWTCubit>().login(jwt);
      if (!mounted) return;
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      widget.codeController.clear();
      final snackBar = SnackBar(content: Text(e.message ?? e.code));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        isLoading = false;
      });
    }
  }
  // void login(String code, RunMutation runMutation) async {
  //   final PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: widget.verificationId, smsCode: code);
  //   final UserCredential cr =
  //       await FirebaseAuth.instance.signInWithCredential(credential);
  //   final String firebaseToken = await cr.user!.getIdToken();
  //   final QueryResult qe =
  //       await runMutation({"firebaseToken": firebaseToken}).networkResult!;
  //   final String jwt = Login$Mutation.fromJson(qe.data!).login.jwtToken;
  //   final Box box = await Hive.openBox('user');
  //   box.put("jwt", jwt);
  //   context.read<JWTCubit>().login(jwt);
  //   if (!mounted) return;
  //   Navigator.pop(context);
  // }
}
