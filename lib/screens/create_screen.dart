import 'package:about/widgets/bottom_navigator.dart';
import 'package:about/widgets/header_widget.dart';
import 'package:about/widgets/my_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class CreateScreen extends StatelessWidget {
  CreateScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(
              assetImage: const AssetImage('assets/images/gradient1.png'),
              paddingTop: 40,
              paddingBottom: 20,
              insideWidget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: const [
                    Text(
                      '소설 기록하기',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    MyTextField(
                      label: '제목',
                      isNum: false,
                      maxLength: 30,
                      isEssential: true,
                      onSaved: (newValue) {},
                      validator: (value) {
                        if (value.isEmpty) {
                          return '제목을 입력해주세요.';
                        }
                        return null;
                      },
                    ),
                    MyTextField(
                      label: '작가',
                      isNum: false,
                      maxLength: 10,
                      isEssential: false,
                      onSaved: (newValue) {},
                      validator: (value) {
                        return null;
                      },
                    ),
                    const RadioButton(),
                    MyTextField(
                      label: '장르',
                      isNum: false,
                      maxLength: 10,
                      isEssential: false,
                      onSaved: (newValue) {},
                      validator: (value) {
                        return null;
                      },
                    ),
                    const SizedBox(width: 10),
                    MyTextField(
                      label: '플랫폼',
                      isNum: false,
                      maxLength: 10,
                      isEssential: false,
                      onSaved: (newValue) {},
                      validator: (value) {
                        return null;
                      },
                    ),
                    MyTextField(
                      label: '읽은 화수',
                      isNum: true,
                      maxLength: 10,
                      isEssential: false,
                      onSaved: (newValue) {},
                      validator: (value) {
                        return null;
                      },
                    ),
                    const SizedBox(width: 10),
                    MyTextField(
                      label: '완결 화수',
                      isNum: true,
                      maxLength: 10,
                      isEssential: false,
                      onSaved: (newValue) {},
                      validator: (value) {
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SaveButton(formKey: formKey),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          const Size(320, 48),
        ),
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => Theme.of(context).primaryColor,
        ),
      ),
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          //validation이 성공하면 true 가 리턴됨
          const snackBar = SnackBar(
            content: Text(
              '저장 완료!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Color(0xff6f64d7),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          //저장 버튼을 누르면 home으로 이동
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => BottomNavigator()));
        }
      },
      child: const Text(
        '저장',
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class RadioButton extends StatelessWidget {
  const RadioButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                '완독여부',
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CustomRadioButton(
            elevation: 0,
            padding: 10,
            width: 150,

            // enableButtonWrap: true,
            // enableShape: true,
            buttonLables: const ['읽는중', '완독'],
            buttonValues: const [false, true],
            defaultSelected: false,
            radioButtonValue: (value) {
              print(value);
            },
            unSelectedColor: Colors.white,
            selectedColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
