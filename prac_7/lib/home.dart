import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    var _currentStep=0;
    List<Step> _stepperSteps = [
      Step(
        title: Text('Step 1'),
        content: Text('This is the content of Step 1'),
        isActive: _currentStep == 0,
      ),
      Step(
        title: Text('Step 2'),
        content: Text('This is the content of Step 2'),
        isActive: _currentStep == 1,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper Example'),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < _stepperSteps.length - 1) {
            setState(() {
              _currentStep++;
            });
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep--;
            });
          }
        },
        steps: _stepperSteps,
      ),
    );
  }
}