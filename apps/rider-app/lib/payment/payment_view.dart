import 'package:flutter/material.dart';
import 'package:ridy/payment/web_view.dart';

class PaymentView extends StatefulWidget {
  final double amount;
  final String phoneNumber;
  const PaymentView({required this.amount, required this.phoneNumber, Key? key})
      : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          amount: widget.amount,
          phoneNumber: widget.phoneNumber,
        ),
      ),
    );
  }
}
