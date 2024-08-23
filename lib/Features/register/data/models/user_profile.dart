import 'dart:io';
import 'package:flutter/material.dart';

class UserProfile {
  // Private fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController = TextEditingController();
  int _userTypeValue = 0;
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  bool _gender = false;
  int _counter = 100;
  List<String> _favouriteSocialMedia = ['facebook'];
  List<String> _selectedSkills = [];
  List<int> _tags = [];
  bool _isFacebookSelected = true;
  bool _isXSelected = false;
  bool _isInstagramSelected = false;
  File? _avatar;

  // Public getters
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get emailAddressController => _emailAddressController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get passwordConfirmationController => _passwordConfirmationController;
  int get userTypeValue => _userTypeValue;
  TextEditingController get aboutController => _aboutController;
  TextEditingController get birthdateController => _birthdateController;
  bool get gender => _gender;
  int get counter => _counter;
  List<String> get favouriteSocialMedia => _favouriteSocialMedia;
  List<String> get selectedSkills => _selectedSkills;
  List<int> get tags => _tags;
  bool get isFacebookSelected => _isFacebookSelected;
  bool get isXSelected => _isXSelected;
  bool get isInstagramSelected => _isInstagramSelected;
  File? get avatar => _avatar;

  // Public setters
  set userTypeValue(int value) {
    if (value < 1) {
      _userTypeValue = 1;
    } else if (value > 3) {
      _userTypeValue = 3;
    } else {
      _userTypeValue = value;
    }
  }

  set gender(bool value) => _gender = value;

  set counter(int value) {
    if (value < 100) {
      _counter = 100;
    } else if (value > 1000) {
      _counter = 1000;
    } else {
      _counter = value;
    }
  }

  set favouriteSocialMedia(List<String> value) => _favouriteSocialMedia = value;
  set selectedSkills(List<String> value) => _selectedSkills = value;
  set tags(List<int> value) => _tags = value;
  set isFacebookSelected(bool value) => _isFacebookSelected = value;
  set isXSelected(bool value) => _isXSelected = value;
  set isInstagramSelected(bool value) => _isInstagramSelected = value;
  set avatar(File? value) => _avatar = value;
}

