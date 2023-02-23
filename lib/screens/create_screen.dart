import 'package:about/widgets/header_widget.dart';
import 'package:about/widgets/my_text_field_widget.dart';
import 'package:flutter/material.dart';

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
                        fontSize: 20,
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
              height: 10,
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    const MyTextField(
                      label: '제목',
                    ),
                    const MyTextField(
                      label: '작가',
                    ),
                    const MyTextField(
                      label: '완결여부',
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: MyTextField(
                            label: '장르',
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: MyTextField(
                            label: '플랫폼',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: MyTextField(
                            label: '읽은 화수',
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: MyTextField(
                            label: '완결 화수',
                          ),
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
