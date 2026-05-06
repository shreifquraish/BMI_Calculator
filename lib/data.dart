import 'package:flutter/material.dart';

class DataPage extends StatefulWidget {
  final String name;
  final int age;
  final String gender;
  final double height;
  final double weight;
  final Function() onBack;

  const DataPage({
    super.key,
    required this.name,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    required this.onBack,
  });

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  late double bmi;
  late String bmiStatus;
  late Color statusColor;

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
    } else if (bmi < 25) {
      bmiStatus = 'Normal';
      statusColor = Colors.green;
    } else if (bmi < 30) {
      bmiStatus = 'Overweight';
      statusColor = Colors.orange;
    } else {
      bmiStatus = 'Obese';
      statusColor = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: widget.onBack,
        ),
        title: const Text(
          'Your Data',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Health Metrics',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 15),
              // Height Card
              _buildDataCard(
                icon: Icons.height,
                label: 'Height',
                value: '${widget.height.toStringAsFixed(1)} cm',
                color: Colors.blue,
              ),
              const SizedBox(height: 12),
              // Weight Card
              _buildDataCard(
                icon: Icons.scale,
                label: 'Weight',
                value: '${widget.weight.toStringAsFixed(1)} kg',
                color: Colors.purple,
              ),
              const SizedBox(height: 12),
              // BMI Card
              _buildDataCard(
                icon: Icons.trending_up,
                label: 'BMI',
                value: bmi.toStringAsFixed(1),
                color: statusColor,
                status: bmiStatus,
              ),
              const SizedBox(height: 25),
              const Text(
                'Additional Information',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 15),
              // Gender Card
              _buildInfoCard(
                'Gender',
                widget.gender,
                Icons.wc,
                Colors.indigo,
              ),
              const SizedBox(height: 12),
              // Age Card
              _buildInfoCard(
                'Age',
                '${widget.age} years',
                Icons.cake,
                Colors.pink,
              ),
              const SizedBox(height: 12),
              // BMI Status Card
              _buildInfoCard(
                'BMI Status',
                bmiStatus,
                Icons.health_and_safety,
                statusColor,
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDataCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    String? status,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          if (status != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                status,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
