import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomerInquiries extends StatelessWidget {
  const CustomerInquiries({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset('assets/animations/customer.json'));
  }
}
