import 'package:flutter/material.dart';

class CustomerServiceAndSupportScreen extends StatefulWidget {
  const CustomerServiceAndSupportScreen({super.key});

  @override
  State<CustomerServiceAndSupportScreen> createState() => _CustomerServiceAndSupportScreenState();
}

class _CustomerServiceAndSupportScreenState extends State<CustomerServiceAndSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SafeArea(child: Text("Value")),
      ),
    );
  }
}