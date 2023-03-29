import 'dart:io';
import 'package:campus_connect/constants/routes.dart';
import 'package:campus_connect/utilities/drawer_widget.dart';
import 'package:campus_connect/utilities/show_error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAdScreen extends StatefulWidget {
  const CreateAdScreen({Key? key}) : super(key: key);

  @override
  State<CreateAdScreen> createState() => _CreateAdScreenState();
}

class _CreateAdScreenState extends State<CreateAdScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productDetailsController =
      TextEditingController();
  final TextEditingController vendorNameController = TextEditingController();
  final TextEditingController vendorNumberController = TextEditingController();
  String? categoryValue = "";
  String? locationValue = "";
  File? _imageFile;
  final _firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  late XFile _image;

  Future<void> _pickImage() async {
    _image = (await ImagePicker().pickImage(source: ImageSource.gallery))!;
      setState(() {
        _imageFile = File(_image.path);
      });
  }

  Future<void> addAd(
      String productName,
      String vendorName,
      String phoneNumber,
      String productDetails,
      String productCategory,
      String vendorLocation) async {
    final CollectionReference ads = _firestore.collection('ads');
    if (_imageFile != null) {
      final url = _image.path;
      await ads.doc(productName).set({
        'imagePath': url,
        'phoneNumber': phoneNumber,
        'productCategory': productCategory,
        'productDetails': productDetails,
        'productName': productName,
        'vendorEmail': user!.email.toString(),
        'vendorLocation': vendorLocation,
        'vendorName': vendorName,
      });
    } else {
      showErrorDialog(context, 'Please select an image');
    }
  }


  void pushReplacementRoute(String route) {
    Navigator.pushReplacementNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      drawer: const DrawerWidget(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Enter Ad Details',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: GestureDetector(
              onTap: _pickImage,
              child: SizedBox(
                width: 200,
                height: 200,
                child: ClipRect(
                    clipBehavior: Clip.hardEdge,
                    child: _imageFile != null
                        ? Image.file(
                            _imageFile!,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            "assets/sad_photo_icon.png",
                            fit: BoxFit.cover,
                          )),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Center(
            child: Text(
              "Click on the image above to insert a picture of your product",
              style: TextStyle(fontSize: 13),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              maxLines: 1,
              autocorrect: false,
              keyboardType: TextInputType.text,
              controller: productNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'Product Name',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              maxLines: 1,
              autocorrect: false,
              keyboardType: TextInputType.text,
              controller: vendorNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'Vendor Name / Company Name',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              maxLines: 1,
              autocorrect: false,
              keyboardType: TextInputType.number,
              controller: vendorNumberController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'Phone Number',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              maxLines: 10,
              autocorrect: false,
              keyboardType: TextInputType.text,
              controller: productDetailsController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'Product Details',
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              const Text('Select the category of your product:'),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(style: BorderStyle.solid, color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton(
                  value: categoryValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      categoryValue = newValue;
                    });
                  },
                  items: <String>[
                    '',
                    'Food',
                    'Books and Stationery',
                    'Clothes and Accessories',
                    'Cosmetics',
                    'Phones and Accessories',
                    'Computers and Accessories',
                    'Services',
                    'Drugs and Medical Products'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              const Text('Select your school:'),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(style: BorderStyle.solid, color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton(
                  value: locationValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      locationValue = newValue;
                    });
                  },
                  items: <String>['', 'KNUST', 'UG, Legon']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 60,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      String phoneNumber = vendorNumberController.text;
                      String productCategory = categoryValue!;
                      String productDetails = productDetailsController.text;
                      String productName = productNameController.text;
                      String vendorLocation = locationValue!;
                      String vendorName = vendorNameController.text;
                      await addAd(productName, vendorName, phoneNumber,
                          productDetails, productCategory, vendorLocation);
                      pushReplacementRoute(homeScreenRoute);
                    } catch (e) {
                      await showErrorDialog(context, e.toString());
                    }
                  },
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Done",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
