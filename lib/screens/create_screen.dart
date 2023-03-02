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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '소설 기록하기',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '완료',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white54,
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
                    Column(
                      children: [
                        Text(
                          '필수 정보',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const MyTextField(
                          label: '제목',
                          isNum: false,
                          maxLength: 30,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '선택 정보',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const MyTextField(
                          label: '작가',
                          isNum: false,
                          maxLength: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Row(
                                  children: const [
                                    Text(
                                      '완결여부',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
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
                        ),
                        Row(
                          children: const [
                            Expanded(
                              child: MyTextField(
                                label: '장르',
                                isNum: false,
                                maxLength: 10,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: MyTextField(
                                label: '플랫폼',
                                isNum: false,
                                maxLength: 10,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Expanded(
                              child: MyTextField(
                                label: '읽은 화수',
                                isNum: true,
                                maxLength: 10,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: MyTextField(
                                label: '완결 화수',
                                isNum: true,
                                maxLength: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
