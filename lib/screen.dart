import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final String name;
  final int age;
  final String gender;
  final double height;
  final double weight;
  final Function() onViewData;
  final Function() onBack;

  const ResultScreen({
    super.key,
    required this.name,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    required this.onViewData,
    required this.onBack,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late double bmi;
  late String bmiStatus;
  late Color statusColor;
  late String advice;

  @override
  void initState() {
    super.initState();
    calculateBMI();
  }

  void calculateBMI() {
    double heightInMeters = widget.height / 100;
    bmi = widget.weight / (heightInMeters * heightInMeters);

    if (bmi < 18.5) {
      bmiStatus = 'Underweight';
      statusColor = Colors.blue;
      advice = 'You are underweight. Consult a doctor for guidance on healthy weight gain.';
    } else if (bmi < 25) {
      bmiStatus = 'Normal';
      statusColor = Colors.green;
      advice = 'Great job! You have a healthy body weight. Keep up the good lifestyle!';
    } else if (bmi < 30) {
      bmiStatus = 'Overweight';
      statusColor = Colors.orange;
      advice = 'You are overweight. Consider a balanced diet and regular exercise.';
    } else {
      bmiStatus = 'Obese';
      statusColor = Colors.red;
      advice = 'You are obese. Consult a healthcare professional for a personalized plan.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: widget.onBack,
        ),
        title: const Text(
          'Your Result',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // BMI Circle
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: statusColor,
                    width: 6,
                  ),
                  color: statusColor.withOpacity(0.1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      bmi.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: statusColor,
                      ),
                    ),
                    Text(
                      'BMI',
                      style: TextStyle(
                        fontSize: 18,
                        color: statusColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Status Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.check_circle, color: Colors.white, size: 20),
                    const SizedBox(width: 10),
                    Text(
                      bmiStatus,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Advice Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  border: Border.all(color: statusColor.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                          color: statusColor,
                          size: 24,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Advice',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: statusColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      advice,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // BMI Scale
              const Text(
                'BMI Scale',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 15),
              _buildBMIScaleItem('Underweight', '< 18.5', Colors.blue),
              _buildBMIScaleItem('Normal', '18.5 - 24.9', Colors.green),
              _buildBMIScaleItem('Overweight', '25.0 - 29.9', Colors.orange),
              _buildBMIScaleItem('Obese', '≥ 30.0', Colors.red),
              const SizedBox(height: 30),
              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: widget.onViewData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade600,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'View All Data',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBMIScaleItem(String label, String range, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Text(
            range,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
