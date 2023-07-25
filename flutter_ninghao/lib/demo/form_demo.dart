import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponents'),
      ),
      body: Theme(
        //覆盖原背景色
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black,
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();

  late String username, password;

  bool autovalidateMode = false;

  //存储数据的方法
  void submitRegisterForm() {
    //验证输入数据是否为空的方法
    if (registerFormKey.currentState!.validate()) {
      registerFormKey.currentState!.save();

      debugPrint('username:$username');
      debugPrint('password:$password');

      //在屏幕底部弹出提示框
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Registering...')));
    } else {
      //不满足则刷新界面，将默认true赋值，默认报错。
      setState(() {
        autovalidateMode = true;
      });
    }
  }

  String? validateUsername(value) {
    if (value.isEmpty) {
      return 'Username is required.';
    }

    return null;
  }

  String? validatePassword(value) {
    if (value.isEmpty) {
      return 'Password is required.';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username',
              helperText: '',
            ),
            onSaved: (newValue) {
              username = newValue!;
            },
            //验证输入方法
            validator: validateUsername,
            //自动验证功能，这里没找到。中，12集，暂时跳过
            //autovalidate: autovalidateMode,
          ),
          TextFormField(
            //输入内容不可见
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              helperText: '',
            ),
            onSaved: (newValue) {
              password = newValue!;
            },
            validator: validatePassword,
            //autovalidateMode: autovalidateMode,这里没找到。中，12集，暂时跳过
          ),
          SizedBox(height: 32.0),
          Container(
            width: double.infinity,
            child: ElevatedButton(
                child: Text('Register', style: TextStyle(color: Colors.white)),
                //保存输入内容
                onPressed: submitRegisterForm,
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue))),
          ),
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({super.key});

  @override
  State<TextFieldDemo> createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    textEditingController.addListener(() {
      debugPrint('input:${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      // onChanged: (value) {
      //   debugPrint('input:$value');
      // },
      onSubmitted: (value) {
        debugPrint('submit:$value');
      },
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        iconColor: const Color.fromARGB(255, 22, 20, 20),
        icon: Icon(Icons.subject),
        labelText: 'Title',
        hintText: '请输入密码',
        //去掉边框
        //border: InputBorder.none,
        //添加边框
        //border: OutlineInputBorder(),
        //添加输入底色
        filled: true,
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
    );
  }
}
