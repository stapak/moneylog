import 'package:flutter/material.dart';

void main(){
  runApp(const BudgetApp());
}

class BudgetApp extends StatelessWidget{
  const BudgetApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'Budget App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }

}

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Budget'),
      ),
      body: const Center(
        child: Text(
            'Budget App',
            style: TextStyle(
                fontSize:24,
                fontWeight: FontWeight.bold,
                ),
            ),
        ),
      );
  }
}