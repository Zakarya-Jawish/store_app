import 'package:flutter/material.dart';
import 'package:store_app/widget/custom_button.dart';
import 'package:store_app/widget/custom_text_form_field.dart';

class UpdateProductView extends StatelessWidget {
  const UpdateProductView({super.key});
  static const String id = 'updateProduct';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const CustomTextFormField(
              hintText: 'tilte',
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomTextFormField(
              hintText: 'price',
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomTextFormField(
              hintText: 'description',
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomTextFormField(
              hintText: 'image',
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
              function: () {},
              text: 'Update Product',
              color: Colors.cyan,
              colorText: Colors.grey.shade700,
            ),
          ],
        ),
      ),
    );
  }
}
