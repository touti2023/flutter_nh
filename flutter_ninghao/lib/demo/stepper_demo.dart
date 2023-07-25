import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  const StepperDemo({Key? key}) : super(key: key);

  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StepperDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
                data: Theme.of(context).copyWith(primaryColor: Colors.black),
                child: Stepper(
                    //表示步骤索引值
                    currentStep: _currentStep,
                    onStepTapped: (value) {
                      setState(() {
                        _currentStep = value;
                      });
                    },
                    //继续与否按钮
                    onStepContinue: () {
                      setState(() {
                        _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
                      });
                    },
                    //离开与否按钮
                    onStepCancel: () {
                      setState(() {
                        _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                      });
                    },
                    steps: [
                      Step(
                        title: Text('Login'),
                        subtitle: Text('Login first'),
                        content: Text('bbg'),
                        isActive: _currentStep == 0,
                      ),
                      Step(
                        title: Text('choose plan'),
                        subtitle: Text('112233'),
                        content: Text('bbg'),
                        isActive: _currentStep == 1,
                      ),
                      Step(
                        title: Text('gggfd'),
                        subtitle: Text('Losst'),
                        content: Text('bbsdag'),
                        isActive: _currentStep == 2,
                      ),
                    ]))
          ],
        ),
      ),
    );
  }
}
