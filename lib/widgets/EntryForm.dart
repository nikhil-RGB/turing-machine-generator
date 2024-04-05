import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EntryForm extends StatefulWidget {
  const EntryForm({super.key});

  @override
  State<EntryForm> createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //This list contains 4 text editing controller,
  //0->m-config;1->symbol;2->actions;3->f-config
  final List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _fieldInput(
            label: "Input M-Config",
            hint: "Example: B",
            index: 0,
          ),
          const Gap(3),
          _fieldInput(
            label: "Input Scanned Symbol",
            hint: "Example: 0",
            index: 1,
          ),
          const Gap(3),
          _fieldInput(
            label: "Input Actions(Px,R,L,E) separated by 0",
            hint: "Example: P0,R,P1",
            index: 2,
          ),
          const Gap(3),
          _fieldInput(
            label: "Input final M-config",
            hint: "Example: Q",
            index: 3,
          ),
        ],
      ),
    );
  }

  //custom widgets
  Widget _fieldInput({
    required String label,
    required String hint,
    required int index,
    // required Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: SizedBox(
        width: (index == 2) ? 400 : 250,
        child: TextFormField(
          // validator: (value) {
          //   return validator(value);
          // },
          controller: _controllers[index],
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            alignLabelWithHint: true,
            labelStyle: const TextStyle(
                fontSize: 15,
                color: Colors.black38,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w400),
            floatingLabelStyle: const TextStyle(color: Color(0xff23a590)),
            hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 3, color: Colors.black12), //<-- SEE HERE
              borderRadius: BorderRadius.circular(50.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.redAccent),
              borderRadius: BorderRadius.circular(50.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.redAccent),
              borderRadius: BorderRadius.circular(50.0),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.blue.shade400),
                borderRadius: BorderRadius.circular(50.0)),
          ),
        ),
      ),
    );
  }
}
