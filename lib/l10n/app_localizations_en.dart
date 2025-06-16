// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get name => 'Name';

  @override
  String get first_name => 'First Name';

  @override
  String get last_name => 'Last Name';

  @override
  String get email => 'Email';

  @override
  String get phone_number => 'Phone';

  @override
  String get password => 'password';

  @override
  String get confirm_password => 'confirm password';

  @override
  String canNotEmpty(String parameter) {
    return '$parameter can not be empty';
  }

  @override
  String unValid(String parameter) {
    return '$parameter entered is not valid';
  }

  @override
  String notMatched(String parameter) {
    return 'the two ${parameter}s not matched';
  }

  @override
  String get isTooShort => 'password must be at least 8 chars';

  @override
  String get pass_not_valid => 'password must contains letters numbers symbols';

  @override
  String get register => 'Register';

  @override
  String create(String parameter) {
    return 'Create $parameter';
  }

  @override
  String get logIn => 'Log In';

  @override
  String get home => 'Home';

  @override
  String get requests => 'Requests';

  @override
  String get subscriptions => 'Subscriptions';

  @override
  String get chats => 'Chats';

  @override
  String get more => 'More';

  @override
  String get hasAccount => 'Already have Account?';

  @override
  String get hasNoAccount => 'Don\'t Have An Account?';

  @override
  String get account => 'account';

  @override
  String get someError => 'Something went wrong';

  @override
  String get expenses => 'Expenses';

  @override
  String get notifications => 'Notifications';

  @override
  String get profile => 'Profile';

  @override
  String get statistics => 'Statistics';

  @override
  String get balance => 'Balance';

  @override
  String get categories => 'Categories';

  @override
  String get expensePer => 'Show Expense Per';

  @override
  String get weekly => 'Weekly';

  @override
  String get yearly => 'Yearly';

  @override
  String get changePassword => 'Change Password';

  @override
  String get oldPassword => 'Old Password';

  @override
  String get newPassword => 'New Password';

  @override
  String get confirmNewPassword => 'Confirm New Password';

  @override
  String get language => 'Language';

  @override
  String get about => 'about';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get personalInfo => 'Personal Information';

  @override
  String get update => 'Update';

  @override
  String get deleteAccount => 'Delete Account';

  @override
  String get passwordRequired => 'Enter your password to confirm';

  @override
  String get changeEmail => 'Change Email';

  @override
  String get edit => 'Edit';

  @override
  String get cancel => 'cancel';

  @override
  String get save => 'Save';

  @override
  String get failure => 'Failure';

  @override
  String get success => 'Success';

  @override
  String get ok => 'Ok';

  @override
  String get referCode => 'Refer Code';

  @override
  String get continueWord => 'continue';

  @override
  String get selectWord => 'select';

  @override
  String get loginToAccount => 'Login to your account!';

  @override
  String get pleaseProvideYourInformation => 'Please, provide your information';

  @override
  String get rememberMe => 'Remember Me';

  @override
  String get signUpHere => 'Sign Up Here';

  @override
  String get signInHere => 'Sign In Here';

  @override
  String get signUp => 'Sign Up';

  @override
  String get sendOtp => 'Send OTP';

  @override
  String get areYouReadyToMakeANewAccount =>
      'Are you ready to make a new account, Let’s go';

  @override
  String get createNewAccount => 'Create new \naccount!';

  @override
  String get acceptAllThe => 'Accept All the';

  @override
  String get termsAndConditions => 'Terms & Conditions';

  @override
  String get optional => 'Optional';

  @override
  String get congrats => 'Congratulation!!!';

  @override
  String get welcome => 'welcome';

  @override
  String get alreadyHaveAnAccount => 'Already Have An Account?';

  @override
  String get writeYourOtp => 'Write your OTP \n Code';

  @override
  String get enterFourDigits => 'Enter The 4-Digit Code Sent To You At';

  @override
  String get haveNotReceivedCode => 'I Haven’t received a code';

  @override
  String get chooseOurService => 'Choose Our Service';

  @override
  String get homeService => 'Home Service';

  @override
  String get branch => 'Branch';

  @override
  String get coporateFleet => 'Corporate Fleet';

  @override
  String get bookASingleWash => 'Book A Single Wash';

  @override
  String get savingPackages => 'Saving Packages';

  @override
  String get popularPackage => 'Popular Package';

  @override
  String get allPackages => 'All Packages';

  @override
  String get userWallet => 'My Wallet';

  @override
  String get userCars => 'My Cars';

  @override
  String get locations => 'Locations';

  @override
  String get gifts => 'Gifts';

  @override
  String get contactUs => 'Contact Us';

  @override
  String get aboutUs => 'About Us';

  @override
  String get settings => 'Settings';

  @override
  String get number => 'number';

  @override
  String get platNumber => 'Plat Number';

  @override
  String get selectCarType => 'Select Car Type';

  @override
  String get confirm => 'Confirm';

  @override
  String get yourRequestSentSuccessfully => 'Your request sent successfully';

  @override
  String get addNewCar => 'Add New Car';

  @override
  String get addRequest => 'Add Request';

  @override
  String get carWashingService => 'Car Washing Service';

  @override
  String get pickTime => 'Pick Time';

  @override
  String get currentLocation => 'Current Location';

  @override
  String get extras => 'Extras';

  @override
  String get services => 'Services';

  @override
  String get requestSummary => 'Request Summary';

  @override
  String get appointment => 'Appointment';

  @override
  String get date => 'Date';

  @override
  String get time => 'Time';

  @override
  String get total => 'Total';

  @override
  String get selectLocation => 'Please, select a location';

  @override
  String get selectDate => 'Please, select a date';

  @override
  String get days => 'Days';

  @override
  String get hours => 'Hours';

  @override
  String get selectTime => 'Please, select a time';

  @override
  String my(String parameter) {
    return 'My $parameter';
  }

  @override
  String add(String parameter) {
    return 'Add $parameter';
  }

  @override
  String noContent(String parameter) {
    return 'No $parameter For Now';
  }

  @override
  String pleaseSelect(String parameter) {
    return 'Please Select $parameter';
  }

  @override
  String get content => 'Content';

  @override
  String get packages => 'Packages';

  @override
  String get perOneWash => 'Per One Wash';

  @override
  String get washes => 'Washes';

  @override
  String get special => 'Special';

  @override
  String get city => 'City';

  @override
  String get selectYouCarImage => 'Select Your Car Image';

  @override
  String get color => 'Color';

  @override
  String get carAddedSuccessfully => 'Car Added Successfully';

  @override
  String get locationAddedSuccessfully => 'Location Added Successfully';

  @override
  String get reLoad => 'Re-Load';

  @override
  String get newLocation => 'New Location';

  @override
  String get zones => 'Zones';

  @override
  String get zone => 'Zone';

  @override
  String get location => 'Location';

  @override
  String get selectedLocation => 'Selected Location:';
}
