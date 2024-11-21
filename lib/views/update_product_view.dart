import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/widget/custom_button.dart';
import 'package:store_app/widget/custom_text_form_field.dart';

import '../models/product_model.dart';
import '../services/update_product_service.dart';

class UpdateProductView extends StatefulWidget {
  UpdateProductView({
    super.key,
  });
  static const String id = 'updateProduct';

  @override
  State<UpdateProductView> createState() => _UpdateProductViewState();
}

class _UpdateProductViewState extends State<UpdateProductView> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  final TextEditingController descController = TextEditingController();

  final TextEditingController imageController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    print(isLoading);
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    titleController.text = product.title;
    priceController.text = product.price.toString();
    descController.text = product.description;
    imageController.text = product.image;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Product'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                CustomTextFormField(
                  hintText: 'tilte',
                  controller: titleController,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  hintText: 'price',
                  controller: priceController,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  hintText: 'description',
                  controller: descController,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  hintText: 'image',
                  controller: imageController,
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: 'Update Product',
                  color: Colors.cyan,
                  colorText: Colors.grey.shade700,
                  function: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      await updateProduct(product);

                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    UpdateProductService().updateProduct(
      id: product.id,
      category: product.category,
      title: titleController.text,
      price: priceController.text,
      description: descController.text,
      image: imageController.text,
    );
  }
}
