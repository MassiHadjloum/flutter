import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = "/edit_product";
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imgUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _editedProduct =
      Product(id: '', title: '', description: '', price: 0, imageUrl: '');
  var _isInit = true;
  var _isLoading = false;
  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': '',
  };

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    //run before build
    if (_isInit) {
      final productId = ModalRoute.of(context)!.settings.arguments;
      if (productId != null) {
        _editedProduct = Provider.of<ProductsProvider>(context, listen: false)
            .getProductById(productId as String);
        _initMapValues(_editedProduct);
        _imgUrlController.text = _initValues['imageUrl']!;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _initMapValues(Product product) {
    _initValues = {
      'title': product.title,
      'price': product.price.toString(),
      'description': product.description,
      'imageUrl': product.imageUrl,
    };
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void _saveForm() {
    final isValide = _form.currentState!.validate();
    if (!isValide) {
      return;
    }
    _form.currentState!.save();
    setStateLoading(true);
    if (_editedProduct.id != '') {
      Provider.of<ProductsProvider>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct);
      setStateLoading(false);
      Navigator.of(context).pop();
    } else {
      Provider.of<ProductsProvider>(context, listen: false)
          .addProduct(_editedProduct)
          .catchError((err) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('An error has occurred'),
            content: const Text('Something went wrong'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('Okey'),
              ),
            ],
          ),
        );
      }).then((value) {
        //setStateLoading(false);
        Navigator.of(context).pop();
      });
    }
  }

  void setStateLoading(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imgUrlController.dispose();
    _imageUrlFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit product'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Form(
                key: _form,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      initialValue: _initValues['title'],
                      decoration: const InputDecoration(labelText: 'Title'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_priceFocusNode);
                      },
                      onSaved: (value) {
                        setValuesFromForm(value, "title");
                      },
                      validator: (value) {
                        //checkvalidator(value, "Please enter a valid title", "title");
                        if (value!.isEmpty) {
                          return "Please enter a title";
                        }
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['price'],
                      decoration: const InputDecoration(labelText: 'Price'),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      focusNode: _priceFocusNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_descriptionFocusNode);
                      },
                      onSaved: (value) {
                        setValuesFromForm(value, "price");
                      },
                      validator: (value) {
                        //checkvalidator(value, "Please enter a valid price", "price");
                        if (value!.isEmpty) {
                          return "Please enter a price";
                        }
                        if (double.tryParse(value) == null) {
                          return "Please enter a valide number.";
                        }
                        if (double.parse(value) <= 0) {
                          return "Please enter a number greater than zero.";
                        }
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['description'],
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                      textInputAction: TextInputAction.next,
                      focusNode: _descriptionFocusNode,
                      maxLines: 4,
                      keyboardType: TextInputType.multiline,
                      onSaved: (value) {
                        setValuesFromForm(value, "description");
                      },
                      validator: (value) {
                        //checkvalidator(value, "Please enter some description!", "description");
                        if (value!.isEmpty) {
                          return "Please enter a description";
                        }
                        if (value.length < 10) {
                          return "Description length must be at least 10 characters.";
                        }
                        return null;
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: const EdgeInsets.only(top: 8, right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                          ),
                          child: _imgUrlController.text.isEmpty
                              ? const Text("Enter an URL")
                              : FittedBox(
                                  child: Image.network(_imgUrlController.text),
                                  fit: BoxFit.fill,
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Image URL'),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _imgUrlController,
                            focusNode: _imageUrlFocusNode,
                            onEditingComplete: () {
                              setState(() {});
                            },
                            onFieldSubmitted: (_) => _saveForm,
                            onSaved: (value) {
                              setValuesFromForm(value, "imageUrl");
                            },
                            validator: (value) {
                              //checkvalidator(value, "Please enter a valid URL", "URL");
                              if (value!.isEmpty) {
                                return "Please enter an url";
                              }
                              if (!value.startsWith('http') &&
                                  !value.startsWith('https')) {
                                return "Please enter a valid URL";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 10,
                      margin: const EdgeInsets.only(top: 60),
                      child: FloatingActionButton.extended(
                        onPressed: _saveForm,
                        icon: const Icon(Icons.save),
                        label: const Text('Save'),
                        elevation: 5,
                        tooltip: "Save product",
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void setValuesFromForm(dynamic value, String mode) {
    switch (mode) {
      case "price":
        _editedProduct = Product(
            id: _editedProduct.id,
            title: _editedProduct.title,
            description: _editedProduct.description,
            price: double.parse(value),
            imageUrl: _editedProduct.imageUrl,
            isFavorite: _editedProduct.isFavorite);
        break;
      case "description":
        _editedProduct = Product(
            id: _editedProduct.id,
            title: _editedProduct.title,
            description: value,
            price: _editedProduct.price,
            imageUrl: _editedProduct.imageUrl,
            isFavorite: _editedProduct.isFavorite);
        break;
      case "title":
        _editedProduct = Product(
            id: _editedProduct.id,
            title: value,
            description: _editedProduct.description,
            price: _editedProduct.price,
            imageUrl: _editedProduct.imageUrl,
            isFavorite: _editedProduct.isFavorite);
        break;
      case "imageUrl":
        _editedProduct = Product(
            id: _editedProduct.id,
            title: _editedProduct.title,
            description: _editedProduct.description,
            price: _editedProduct.price,
            imageUrl: value,
            isFavorite: _editedProduct.isFavorite);
        break;
    }
  }

  checkvalidator(value, String message, String mode) {
    if (mode == "price") {
      if (value!.isEmpty) {
        return message;
      }
      if (double.tryParse(value) == null) {
        return "Please enter a valide number.";
      }
      if (double.parse(value) <= 0) {
        return "Please enter a number greater than zero.";
      }
    }
    if (value!.isEmpty) {
      return message;
    }
    return null;
  }
}
