import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class Utility {
  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

  static Uint8List uint8ListFromBase64String(String data) {
    return base64Decode(data);
  }

  static Image imageFromBase64String(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.fill,
    );
  }

  static String encodeBase64(String str) {
    return base64.encode(utf8.encode(str));
  }

  static String decodeBase64(String str) {
    return utf8.decode(base64.decode(str));
  }

  static int getCurrentDateAsMiliSecond() {
    var date = DateTime.now();
    var dateInMili = date.millisecondsSinceEpoch;
    return dateInMili;
  }

  static int getDateAsMiliSecond(String dateString) {
    var dateInMili = 0;
    if (dateString != null && dateString.length > 6) {
      // print(dateString+' ==========dateString=============');
      try {
        var date = DateTime.parse(dateString);
        dateInMili = date.millisecondsSinceEpoch;
      } catch (e) {
        print('Exception dateString received ${dateString}' + e.toString());
      }
    }
    return dateInMili;
  }

  static DateTime convertStringToDate(String dateString) {
    DateTime date;
    try {
      date = DateTime.parse(dateString);
    } catch (e) {
      print('$e : Date Parse Exception');
    }
    return date;
  }

  static DateTime getDateTimeFromMiliSecond(int dateInMiliSecond) {
    var dateInDateTime =
        new DateTime.fromMillisecondsSinceEpoch(dateInMiliSecond);
    return dateInDateTime;
  }

  static String getFormatedDateFromMiliSecond(int dateInMiliSecond) {
    if (dateInMiliSecond != null) {
      var dateInDateTime =
          new DateTime.fromMillisecondsSinceEpoch(dateInMiliSecond);
      return formateDate(dateInDateTime);
    } else {
      return null;
    }
  }

  static String getFormatedDateTimeFromMiliSecond(int dateInMiliSecond) {
    if (dateInMiliSecond != null) {
      var dateInDateTime =
          new DateTime.fromMillisecondsSinceEpoch(dateInMiliSecond);
      return formateDateTime(dateInDateTime);
    } else {
      return null;
    }
  }

  static String getFormatedTimeFromMiliSecond(int dateInMiliSecond) {
    if (dateInMiliSecond != null) {
      var dateInDateTime =
          new DateTime.fromMillisecondsSinceEpoch(dateInMiliSecond);
      return formatedTime(dateInDateTime);
    } else {
      return null;
    }
  }

  static String getFormatedCurrentDate() {
    var dateInDateTime = DateTime.now();
    return formateDate(dateInDateTime);
  }

  static String getFormatedCurrentTime() {
    var dateInDateTime = DateTime.now();
    return formatedTime(dateInDateTime);
  }

  static String getFormatedCurrentDateTime() {
    var dateInDateTime = DateTime.now();
    return formateDateTime(dateInDateTime);
  }

  static String formateDate(DateTime date) {
    if (date != null) {
      final df = new DateFormat('yyyy-MM-dd');
      //final df = new DateFormat('dd-MM-yyyy hh:mm a');
      String formatedString = df.format(date);
      return formatedString;
    } else {
      return null;
    }
  }

  static String formatedTime(DateTime date) {
    if (date != null) {
      final df = new DateFormat('hh:mm a');
      String formatedString = df.format(date);
      return formatedString;
    } else {
      return null;
    }
  }

  static String formateDateTime(DateTime date) {
    if (date != null) {
      //final df = new DateFormat('yyyy-MM-dd hh:mm:ss.ms');
      final df = new DateFormat('yyyy-MM-dd hh:mm:ss');
      String formatedString = df.format(date);
      //print(formatedString);
      return formatedString;
    } else {
      return null;
    }
  }

  static boolToInt(var b) {
    if (b == 'null') return 0;
    if (b != null && b == true) return 1;
    return 0;
  }

  static intToBool(int i) {
    bool value = false;
    if (i == 1) value = true;
    return value;
  }

  //if id is null
  static String addIdInToJson(dynamic id, String idName) {
    if (id != null && id.length > 10) {
      return '"$idName" : "$id",';
    } else {
      return "";
    }
  }

  static String removeLastChar(String str) {
    if (str != null) {
      return str.substring(0, str.length - 1);
    } else {
      return null;
    }
  }

  static String trimString(String str) {
    if (str != null) {
      return str.trim();
    } else {
      return null;
    }
  }

  static bool isNull(dynamic obj) {
    return (obj == null || obj == 'null') ? true : false;
  }

  static bool isNotNull(dynamic obj) {
    return (obj != null && obj != 'null') ? true : false;
  }

  static List<String> getExceptionMessage(e) {
    print(e);
    return ['Failed'];
  }

  // resolve special syntax  in flutter input field
  static String replacInputString(String fieldValue, String fieldName) {
    if (Utility.isNotNull(fieldValue)) {
      fieldValue = fieldValue.split('\n').join('\\n');
      fieldValue = fieldValue.split('"').join('\\"');

      return '"$fieldName" : "$fieldValue",';
    } else {
      return "";
    }
  }

  //AIK 2-11-2020
  static bool stringCompareer(String strUnknown, String strKnown) {
    if (isNull(strUnknown) || isNull(strKnown)) {
      return false;
    } else {
      return strUnknown.toLowerCase().trim() == strKnown.toLowerCase().trim();
    }
  }

  static bool isHasLengthGreaterThanZero(dynamic obj) {
    return (obj != null && obj != 'null' && obj.length > 0) ? true : false;
  }

  static String formatDateTime(DateTime date) {
    if (date != null) {
      final df = new DateFormat('dd-MM-yyyy hh:mm a');
      String formattedString = df.format(date);
      return formattedString;
    } else {
      return null;
    }
  }

  static String formatDate(DateTime date) {
    if (date != null) {
      final df = new DateFormat('dd-MMM-yy');
      //final df = new DateFormat('dd-MM-yyyy hh:mm a');
      String formattedString = df.format(date);
      return formattedString;
    } else {
      return null;
    }
  }

  //check empty string
  static bool isEmptyString(var obj) {
    if (obj == null || obj == 'null' || obj.toString() == '') {
      return true;
    } else {
      return false;
    }
  }
}
