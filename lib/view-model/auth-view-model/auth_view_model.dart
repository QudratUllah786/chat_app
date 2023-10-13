import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:country_picker/country_picker.dart';
import 'package:whatsappofficialclone/repository/auth/auth_repository.dart';

import '../../resources/color/color.dart';
class AuthViewModel extends GetxController{
  var phoneCode = ''.obs;

  void pickCountry(BuildContext context){
    showCountryPicker(
      countryListTheme: const CountryListThemeData(
        backgroundColor: AppColor.blackColor,
        textStyle: TextStyle(
          color: AppColor.white,

        ),
        inputDecoration: InputDecoration(
          prefixIcon: Icon(Icons.search,color: AppColor.greyColor,),
            hintText: 'Search',
            hintStyle: TextStyle(
              color: AppColor.greyColor,
            ),
            enabledBorder:  OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.greyColor,
              )
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.greyColor,
            )
          )
        )
      ),
        context: context,
        onSelect: (Country _country){
    phoneCode.value = _country.phoneCode;
    log('countryPicked:${_country.phoneCode.toString()}');
    });
    }
    void signInWithPhone(String phoneNum){
   // authRepository.signInWithPhone(phoneNum);
    }
    

}