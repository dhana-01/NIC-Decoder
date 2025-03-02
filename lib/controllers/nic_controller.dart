import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

/// This controller extracts birth date, age, gender, voting eligibility, and weekday from the NIC number.
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

      /// Extract year from NIC
      int year = isOldFormat
          ? 1900 + int.parse(nic.substring(0, 2))

          /// Old format
          : int.parse(nic.substring(0, 4));

      ///new format

      /// Extract day count from NIC
      int days =
          int.parse(nic.substring(isOldFormat ? 2 : 4, isOldFormat ? 5 : 7));

      /// Determine voting eligibility (only in old format NICs)
      String votingAbility = isOldFormat
          ? (nic[9].toUpperCase() == 'V' ? 'Yes' : 'No')
          : 'Unknown';

      /// Determine gender based on day count
      String genderType = days > 500 ? 'Female' : 'Male';
      if (days > 500) days -= 500;

      ///Calculate the birth date
      DateTime dob = DateTime(year, 1, 1).add(Duration(days: days - 1));
      int calculatedAge = DateTime.now().year - dob.year;
      String weekdayName = DateFormat('EEEE').format(dob);

      birthDate.value = DateFormat('yyyy-MM-dd').format(dob);
      gender.value = genderType;
      canVote.value = votingAbility;
      age.value = calculatedAge;
      weekday.value = weekdayName;

      ///Navigate to the results screen
      Get.toNamed('/result');
    } else {
      ///show an error message if the NIC number is invalid
      Get.snackbar('Error', 'Invalid NIC Number',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
