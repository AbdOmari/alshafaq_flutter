// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get helloWorld => 'مرحبا';

  @override
  String get name => 'الاسم';

  @override
  String get first_name => 'الاسم الاول';

  @override
  String get last_name => 'اسم العائلة';

  @override
  String get email => 'البريد الالكتروني';

  @override
  String get phone_number => 'الهاتف';

  @override
  String get password => 'كلمة المرور';

  @override
  String get confirm_password => 'تأكيد كلمة المرور';

  @override
  String canNotEmpty(String parameter) {
    return 'لا يمكن ان يكون فارغ $parameter';
  }

  @override
  String unValid(String parameter) {
    return 'غير صحيح $parameter';
  }

  @override
  String notMatched(String parameter) {
    return 'غير متطابقة $parameter';
  }

  @override
  String get isTooShort => 'كلمه المرور يجب الا تقل عن 8 احرف';

  @override
  String get pass_not_valid =>
      'كلمة المرور يجب ان تحتوي علي ارقام و حروف و رموز';

  @override
  String get register => 'تسجيل';

  @override
  String create(String parameter) {
    return 'انشاء $parameter';
  }

  @override
  String get logIn => 'تسجيل الدخول';

  @override
  String get home => 'الرئيسية';

  @override
  String get requests => 'الطلبات';

  @override
  String get subscriptions => 'الاشتراكات';

  @override
  String get chats => 'الدردشات';

  @override
  String get more => 'المزيد';

  @override
  String get hasAccount => 'لديك حساب بالفعل؟';

  @override
  String get hasNoAccount => 'ليس لديك حساب؟';

  @override
  String get account => 'حساب';

  @override
  String get someError => 'حدث خطأ ما';

  @override
  String get expenses => 'المعاملات';

  @override
  String get notifications => 'الأشعارات';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get statistics => 'الاحصائيات';

  @override
  String get balance => 'الرصيد';

  @override
  String get categories => 'التصنيفات';

  @override
  String get expensePer => 'المصروفات حسب';

  @override
  String get weekly => 'اسبوعي';

  @override
  String get yearly => 'سنوي';

  @override
  String get changePassword => 'تغيير كلمة المرور';

  @override
  String get oldPassword => 'كلمة المرور القديمة';

  @override
  String get newPassword => 'كلمة المرور الجديدة';

  @override
  String get confirmNewPassword => 'تأكيد كلمة المرور الجديدة';

  @override
  String get language => 'اللغة';

  @override
  String get about => 'حول التطبيق';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get personalInfo => 'المعلومات الشخصية';

  @override
  String get update => 'تحديث';

  @override
  String get deleteAccount => 'حذف الحساب';

  @override
  String get passwordRequired => 'ادخل كلمة المرور الخاصة بك للتأكيد';

  @override
  String get changeEmail => 'تغيير البريد الالكتروني';

  @override
  String get edit => 'تعديل';

  @override
  String get cancel => 'إلغاء';

  @override
  String get save => 'حفظ';

  @override
  String get failure => 'فشل';

  @override
  String get success => 'نجاح';

  @override
  String get ok => 'حسنا';

  @override
  String get referCode => 'رمز الإحالة';

  @override
  String get continueWord => 'استمرار';

  @override
  String get selectWord => 'اختر';

  @override
  String get loginToAccount => 'تسجيل الدخول إلى الحساب!';

  @override
  String get pleaseProvideYourInformation => 'من فضلك قدم معلوماتك';

  @override
  String get rememberMe => 'تذكرني';

  @override
  String get signUpHere => 'سجل هنا';

  @override
  String get signInHere => 'سجل الدخول هنا';

  @override
  String get signUp => 'سجل';

  @override
  String get sendOtp => 'إرسال رمز التحقق';

  @override
  String get areYouReadyToMakeANewAccount => 'هل أنت مستعد لإنشاء حساب جديد؟';

  @override
  String get createNewAccount => 'إنشاء حساب جديد!';

  @override
  String get acceptAllThe => 'أوافق على جميع';

  @override
  String get termsAndConditions => 'الشروط والأحكام';

  @override
  String get optional => 'اختياري';

  @override
  String get congrats => 'تهانينا!!!';

  @override
  String get welcome => 'مرحبا';

  @override
  String get alreadyHaveAnAccount => 'هل لديك حساب بالفعل؟';

  @override
  String get writeYourOtp => 'اكتب رمز التحقق المرسل لك';

  @override
  String get enterFourDigits => 'ادخل الرمز الرباعي المرسل الي';

  @override
  String get haveNotReceivedCode => 'لم استلم الرمز';

  @override
  String get chooseOurService => 'اختر خدمتنا';

  @override
  String get homeService => 'خدمة منزلية';

  @override
  String get branch => 'الفروع';

  @override
  String get coporateFleet => 'أسطول الشركات';

  @override
  String get bookASingleWash => 'احجز غسيل فردي';

  @override
  String get savingPackages => 'حزم التوفير';

  @override
  String get popularPackage => 'الحزمة الشائعة';

  @override
  String get allPackages => 'جميع الحزم';

  @override
  String get userWallet => 'محفظتي';

  @override
  String get userCars => 'سياراتي';

  @override
  String get locations => 'المواقع';

  @override
  String get gifts => 'الهدايا';

  @override
  String get contactUs => 'اتصل بنا';

  @override
  String get aboutUs => 'عن التطبيق';

  @override
  String get settings => 'الإعدادات';

  @override
  String get number => 'رقم';

  @override
  String get platNumber => 'رقم اللوحة';

  @override
  String get selectCarType => 'اختر نوع السيارة';

  @override
  String get confirm => 'تأكيد';

  @override
  String get yourRequestSentSuccessfully => 'تم إرسال طلبك بنجاح';

  @override
  String get addNewCar => 'إضافة سيارة جديدة';

  @override
  String get addRequest => 'إضافة طلب جديد';

  @override
  String get carWashingService => 'خدمة غسيل السيارات';

  @override
  String get pickTime => 'اختر الوقت';

  @override
  String get currentLocation => 'الموقع الحالي';

  @override
  String get extras => 'المميزات الإضافية';

  @override
  String get services => 'الخدمات';

  @override
  String get requestSummary => 'ملخص الطلب';

  @override
  String get appointment => 'الموعد';

  @override
  String get date => 'التاريخ';

  @override
  String get time => 'الوقت';

  @override
  String get total => 'المجموع';

  @override
  String get selectLocation => 'من فضلك اختر الموقع';

  @override
  String get selectDate => 'من فضلك اختر التاريخ';

  @override
  String get days => 'أيام';

  @override
  String get hours => 'ساعات';

  @override
  String get selectTime => 'من فضلك اختر الوقت';

  @override
  String my(String parameter) {
    return 'ي$parameter';
  }

  @override
  String add(String parameter) {
    return 'إضافة $parameter';
  }

  @override
  String noContent(String parameter) {
    return 'لا يوجد $parameter الي الان';
  }

  @override
  String pleaseSelect(String parameter) {
    return 'من فضلك اختر $parameter';
  }

  @override
  String get content => 'محتوى';

  @override
  String get packages => 'حزم';

  @override
  String get perOneWash => 'لكل غسيل';

  @override
  String get washes => 'غسلات';

  @override
  String get special => 'خاص';

  @override
  String get city => 'المدينة';

  @override
  String get selectYouCarImage => 'اختر صورة سيارتك';

  @override
  String get color => 'اللون';

  @override
  String get carAddedSuccessfully => 'تم إضافة السيارة بنجاح';

  @override
  String get locationAddedSuccessfully => 'تم إضافة الموقع بنجاح';

  @override
  String get reLoad => 'إعادة تحميل';

  @override
  String get newLocation => 'موقع جديد';

  @override
  String get zones => 'المناطق';

  @override
  String get zone => 'المنطقة';

  @override
  String get location => 'الموقع';

  @override
  String get selectedLocation => 'الموقع المحدد:';
}
