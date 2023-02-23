import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  const MyTextField({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final purple = Theme.of(context).primaryColor;
    const grey = Colors.black12;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          TextFormField(
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
              filled: false,
              // fillColor: Colors.white,
              hintStyle: const TextStyle(
                fontSize: 14,
              ),
              focusColor: purple,
              focusedBorder: _border(purple),
              border: _border(grey),
              enabledBorder: const UnderlineInputBorder(),

              // hintText: '제목',
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
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
