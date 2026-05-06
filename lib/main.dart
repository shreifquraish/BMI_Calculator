import 'package:flutter/material.dart';
import 'login.dart';
import 'height.dart';
import 'screen.dart';
import 'data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  late String name;
  late int age;
  late String gender;
  late double height;
  late double weight;

  void goToHeightPage(String userName, int userAge, String userGender) {
    setState(() {
      name = userName;
      age = userAge;
      gender = userGender;
      currentPage = 1;
    });
  }

  void goToResultPage(double userHeight, double userWeight) {
    setState(() {
      height = userHeight;
      weight = userWeight;
      currentPage = 2;
    });
  }

  void goToDataPage() {
    setState(() {
      currentPage = 3;
    });
  }

  void goBack() {
    setState(() {
      currentPage = currentPage - 1;
    });
  }

  void goToLogin() {
    setState(() {
      currentPage = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (currentPage) {
      case 0:
        return LoginPage(onNext: goToHeightPage);
      case 1:
        return HeightPage(
          name: name,
          age: age,
          gender: gender,
          onNext: goToResultPage,
          onBack: goBack,
        );
      case 2:
        return ResultScreen(
          name: name,
          age: age,
          gender: gender,
          height: height,
          weight: weight,
          onViewData: goToDataPage,
          onBack: goBack,
        );
      case 3:
        return DataPage(
          name: name,
          age: age,
          gender: gender,
          height: height,
          weight: weight,
          onBack: goBack,
        );
      default:
        return LoginPage(onNext: goToHeightPage);
    }
  }
}

