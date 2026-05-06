import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function(String, int, String) onNext;
  
  const LoginPage({super.key, required this.onNext});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String selectedGender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.calculate,
                  size: 40,
                  color: Colors.blue.shade600,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'BMI Calculator',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Enter your details to get started',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              // Full Name
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Full Name',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: nameController,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    // Capitalize first letter of each word
                    List<String> words = value.split(' ');
                    List<String> capitalizedWords = words.map((word) {
                      if (word.isEmpty) return word;
                      return word[0].toUpperCase() + word.substring(1).toLowerCase();
                    }).toList();
                    String result = capitalizedWords.join(' ');
                    if (result != value) {
                      nameController.text = result;
                      nameController.selection = TextSelection.fromPosition(
                        TextPosition(offset: result.length),
                      );
                    }
                  }
                },
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    // Ensure capitalization on Enter press
                    List<String> words = value.split(' ');
                    List<String> capitalizedWords = words.map((word) {
                      if (word.isEmpty) return word;
                      return word[0].toUpperCase() + word.substring(1).toLowerCase();
                    }).toList();
                    String result = capitalizedWords.join(' ');
                    nameController.text = result;
                    nameController.selection = TextSelection.fromPosition(
                      TextPosition(offset: result.length),
                    );
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, color: Colors.blue.shade600),
                  hintText: 'Enter your name',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Age
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Age',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.cake, color: Colors.blue.shade600),
                  hintText: 'Enter your age',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Gender
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Gender',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'Male';
                      });
                    },
                    child: Container(
                      width: 150,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: selectedGender == 'Male'
                            ? Colors.blue.shade600
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.male,
                            size: 40,
                            color: selectedGender == 'Male'
                                ? Colors.white
                                : Colors.grey,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Male',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: selectedGender == 'Male'
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'Female';
                      });
                    },
                    child: Container(
                      width: 150,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: selectedGender == 'Female'
                            ? const Color.fromARGB(255, 245, 0, 196)
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.female,
                            size: 40,
                            color: selectedGender == 'Female'
                                ? Colors.white
                                : Colors.grey,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Female',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: selectedGender == 'Female'
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Get Started Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isNotEmpty &&
                        ageController.text.isNotEmpty) {
                      widget.onNext(
                        nameController.text,
                        int.parse(ageController.text),
                        selectedGender,
                      );
                    } else {
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
                    'Get Started',
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
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }
}
