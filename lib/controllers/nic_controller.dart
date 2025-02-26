import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class NICController extends GetxController {
  var nicNumber = ''.obs;
  var birthDate = ''.obs;
  var gender = ''.obs;
  var canVote = ''.obs;
  var age = 0.obs;
  var weekday = ''.obs;

  void decodeNIC(String nic) {
    if (nic.length == 10 || nic.length == 12) {
      bool isOldFormat = nic.length == 10;
      int year = isOldFormat
          ? 1900 + int.parse(nic.substring(0, 2))
          : int.parse(nic.substring(0, 4));
      int days =
          int.parse(nic.substring(isOldFormat ? 2 : 4, isOldFormat ? 5 : 7));

      String votingAbility = isOldFormat
          ? (nic[9].toUpperCase() == 'V' ? 'Yes' : 'No')
          : 'Unknown';

      String genderType = days > 500 ? 'Female' : 'Male';
      if (days > 500) days -= 500;

      DateTime dob = DateTime(year, 1, 1).add(Duration(days: days - 1));
      int calculatedAge = DateTime.now().year - dob.year;
      String weekdayName = DateFormat('EEEE').format(dob);

      birthDate.value = DateFormat('yyyy-MM-dd').format(dob);
      gender.value = genderType;
      canVote.value = votingAbility;
      age.value = calculatedAge;
      weekday.value = weekdayName;

      Get.toNamed('/result');
    } else {
      Get.snackbar('Error', 'Invalid NIC Number',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
