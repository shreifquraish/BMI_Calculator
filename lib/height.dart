import 'package:flutter/material.dart';

class HeightPage extends StatefulWidget {
  final String name;
  final int age;
  final String gender;
  final Function(double, double) onNext;
  final Function() onBack;

  const HeightPage({
    super.key,
    required this.name,
    required this.age,
    required this.gender,
    required this.onNext,
    required this.onBack,
  });

  @override
  State<HeightPage> createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  String heightError = '';
  String weightError = '';

  void validateInputs() {
    setState(() {
      heightError = '';
      weightError = '';

      if (heightController.text.isNotEmpty) {
        final height = double.tryParse(heightController.text);
        if (height == null || height < 120 || height > 220) {
          heightError = 'Enter Height 120-220';
        }
      }

      if (weightController.text.isNotEmpty) {
        final weight = double.tryParse(weightController.text);
        if (weight == null || weight < 40 || weight > 300) {
          weightError = 'Enter Weight 40-300';
        }
      }
    });
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
          'BMI Calculator',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: widget.gender == 'Female'
                      ? const Color.fromARGB(255, 255, 240, 245)
                      : Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: widget.gender == 'Female'
                                ? const Color.fromARGB(255, 255, 192, 203)
                                : Colors.blue.shade200,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            widget.gender == 'Male' ? Icons.male : Icons.female,
                            color: widget.gender == 'Female'
                                ? const Color.fromARGB(255, 245, 0, 196)
                                : Colors.blue.shade600,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome, ${widget.name}!',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '${widget.gender} • ${widget.age} years old',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Height Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.height, color: Colors.blue.shade600, size: 24),
                      const SizedBox(width: 10),
                      const Text(
                        'Height',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    '120 - 220 cm',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter height',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  suffixText: 'cm',
                  suffixStyle: TextStyle(
                    color: Colors.blue.shade600,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              if (heightError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    heightError,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              const SizedBox(height: 30),
              // Weight Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.accessibility, color: Colors.blue.shade600, size: 24),
                      const SizedBox(width: 10),
                      const Text(
                        'Weight',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    '40 - 300 kg',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter weight',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  suffixText: 'kg',
                  suffixStyle: TextStyle(
                    color: Colors.blue.shade600,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              if (weightError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    weightError,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              const SizedBox(height: 30),
              // Formula Info
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  border: Border.all(color: Colors.amber.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info, color: Colors.amber.shade600, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'BMI = weight (kg) ÷ height² (m²)',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.amber.shade900,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Calculate Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    validateInputs();

                    if (heightController.text.isNotEmpty &&
                        weightController.text.isNotEmpty &&
                        heightError.isEmpty &&
                        weightError.isEmpty) {
                      final height = double.parse(heightController.text);
                      final weight = double.parse(weightController.text);
                      widget.onNext(height, weight);
                    } else if (heightController.text.isEmpty ||
                        weightController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill all fields'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade600,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Calculate BMI',
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

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }
}
