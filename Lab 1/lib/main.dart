import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(LoanCalculatorApp());
}

class LoanCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoanCalculator(),
    );
  }
}

class LoanCalculator extends StatefulWidget {
  @override
  _LoanCalculatorState createState() => _LoanCalculatorState();
}

class _LoanCalculatorState extends State<LoanCalculator> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _interestController = TextEditingController();
  double _months = 1;
  double _monthlyPayment = 0.0;

  // Function to display error messages
  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _calculateMonthlyPayment() {
    final String amountText = _amountController.text.trim();
    final String interestText = _interestController.text.trim();

    // Validate amount input
    if (amountText.isEmpty) {
      _showError('Please enter the loan amount.');
      return;
    }
    if (interestText.isEmpty) {
      _showError('Please enter the monthly interest rate.');
      return;
    }

    final double? amount = double.tryParse(amountText);
    final double? interestRate = double.tryParse(interestText);
    final int months = _months.toInt();

    if (amount == null || amount <= 0) {
      _showError('Please enter a valid loan amount.');
      return;
    }
    if (interestRate == null || interestRate <= 0) {
      _showError('Please enter a valid interest rate.');
      return;
    }
    if (months <= 0) {
      _showError('Please select a valid number of months.');
      return;
    }

    // If all validations pass, calculate the monthly payment
    final double monthlyRate = interestRate / 100;
    _monthlyPayment =
        (amount * monthlyRate) / (1 - pow(1 + monthlyRate, -months));
    setState(() {}); // Update UI with the calculated result
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter amount',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Amount',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Enter number of months',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _months,
              min: 1,
              max: 60,
              divisions: 59,
              label: '${_months.toInt()} months',
              onChanged: (value) {
                setState(() {
                  _months = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Enter % per month',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _interestController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Percent',
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  Text(
                    'You will pay the approximate amount monthly:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${_monthlyPayment.toStringAsFixed(2)}€',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: _calculateMonthlyPayment,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text('Calculate'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
