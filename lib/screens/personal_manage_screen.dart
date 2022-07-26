import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:personel_takip/widgets/custom_button.dart';
import 'package:personel_takip/widgets/custom_textfield.dart';

class PersonalManage extends StatefulWidget {
  PersonalManage({Key? key}) : super(key: key);

  @override
  State<PersonalManage> createState() => _PersonalManageState();
}

class _PersonalManageState extends State<PersonalManage> {
  final List<String> genderItems = [
    'Muraat Türk',
    'Murat',
    'Murat Türkkk',
  ];

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButtonFormField2(
            decoration: InputDecoration(
              //Add isDense true and zero Padding.
              //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              //Add more decoration as you want here
              //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
            ),
            isExpanded: true,
            hint: const Text(
              'Personel seçin.',
              style: TextStyle(fontSize: 14),
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 30,
            buttonHeight: 60,
            buttonPadding: const EdgeInsets.only(left: 20, right: 10),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            items: genderItems
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'Please select gender.';
              }
            },
            onChanged: (value) {
              //Do something when changing the item if you want.
            },
            onSaved: (value) {
              selectedValue = value.toString();
            },
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(hinttext: "ID"),
          SizedBox(
            height: 10,
          ),
          CustomTextField(hinttext: "Ad Soyad"),
          SizedBox(
            height: 10,
          ),
          CustomTextField(hinttext: "Adres"),
          SizedBox(
            height: 10,
          ),
          CustomTextField(hinttext: "Telefon"),
          SizedBox(
            height: 10,
          ),
          CustomTextField(hinttext: "Rol"),
          SizedBox(
            height: 10,
          ),
          CustomTextField(hinttext: "Maaş"),
          SizedBox(
            height: 10,
          ),
          CustomTextField(hinttext: "Günlük Yemek Ücreti"),
          SizedBox(
            height: 10,
          ),
          CustomTextField(hinttext: "Günlük Elektrik Ücreti"),
          SizedBox(
            height: 10,
          ),
          CustomTextField(hinttext: "Yol Parası"),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomElevatedButton(
                    borderRadius: 16,
                    child: Text(
                      "Kaydet",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: CustomElevatedButton(
                  borderRadius: 16,
                  child: Text(
                    "Güncelle",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.orange,
                ),
              ),
              Expanded(
                child: CustomElevatedButton(
                  borderRadius: 16,
                  child: Text(
                    "Sil",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: CustomElevatedButton(
                  borderRadius: 16,
                  child: Text(
                    "Geri Dön",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.purple,
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
