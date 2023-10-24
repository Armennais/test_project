import 'package:flutter/material.dart';
import 'package:test_project/image_upload.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController textController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            ImageUploadField(),
            TextFormField(
              controller: textController,
              decoration: const InputDecoration(labelText: 'Текстовое поле'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Это поле обязательно для заполнения';
                }
                return null;
              },
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Пароль'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Это поле обязательно для заполнения';
                }
                if (value.length < 6) {
                  return 'Пароль должен содержать как минимум 6 символов';
                }
                return null;
              },
            ),
            InputDatePickerFormField(
              firstDate: DateTime(1930),
              lastDate: DateTime(2030),
              errorFormatText: 'неверный формат',
              fieldLabelText: 'Введите дату',
            ),
            TextFormField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Цифровое поле'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Это поле обязательно для заполнения';
                }
                if (int.tryParse(value) == null) {
                  return 'Введите цифровое значение';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
              },
              child: const Text('Подтвердить'),
            ),
          ],
        ),
      ),
    );
  }
}
