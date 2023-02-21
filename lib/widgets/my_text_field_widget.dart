import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  const MyTextField({
    super.key,
    required this.label,
  });

  final pink = const Color(0xFFFACCCC);
  final grey = const Color(0xFFF2F2F7);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          TextFormField(
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
              filled: false,
              // fillColor: Colors.white,
              hintStyle: const TextStyle(
                fontSize: 14,
              ),
              focusColor: pink,
              focusedBorder: _border(pink),
              border: _border(grey),
              enabledBorder: const UnderlineInputBorder(),

              // hintText: '제목',
              contentPadding: const EdgeInsets.symmetric(vertical: 20),
            ),
            onSaved: (val) {},
            validator: (val) {
              return null;
            },
          )
        ],
      ),
    );
  }

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: color),
        borderRadius: BorderRadius.circular(12),
      );
}
