import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// The conventional newborn programmer greeting
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// user  name
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// user first name
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get first_name;

  /// user last name
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get last_name;

  /// user email
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// user phone number
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone_number;

  /// user email password
  ///
  /// In en, this message translates to:
  /// **'password'**
  String get password;

  /// user confirm password
  ///
  /// In en, this message translates to:
  /// **'confirm password'**
  String get confirm_password;

  /// validate that parameter not empty
  ///
  /// In en, this message translates to:
  /// **'{parameter} can not be empty'**
  String canNotEmpty(String parameter);

  /// validate that parameter is valid
  ///
  /// In en, this message translates to:
  /// **'{parameter} entered is not valid'**
  String unValid(String parameter);

  /// validate that parameter is matched another one
  ///
  /// In en, this message translates to:
  /// **'the two {parameter}s not matched'**
  String notMatched(String parameter);

  /// validate password length
  ///
  /// In en, this message translates to:
  /// **'password must be at least 8 chars'**
  String get isTooShort;

  /// validate password length
  ///
  /// In en, this message translates to:
  /// **'password must contains letters numbers symbols'**
  String get pass_not_valid;

  /// register to the app
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// create word
  ///
  /// In en, this message translates to:
  /// **'Create {parameter}'**
  String create(String parameter);

  /// log in to the app
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get logIn;

  /// home nav bar item
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// requests nav bar item
  ///
  /// In en, this message translates to:
  /// **'Requests'**
  String get requests;

  /// requests nav bar item
  ///
  /// In en, this message translates to:
  /// **'Subscriptions'**
  String get subscriptions;

  /// requests nav bar item
  ///
  /// In en, this message translates to:
  /// **'Chats'**
  String get chats;

  /// requests nav bar item
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// if use has an account he can log in
  ///
  /// In en, this message translates to:
  /// **'Already have Account?'**
  String get hasAccount;

  /// if use doesn't have an account he can create one
  ///
  /// In en, this message translates to:
  /// **'Don\'t Have An Account?'**
  String get hasNoAccount;

  /// if use doesn't have an account he can create one
  ///
  /// In en, this message translates to:
  /// **'account'**
  String get account;

  /// when some error happened
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get someError;

  /// expense app bar title
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get expenses;

  /// notifications app bar title
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// profile app bar title
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// statistics app bar title
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// user balance
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balance;

  /// categories word
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// Show Expense Per option in statistics screen option can be monthly or yearly
  ///
  /// In en, this message translates to:
  /// **'Show Expense Per'**
  String get expensePer;

  /// Weekly word
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get weekly;

  /// Yearly word
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get yearly;

  /// change password sentence
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// old password word
  ///
  /// In en, this message translates to:
  /// **'Old Password'**
  String get oldPassword;

  /// new password word
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// confirm new password word
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirmNewPassword;

  /// language word
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// about word
  ///
  /// In en, this message translates to:
  /// **'about'**
  String get about;

  /// privacy Policy word
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// Personal Information
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInfo;

  /// update word
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// delete account word
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// need user to enter his password to continue word
  ///
  /// In en, this message translates to:
  /// **'Enter your password to confirm'**
  String get passwordRequired;

  /// ask user to change his email
  ///
  /// In en, this message translates to:
  /// **'Change Email'**
  String get changeEmail;

  /// edit word
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// cancel word
  ///
  /// In en, this message translates to:
  /// **'cancel'**
  String get cancel;

  /// save word
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// failure word
  ///
  /// In en, this message translates to:
  /// **'Failure'**
  String get failure;

  /// success word
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// ok word
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// refer code word
  ///
  /// In en, this message translates to:
  /// **'Refer Code'**
  String get referCode;

  /// continue word
  ///
  /// In en, this message translates to:
  /// **'continue'**
  String get continueWord;

  /// select word
  ///
  /// In en, this message translates to:
  /// **'select'**
  String get selectWord;

  /// tell user he is login to account word
  ///
  /// In en, this message translates to:
  /// **'Login to your account!'**
  String get loginToAccount;

  /// provideInfo word
  ///
  /// In en, this message translates to:
  /// **'Please, provide your information'**
  String get pleaseProvideYourInformation;

  /// provideInfo word
  ///
  /// In en, this message translates to:
  /// **'Remember Me'**
  String get rememberMe;

  /// provideInfo word
  ///
  /// In en, this message translates to:
  /// **'Sign Up Here'**
  String get signUpHere;

  /// provideInfo word
  ///
  /// In en, this message translates to:
  /// **'Sign In Here'**
  String get signInHere;

  /// provideInfo word
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// send OTP word
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendOtp;

  /// welcome message for new users
  ///
  /// In en, this message translates to:
  /// **'Are you ready to make a new account, Let’s go'**
  String get areYouReadyToMakeANewAccount;

  /// create new account message for new users
  ///
  /// In en, this message translates to:
  /// **'Create new \naccount!'**
  String get createNewAccount;

  /// accept all the word
  ///
  /// In en, this message translates to:
  /// **'Accept All the'**
  String get acceptAllThe;

  /// terms and conditions word
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsAndConditions;

  /// optional word
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// congratulation message for new users
  ///
  /// In en, this message translates to:
  /// **'Congratulation!!!'**
  String get congrats;

  /// welcome message for new users
  ///
  /// In en, this message translates to:
  /// **'welcome'**
  String get welcome;

  /// if user has an account he can log in
  ///
  /// In en, this message translates to:
  /// **'Already Have An Account?'**
  String get alreadyHaveAnAccount;

  /// ask user to write his OTP code
  ///
  /// In en, this message translates to:
  /// **'Write your OTP \n Code'**
  String get writeYourOtp;

  /// ask user to enter the four digits code
  ///
  /// In en, this message translates to:
  /// **'Enter The 4-Digit Code Sent To You At'**
  String get enterFourDigits;

  /// message for user who didn't receive the code
  ///
  /// In en, this message translates to:
  /// **'I Haven’t received a code'**
  String get haveNotReceivedCode;

  /// message for user who didn't receive the code
  ///
  /// In en, this message translates to:
  /// **'Choose Our Service'**
  String get chooseOurService;

  /// message for user who didn't receive the code
  ///
  /// In en, this message translates to:
  /// **'Home Service'**
  String get homeService;

  /// message for user who didn't receive the code
  ///
  /// In en, this message translates to:
  /// **'Branch'**
  String get branch;

  /// message for user who didn't receive the code
  ///
  /// In en, this message translates to:
  /// **'Corporate Fleet'**
  String get coporateFleet;

  /// message for user who didn't receive the code
  ///
  /// In en, this message translates to:
  /// **'Book A Single Wash'**
  String get bookASingleWash;

  /// message for user who didn't receive the code
  ///
  /// In en, this message translates to:
  /// **'Saving Packages'**
  String get savingPackages;

  /// message for user who didn't receive the code
  ///
  /// In en, this message translates to:
  /// **'Popular Package'**
  String get popularPackage;

  /// message for user who didn't receive the code
  ///
  /// In en, this message translates to:
  /// **'All Packages'**
  String get allPackages;

  /// user wallet word
  ///
  /// In en, this message translates to:
  /// **'My Wallet'**
  String get userWallet;

  /// user cars word
  ///
  /// In en, this message translates to:
  /// **'My Cars'**
  String get userCars;

  /// locations word
  ///
  /// In en, this message translates to:
  /// **'Locations'**
  String get locations;

  /// gifts word
  ///
  /// In en, this message translates to:
  /// **'Gifts'**
  String get gifts;

  /// gifts word
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// gifts word
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// gifts word
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// gifts word
  ///
  /// In en, this message translates to:
  /// **'number'**
  String get number;

  /// gifts word
  ///
  /// In en, this message translates to:
  /// **'Plat Number'**
  String get platNumber;

  /// gifts word
  ///
  /// In en, this message translates to:
  /// **'Select Car Type'**
  String get selectCarType;

  /// gifts word
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// gifts word
  ///
  /// In en, this message translates to:
  /// **'Your request sent successfully'**
  String get yourRequestSentSuccessfully;

  /// gifts word
  ///
  /// In en, this message translates to:
  /// **'Add New Car'**
  String get addNewCar;

  /// gifts word
  ///
  /// In en, this message translates to:
  /// **'Add Request'**
  String get addRequest;

  /// gifts word
  ///
  /// In en, this message translates to:
  /// **'Car Washing Service'**
  String get carWashingService;

  /// pick time word
  ///
  /// In en, this message translates to:
  /// **'Pick Time'**
  String get pickTime;

  /// pick time word
  ///
  /// In en, this message translates to:
  /// **'Current Location'**
  String get currentLocation;

  /// pick time word
  ///
  /// In en, this message translates to:
  /// **'Extras'**
  String get extras;

  /// pick time word
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// pick time word
  ///
  /// In en, this message translates to:
  /// **'Request Summary'**
  String get requestSummary;

  /// pick time word
  ///
  /// In en, this message translates to:
  /// **'Appointment'**
  String get appointment;

  /// pick time word
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// pick time word
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// pick time word
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// pick time word
  ///
  /// In en, this message translates to:
  /// **'Please, select a location'**
  String get selectLocation;

  /// pick time word
  ///
  /// In en, this message translates to:
  /// **'Please, select a date'**
  String get selectDate;

  /// days word
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get days;

  /// days word
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get hours;

  /// pick time word
  ///
  /// In en, this message translates to:
  /// **'Please, select a time'**
  String get selectTime;

  /// validate that parameter not empty
  ///
  /// In en, this message translates to:
  /// **'My {parameter}'**
  String my(String parameter);

  /// validate that parameter not empty
  ///
  /// In en, this message translates to:
  /// **'Add {parameter}'**
  String add(String parameter);

  /// validate that parameter not empty
  ///
  /// In en, this message translates to:
  /// **'No {parameter} For Now'**
  String noContent(String parameter);

  /// validate that parameter not empty
  ///
  /// In en, this message translates to:
  /// **'Please Select {parameter}'**
  String pleaseSelect(String parameter);

  /// content word
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get content;

  /// packages word
  ///
  /// In en, this message translates to:
  /// **'Packages'**
  String get packages;

  /// per one wash
  ///
  /// In en, this message translates to:
  /// **'Per One Wash'**
  String get perOneWash;

  /// washes word
  ///
  /// In en, this message translates to:
  /// **'Washes'**
  String get washes;

  /// washes word
  ///
  /// In en, this message translates to:
  /// **'Special'**
  String get special;

  /// City word
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// City word
  ///
  /// In en, this message translates to:
  /// **'Select Your Car Image'**
  String get selectYouCarImage;

  /// City word
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color;

  /// City word
  ///
  /// In en, this message translates to:
  /// **'Car Added Successfully'**
  String get carAddedSuccessfully;

  /// City word
  ///
  /// In en, this message translates to:
  /// **'Location Added Successfully'**
  String get locationAddedSuccessfully;

  /// City word
  ///
  /// In en, this message translates to:
  /// **'Re-Load'**
  String get reLoad;

  /// City word
  ///
  /// In en, this message translates to:
  /// **'New Location'**
  String get newLocation;

  /// City word
  ///
  /// In en, this message translates to:
  /// **'Zones'**
  String get zones;

  /// City word
  ///
  /// In en, this message translates to:
  /// **'Zone'**
  String get zone;

  /// City word
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// Selected location word
  ///
  /// In en, this message translates to:
  /// **'Selected Location:'**
  String get selectedLocation;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
