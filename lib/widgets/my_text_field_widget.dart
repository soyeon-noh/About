import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final bool isNum;
  final int maxLength;
  final bool isEssential;
  final FormFieldSetter onSaved;
  final FormFieldValidator validator;
  const MyTextField({
    super.key,
    required this.label,
    required this.isNum,
    required this.maxLength,
    required this.isEssential,
    required this.onSaved,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final purple = Theme.of(context).primaryColor;
    const grey = Colors.black12;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                      text: label,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: 'Noto',
                      ),
                      children: [
                        isEssential
                            ? const TextSpan(
                                text: ' *',
                                style: TextStyle(
                                  color: Colors.red,
                                ))
                            : const TextSpan(
                                text: '',
                              )
                      ]),
                ),
              ],
            ),
          ),
          TextFormField(
            cursorColor: Theme.of(context).primaryColor,
            keyboardType: isNum ? TextInputType.number : TextInputType.text,
            maxLength: maxLength,
            autovalidateMode: AutovalidateMode.always,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(10, 0, 0, 0),
              hintStyle: const TextStyle(
                fontSize: 14,
              ),
              suffixText: isNum ? '화' : '',

              focusColor: Theme.of(context).primaryColor,

              focusedBorder: _border(
                Theme.of(context).primaryColor,
              ),
              border: _border(
                Colors.transparent,
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),

              // hintText: '제목',
              contentPadding: const EdgeInsets.symmetric(
                // vertical: 10,
                horizontal: 10,
              ),
            ),
            onSaved: onSaved,
            validator: validator,
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: color),
        borderRadius: BorderRadius.circular(8),
      );
}
