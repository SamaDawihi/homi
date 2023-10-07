import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // LoginSignupPage
  {
    'rd3y7s3g': {
      'en': 'Homi',
      'ar': 'هومي',
    },
    'sdvz3hww': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
    },
    'kuk2x6vy': {
      'en': 'Let\'s get started by filling out the form below.',
      'ar': 'لنبدأ بملء النموذج أدناه.',
    },
    'tn82g2sg': {
      'en': '* Name',
      'ar': '* اسم',
    },
    'v5nmx9mo': {
      'en': '* Email',
      'ar': '* بريد إلكتروني',
    },
    'k23j5lsk': {
      'en': '* Password',
      'ar': '* كلمة المرور',
    },
    '6t83f44z': {
      'en': 'Password must:',
      'ar': 'يجب أن تكون  كلمة المرور:',
    },
    '05f9nfea': {
      'en': '-Be 6 character or more.\n-Contain both letters and numbers.',
      'ar': '-متكونة من 6 حروف أو أكثر.\n- تحتوي على حروف وأرقام.',
    },
    'mgqcd7uj': {
      'en': '* Re-enter Password',
      'ar': '* إعادة إدخال كلمة المرور',
    },
    'z14qfm03': {
      'en': 'Get Started',
      'ar': 'البدء',
    },
    'r460rg34': {
      'en': 'Log In',
      'ar': 'تسجيل الدخول',
    },
    'oq2a3hh9': {
      'en': 'Welcome Back',
      'ar': 'مرحبًا بعودتك',
    },
    'tt4h00am': {
      'en': 'Fill out the information below in order to access your account.',
      'ar': 'قم بملء المعلومات أدناه من أجل الوصول إلى حسابك.',
    },
    'fqu7zqlx': {
      'en': '* Email',
      'ar': '* بريد إلكتروني',
    },
    'pje2u461': {
      'en': '* Password',
      'ar': '* كلمة المرور',
    },
    'tbi39cgz': {
      'en': 'Log In',
      'ar': 'تسجيل الدخول',
    },
    '7zdn48xn': {
      'en': 'Forgot Password?',
      'ar': 'هل نسيت كلمة السر؟',
    },
    '71liwcl9': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // FamilyProfile
  {
    'g30gpykm': {
      'en': 'Invite a Member',
      'ar': 'دعوة عضو',
    },
    'n7mptuv2': {
      'en': 'Invitation Status',
      'ar': 'حالة الدعوة',
    },
    '6ibsn7kw': {
      'en': 'My Family Members',
      'ar': 'أفراد أسرتي',
    },
    'uy8eb4xa': {
      'en': 'Delete Family',
      'ar': 'حذف العائلة',
    },
    'eew001d9': {
      'en': 'Leave Family',
      'ar': 'اترك العائلة',
    },
    't405vb32': {
      'en': 'Family Profile',
      'ar': 'ملف  للعائلة',
    },
    'o09fvi6t': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Calendar
  {
    '7dmf86h5': {
      'en': 'Calendar',
      'ar': 'التقويم',
    },
    'vedzj002': {
      'en': 'Get Google Events',
      'ar': '',
    },
    '2adgmlg5': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Lists
  {
    'ukdoyt69': {
      'en': 'Lists',
      'ar': 'القوائم',
    },
    'cjn0szm1': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Announcements
  {
    'pezqh1x2': {
      'en': 'Announcement',
      'ar': 'إعلان',
    },
    'yzk7wcws': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // FamiliesManagement
  {
    's3d9qvh1': {
      'en': 'Homi',
      'ar': 'هومي',
    },
    '9ukj6vmr': {
      'en':
          'Welcome to Homi! Choose whether you want to create a new family, join one of your existing families, or accept an invitation to be a member of new family.',
      'ar':
          'مرحبا بكم في هومي! اختر ما إذا كنت تريد إنشاء عائلة جديدة، أو الانضمام إلى إحدى عائلاتك الحالية، أو قبول دعوة لتصبح عضوًا في عائلة جديدة.',
    },
    'wb1iebtz': {
      'en': 'Create a family',
      'ar': 'إنشاء عائلة',
    },
    '5dfbp8ya': {
      'en': 'My Families',
      'ar': 'عائلتي',
    },
    'r2qmfx8y': {
      'en': 'List of invitations',
      'ar': 'قائمة الدعوات',
    },
    'xa30v5q4': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // InvitationsStatus
  {
    'fpijkt8v': {
      'en': 'Invitation Status',
      'ar': 'حالة الدعوة',
    },
    'fv3muwjj': {
      'en': 'Previous invitations status:',
      'ar': 'حالة الدعوات السابقة:',
    },
    'u4fngcl6': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Tasks
  {
    'jo2qphs2': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // EventDetails
  {
    'hxb3dou2': {
      'en': 'Event Details',
      'ar': 'حالة الدعوة',
    },
    'kl5bxlrg': {
      'en': 'Location:',
      'ar': '',
    },
    'n2awoucz': {
      'en': 'Created By:',
      'ar': '',
    },
    'b12rd52o': {
      'en': 'Start Date:',
      'ar': '',
    },
    '1amfqjkx': {
      'en': 'End Date:',
      'ar': '',
    },
    'c1ttzv4s': {
      'en': 'All Day?',
      'ar': '',
    },
    '0zm0p2xp': {
      'en': 'Start Time:',
      'ar': '',
    },
    's1t8wf0q': {
      'en': 'Description:',
      'ar': '',
    },
    'p2ig0zto': {
      'en': 'Notify before:',
      'ar': '',
    },
    'gdyxs1pp': {
      'en': 'Delete Event',
      'ar': 'يضيف',
    },
    'nq3wvj5i': {
      'en': 'Edit Event',
      'ar': 'يضيف',
    },
    '9o0kfql3': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // EventAdd
  {
    'jzc3hql1': {
      'en': 'Add Event',
      'ar': 'حالة الدعوة',
    },
    'tcv0ph2h': {
      'en': 'Event Title*',
      'ar': 'عنوان الحدث',
    },
    '1t1zas8h': {
      'en': 'Location',
      'ar': 'موقع',
    },
    'rkw1wryf': {
      'en': '',
      'ar': '',
    },
    '2r97dlvu': {
      'en': 'All Day Event',
      'ar': '',
    },
    '1nf8yb4f': {
      'en': 'Description here...',
      'ar': 'الوصف هنا...',
    },
    'c6dotpix': {
      'en': 'Notification Time*',
      'ar': 'مرحبا بالعالم',
    },
    'iv8wtubh': {
      'en': 'Notify Me On The Same Time Of The Event',
      'ar': '',
    },
    'zatc132l': {
      'en': 'Before...*',
      'ar': 'قبل...',
    },
    'kdmuju93': {
      'en': 'Minutes',
      'ar': 'دقائق',
    },
    'x4ywtdyk': {
      'en': 'Hours',
      'ar': 'ساعات',
    },
    'nswtyse6': {
      'en': 'Days',
      'ar': '',
    },
    'pha4nnb8': {
      'en': 'Min/hour/Day',
      'ar': 'دقيقة/ساعة',
    },
    '803ti6nc': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '6lf89f1g': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    '1osfotrw': {
      'en': 'Title is required.',
      'ar': '',
    },
    'm46xe6zv': {
      'en':
          'Title can not contain only white spaces, only numbers, or only special characters.',
      'ar': '',
    },
    'vhet5li1': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '0pxsha3o': {
      'en': 'Field is required',
      'ar': '',
    },
    'jpa6ql7w': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '1hd1oabu': {
      'en': 'Field is required',
      'ar': '',
    },
    'tcuhnno2': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ri0jttn7': {
      'en': 'Notification time is required.',
      'ar': '',
    },
    '60oxzw1i': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'xa9qerf6': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // EventEdit
  {
    'yywc6jcb': {
      'en': 'Edit Event',
      'ar': 'حالة الدعوة',
    },
    'ix5shetm': {
      'en': 'Event Title*',
      'ar': 'عنوان الحدث',
    },
    'yzk7stxn': {
      'en': 'Location',
      'ar': 'موقع',
    },
    '92ynmofy': {
      'en': 'All Day Event',
      'ar': '',
    },
    'vm4w5w5m': {
      'en': 'Description here...',
      'ar': 'الوصف هنا...',
    },
    '9yp5vtc1': {
      'en': 'Notification Time',
      'ar': 'مرحبا بالعالم',
    },
    'wtpwjh7t': {
      'en': 'Notify Me On The Same Time Of The Event',
      'ar': '',
    },
    'yg122c2d': {
      'en': 'Before...',
      'ar': 'قبل...',
    },
    'ngyvwwy9': {
      'en': 'Minutes',
      'ar': 'دقائق',
    },
    '5nk6im9w': {
      'en': 'Hours',
      'ar': 'ساعات',
    },
    'pmnqgu25': {
      'en': 'Days',
      'ar': '',
    },
    'g02kws35': {
      'en': 'Min/hour/Day',
      'ar': 'دقيقة/ساعة',
    },
    'h76zmi9i': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '0fr2vbr9': {
      'en': 'Edit',
      'ar': 'يضيف',
    },
    'w2ggis78': {
      'en': 'Title is required.',
      'ar': '',
    },
    'i7ibfc1k': {
      'en':
          'Title can not contain only white spaces, only numbers, or only special characters.',
      'ar': '',
    },
    'wtirbjwh': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'e5iv9yxy': {
      'en': 'Field is required',
      'ar': '',
    },
    'n8b2ly46': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'obxm1gpx': {
      'en': 'Field is required',
      'ar': '',
    },
    'o1ofk0ce': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    't6gp1yoz': {
      'en': 'Notification time is required.',
      'ar': '',
    },
    'lpf0htbj': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'z30xdtld': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // InviteByEmail
  {
    '48xbquf9': {
      'en': 'Invite a member',
      'ar': 'دعوة عضو',
    },
    '6ma2tj06': {
      'en': 'Enter the family member\'s email  to send an invitation',
      'ar': 'أدخل البريد الإلكتروني لفرد العائلة لإرسال دعوة',
    },
    'oo8xo3t7': {
      'en': 'Enter email',
      'ar': 'أدخل البريد الإلكتروني',
    },
    'k9in9k2q': {
      'en': 'Invite',
      'ar': 'يدعو',
    },
  },
  // MyFamilyContainer
  {
    '4t0j9wzp': {
      'en': 'Enter',
      'ar': 'يدخل',
    },
  },
  // emptyfamilies
  {
    'kkxfr7vw': {
      'en': 'seems that you don\'t have any family',
      'ar': 'يبدو أنه ليس لديك أي عائلة',
    },
    'unepzpw3': {
      'en': 'create a new family or join an existing one',
      'ar': 'إنشاء عائلة جديدة أو الانضمام إلى عائلة موجودة',
    },
  },
  // emptyinvitations
  {
    'drm1h3u0': {
      'en': 'seems that you don\'t have any invitation',
      'ar': 'يبدو أنه ليس لديك أي دعوة',
    },
    '0nvpgu2z': {
      'en':
          'if you want to join a specific family, ask its admin to invite you..',
      'ar':
          'إذا كنت ترغب في الانضمام إلى عائلة معينة، اطلب من مسؤولها أن يدعوك..',
    },
  },
  // ConfirmLogout
  {
    '65g34v9l': {
      'en': 'Confirm Logout',
      'ar': 'تأكيد الخروج',
    },
    'jtcq0s5r': {
      'en': 'Are you sure you want to logout from your account?',
      'ar': 'هل أنت متأكد أنك تريد تسجيل الخروج من حسابك؟',
    },
    'v0kxwgmn': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    '47wt1j9k': {
      'en': 'OK',
      'ar': 'نعم',
    },
  },
  // ConfirmRemoveMember
  {
    'tuarrgzc': {
      'en': 'Remove Member',
      'ar': 'إزالة العضو',
    },
    '3z7d1ao0': {
      'en': 'Are you sure you want to remove this family member?',
      'ar': 'هل أنت متأكد أنك تريد إزالة فرد العائلة هذا؟',
    },
    'iy8xgukw': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    'rllwnm0e': {
      'en': 'OK',
      'ar': 'نعم',
    },
  },
  // ConfirmAdminChange
  {
    'eldfua3s': {
      'en': 'Make Admin',
      'ar': 'جعل المشرف',
    },
    'wrtrso1u': {
      'en': 'Are you sure you want to pass admin role to this family member?',
      'ar': 'هل أنت متأكد أنك تريد تمرير دور المشرف إلى فرد العائلة هذا؟',
    },
    'hoq483dp': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    '087ou14d': {
      'en': 'OK',
      'ar': 'نعم',
    },
  },
  // InvitationStatus
  {
    '7efvyyfn': {
      'en': '5 mins ago',
      'ar': 'منذ 5 دقائق',
    },
    'wlgsxsq7': {
      'en': 'Head of Design',
      'ar': 'رئيس قسم التصميم',
    },
  },
  // SideMenu
  {
    'vsswi4f5': {
      'en': 'Homi',
      'ar': 'هومي',
    },
    'pon754uj': {
      'en': 'Search',
      'ar': 'يبحث',
    },
    'gm9au358': {
      'en': 'Home',
      'ar': 'بيت',
    },
    'ggt2kn8t': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
    },
    'cospxlxu': {
      'en': 'Log out',
      'ar': 'تسجيل خروج',
    },
  },
  // ResetPassword
  {
    'nfyx73db': {
      'en': 'Reset Password',
      'ar': 'إعادة تعيين كلمة المرور',
    },
    'p3vg5lpv': {
      'en': 'Enter your email to reset your password',
      'ar': 'أدخل بريدك الإلكتروني لإعادة تعيين كلمة المرور الخاصة بك',
    },
    'ihsg1d8k': {
      'en': 'Enter email',
      'ar': 'أدخل البريد الإلكتروني',
    },
    'wfanplzm': {
      'en': 'Reset',
      'ar': 'إعادة ضبط',
    },
  },
  // FamilyName
  {
    'jss0gdih': {
      'en': 'Write your family name...',
      'ar': 'أكتب اسم عائلتك...',
    },
    'ea94emzo': {
      'en': 'Label here...',
      'ar': 'التسمية هنا...',
    },
    'o8jz3tqm': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    'oljsbdla': {
      'en': 'Create',
      'ar': 'يخلق',
    },
  },
  // InviteSentSuccessfully
  {
    'fom5m2cu': {
      'en': 'Invitation Sent Successfully',
      'ar': 'تم إرسال الدعوة بنجاح',
    },
    'lyx6ksss': {
      'en': 'The member you have tried to invite will receive your invitation',
      'ar': 'العضو الذي حاولت دعوته سوف يتلقى دعوتك',
    },
    'qxfoiz9f': {
      'en': 'OK',
      'ar': 'نعم',
    },
  },
  // MemberAlreadyInvited
  {
    '1t8mr983': {
      'en': 'Member already invited.',
      'ar': 'تمت دعوة العضو بالفعل.',
    },
    '6c70sjay': {
      'en':
          'The member you have tried to invite already has an invitation from you to join this family.',
      'ar':
          'العضو الذي حاولت دعوته لديه بالفعل دعوة منك للانضمام إلى هذه العائلة.',
    },
    'mqc9tav5': {
      'en': 'OK',
      'ar': 'نعم',
    },
  },
  // EmailNotSupported
  {
    '8parkzpd': {
      'en': 'Email Address is not valid',
      'ar': 'عنوان البريد الإلكتروني غير صالح',
    },
    'xpp7gczg': {
      'en':
          'The entered email address is not in a valid format. Please correct it and try again.',
      'ar':
          'عنوان البريد الإلكتروني الذي تم إدخاله ليس بتنسيق صالح. يرجى تصحيحه والمحاولة مرة أخرى.',
    },
    'd3n87pgf': {
      'en': 'Back',
      'ar': 'خلف',
    },
  },
  // ForgetPasswordEmailSent
  {
    'q2envq8n': {
      'en': 'Reset Email Sent Successfully!',
      'ar': 'إعادة تعيين البريد الإلكتروني المرسل بنجاح!',
    },
    'f3s29q9a': {
      'en': 'Please check your email to reset your password.',
      'ar':
          'يرجى التحقق من بريدك الإلكتروني لإعادة تعيين كلمة المرور الخاصة بك.',
    },
    'htdpx3ka': {
      'en': 'Ok',
      'ar': 'نعم',
    },
  },
  // EnterFamilyName
  {
    '7wt8nq94': {
      'en': 'Enter a Family Name',
      'ar': 'أدخل اسم العائلة',
    },
    'q689li65': {
      'en': 'Please enter a name for your family To create a new family.',
      'ar': 'الرجاء إدخال اسم لعائلتك لإنشاء عائلة جديدة.',
    },
    '0ag0ttbi': {
      'en': 'Enter the family name',
      'ar': 'أدخل اسم العائلة',
    },
    'ogbc1zm7': {
      'en': 'Create Family',
      'ar': 'إنشاء عائلة',
    },
  },
  // ConfirmRejectInvitation
  {
    '5o5x6s63': {
      'en': 'Confirm Rejection',
      'ar': 'تأكيد الرفض',
    },
    'ospbmsnf': {
      'en': 'Are you sure you want to reject the invitation?',
      'ar': 'هل أنت متأكد أنك تريد رفض الدعوة؟',
    },
    'no2ejqzl': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    '9w0k1a1w': {
      'en': 'Reject',
      'ar': 'يرفض',
    },
  },
  // MemberAlreadyMember
  {
    'wrfqpvmo': {
      'en': 'Member is already in the Family',
      'ar': 'العضو موجود بالفعل في العائلة',
    },
    '0ta5tdxp': {
      'en':
          'The member you have tried to invite already is a member of this family.',
      'ar': 'العضو الذي حاولت دعوته بالفعل هو عضو في هذه العائلة.',
    },
    '4y6chyn2': {
      'en': 'OK',
      'ar': 'نعم',
    },
  },
  // ColorAlreadyUsed
  {
    '9lmrn5qn': {
      'en': 'Color Is Already Used',
      'ar': 'اللون مستخدم بالفعل',
    },
    '2aljl8xz': {
      'en':
          'The color you selected is already used by another family member select another member.',
      'ar':
          'اللون الذي حددته مستخدم بالفعل من قبل فرد آخر من العائلة، حدد فردًا آخر.',
    },
    'hwytjisg': {
      'en': 'Select Color',
      'ar': 'إختر لون',
    },
  },
  // ConfirmAcceptInvitation
  {
    '2lxkijss': {
      'en': 'Confirm Acceptance',
      'ar': 'تأكيد القبول',
    },
    '1pv97tnx': {
      'en': 'Are you sure you want to accept the invitation?',
      'ar': 'هل أنت متأكد أنك تريد قبول الدعوة؟',
    },
    '4kd5va2x': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    '521dbf30': {
      'en': 'Accept',
      'ar': 'يقبل',
    },
  },
  // emptyStatus
  {
    '4qyq0zn7': {
      'en': 'seems that you haven\'t sent any invitation',
      'ar': 'يبدو أنك لم ترسل أي دعوة',
    },
    'rs82kstz': {
      'en':
          'you can invite a member to your family by clicking \"invite a member\" button in the family profile page...',
      'ar':
          'يمكنك دعوة أحد أفراد عائلتك من خلال النقر على زر \"دعوة عضو\" في صفحة الملف الشخصي للعائلة...',
    },
  },
  // ConfirmDeleteFamily
  {
    'b9i6l4nb': {
      'en': 'Delete Family',
      'ar': 'حذف العائلة',
    },
    'x5w3r1st': {
      'en':
          'Are you sure you want to delete this family? You will not be able to undo this action.',
      'ar':
          'هل أنت متأكد أنك تريد حذف هذه العائلة؟ لن تتمكن من التراجع عن هذا الإجراء.',
    },
    'j7lp4ydv': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    'fxzpg0fz': {
      'en': 'OK',
      'ar': 'نعم',
    },
  },
  // ConfirmLeaveFamily
  {
    '59vg2zq7': {
      'en': 'Leave Family',
      'ar': 'اترك العائلة',
    },
    'c42cg8ir': {
      'en': 'Are you sure you want to leave this family?',
      'ar': 'هل أنت متأكد أنك تريد مغادرة هذه العائلة؟',
    },
    'y52lftsh': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    'bp0vfn4l': {
      'en': 'OK',
      'ar': 'نعم',
    },
  },
  // AddEventForm
  {
    'qsdkhdfm': {
      'en': 'Add Event',
      'ar': 'أضف حدثًا',
    },
    'w2mpzji7': {
      'en': 'Event Title*',
      'ar': 'عنوان الحدث',
    },
    'lp0rlmo1': {
      'en': 'Location',
      'ar': 'موقع',
    },
    '6sgr7svi': {
      'en': '',
      'ar': '',
    },
    '3ukfqrvb': {
      'en': 'All Day Event',
      'ar': '',
    },
    'nwnx2xr6': {
      'en': 'Description here...',
      'ar': 'الوصف هنا...',
    },
    'xod6nrl1': {
      'en': 'Notify On Time Of Event',
      'ar': '',
    },
    'upd78bv9': {
      'en': 'Notification Time*',
      'ar': 'مرحبا بالعالم',
    },
    'xhvahadc': {
      'en': 'Before...',
      'ar': 'قبل...',
    },
    'd9g8wnj1': {
      'en': 'Minutes',
      'ar': 'دقائق',
    },
    '5fnl4ev5': {
      'en': 'Hours',
      'ar': 'ساعات',
    },
    'lbzqiy3m': {
      'en': 'Days',
      'ar': '',
    },
    '3gcddrri': {
      'en': 'Min/hour/Day',
      'ar': 'دقيقة/ساعة',
    },
    'ledy91s6': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '2a6dvxxr': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    'zsconjlh': {
      'en': 'Title is required.',
      'ar': '',
    },
    'kod5xuao': {
      'en':
          'Title can not contain only white spaces, only numbers, or only special characters.',
      'ar': '',
    },
    'x41fk3mq': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '2edtsnc3': {
      'en': 'Field is required',
      'ar': '',
    },
    '87fd2lrs': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'b1k2ivs7': {
      'en': 'Field is required',
      'ar': '',
    },
    'a3qlzx4f': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'j7cezyuq': {
      'en': 'Notification time is required.',
      'ar': '',
    },
    'vm9qztyn': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // ConfirmDeleteEvent
  {
    'r23g2h16': {
      'en': 'Delete Event',
      'ar': 'حذف العائلة',
    },
    's5vahqnt': {
      'en': 'Are you sure you want to delete this event?',
      'ar':
          'هل أنت متأكد أنك تريد حذف هذه العائلة؟ لن تتمكن من التراجع عن هذا الإجراء.',
    },
    'd6yanmwu': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    'a4zu0coe': {
      'en': 'OK',
      'ar': 'نعم',
    },
  },
  // EditEventForm
  {
    'idmwi8nu': {
      'en': 'Edit Event',
      'ar': 'أضف حدثًا',
    },
    'owlpk0ts': {
      'en': 'Event Title',
      'ar': 'عنوان الحدث',
    },
    'spc15pjf': {
      'en': 'Location',
      'ar': 'موقع',
    },
    'zlmwynf8': {
      'en': 'All Day Event',
      'ar': '',
    },
    '3mz0d7t1': {
      'en': 'Description here...',
      'ar': 'الوصف هنا...',
    },
    'qn5eg1uj': {
      'en': 'Notify On Time Of Event',
      'ar': '',
    },
    'xb2gvglg': {
      'en': 'Notification Time',
      'ar': 'مرحبا بالعالم',
    },
    'vnxway6p': {
      'en': 'Before...',
      'ar': 'قبل...',
    },
    'imxn7eyw': {
      'en': 'Minutes',
      'ar': 'دقائق',
    },
    'lj7mdgz5': {
      'en': 'Hours',
      'ar': 'ساعات',
    },
    'z43owm8l': {
      'en': 'Days',
      'ar': '',
    },
    '1xs2a48b': {
      'en': 'Min/hour/day',
      'ar': 'دقيقة/ساعة',
    },
    '40mfd58u': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'lbzb0254': {
      'en': 'Edit',
      'ar': 'يضيف',
    },
    '103s2oa3': {
      'en': 'Field is required',
      'ar': '',
    },
    'awihbny8': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'al9khev3': {
      'en': 'Field is required',
      'ar': '',
    },
    'j5otfr30': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'rfrrtmjp': {
      'en': 'Field is required',
      'ar': '',
    },
    'k3113rib': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'cqd86gwg': {
      'en': 'Field is required',
      'ar': '',
    },
    '8ihz50xq': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // ConfirmAddingGoogleEvents
  {
    'xo14loky': {
      'en':
          'By adding these events to the family calendar only you can view them to share them with the rest of family member you have to share each of them individually.',
      'ar':
          'العضو الذي حاولت دعوته لديه بالفعل دعوة منك للانضمام إلى هذه العائلة.',
    },
    'ilima01z': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
  },
  // NoGoogleEventsFound
  {
    'h89salka': {
      'en': 'No Events Has Been Found',
      'ar': 'تمت دعوة العضو بالفعل.',
    },
    'fvciq7rl': {
      'en': 'Make sure that your google account has events.',
      'ar':
          'العضو الذي حاولت دعوته لديه بالفعل دعوة منك للانضمام إلى هذه العائلة.',
    },
    'n9zfpovu': {
      'en': 'OK',
      'ar': 'نعم',
    },
  },
  // DoneAddingGoogleEvents
  {
    'yyczdsla': {
      'en': 'Done Adding Google Events',
      'ar': 'تمت دعوة العضو بالفعل.',
    },
    'ebsj0unj': {
      'en': 'Events Added Only You Will Be Able To View Them.',
      'ar':
          'العضو الذي حاولت دعوته لديه بالفعل دعوة منك للانضمام إلى هذه العائلة.',
    },
    'gxzwqdq9': {
      'en': 'OK',
      'ar': 'نعم',
    },
  },
  // InviteEmailSentSuccessfully
  {
    'ip672t8f': {
      'en': 'Invitation Sent.',
      'ar': 'تم إرسال الدعوة بنجاح',
    },
    'ld4bdvij': {
      'en':
          'The member you have tried to invite does not have a Homi account. Therefore, we have sent an invitation through their email!',
      'ar': 'العضو الذي حاولت دعوته سوف يتلقى دعوتك',
    },
    'wi0woc47': {
      'en': 'OK',
      'ar': 'نعم',
    },
  },
  // ChangeAdminToLeaveFamily
  {
    'dmfuc24x': {
      'en': 'You are an admin.',
      'ar': 'تمت دعوة العضو بالفعل.',
    },
    '1hq72vq2': {
      'en':
          'Please make another member an admin to be able to leave this family.',
      'ar':
          'العضو الذي حاولت دعوته لديه بالفعل دعوة منك للانضمام إلى هذه العائلة.',
    },
    'txhaugyu': {
      'en': 'OK',
      'ar': 'نعم',
    },
  },
  // ConfirmLeaveLastMember
  {
    'o0jo7i2p': {
      'en': 'You are the last member.',
      'ar': 'حذف العائلة',
    },
    'c6cz1bx5': {
      'en':
          'If you leave, this family and all its information will be deleted. Are you sure you want to leave?',
      'ar':
          'هل أنت متأكد أنك تريد حذف هذه العائلة؟ لن تتمكن من التراجع عن هذا الإجراء.',
    },
    'wxmv2yvx': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    'xg63hva4': {
      'en': 'OK',
      'ar': 'نعم',
    },
  },
  // FamilyHasBeenDeleted
  {
    'eqfzsfcf': {
      'en': 'This Family Has Been Deleted',
      'ar': 'اللون مستخدم بالفعل',
    },
    'qclq5vmq': {
      'en': 'Contact The Family Admin For More Information',
      'ar':
          'اللون الذي حددته مستخدم بالفعل من قبل فرد آخر من العائلة، حدد فردًا آخر.',
    },
    'rmt1z625': {
      'en': 'Back To Home',
      'ar': 'إختر لون',
    },
  },
  // emptyEvents
  {
    '2fyocw01': {
      'en': 'Seems that you don\'t have any events for the selected date',
      'ar': 'يبدو أنه ليس لديك أي عائلة',
    },
    'g83mgxnn': {
      'en': 'Create a new new orimport your event from Google.',
      'ar': 'إنشاء عائلة جديدة أو الانضمام إلى عائلة موجودة',
    },
  },
  // Miscellaneous
  {
    'y9xb58yl': {
      'en': 'Please Allow',
      'ar': 'يرجى السماح',
    },
    'pe1yfoox': {
      'en': 'Please Allow',
      'ar': 'يرجى السماح',
    },
    '4jeyvjen': {
      'en': '',
      'ar': '',
    },
    'agprdvu3': {
      'en': '',
      'ar': '',
    },
    'lryfr9ms': {
      'en': '',
      'ar': '',
    },
    'yfmfjeis': {
      'en': '',
      'ar': '',
    },
    'tdfvu8w0': {
      'en': '',
      'ar': '',
    },
    '6usnvr3f': {
      'en': '',
      'ar': '',
    },
    'izl1mmdo': {
      'en': '',
      'ar': '',
    },
    'u0zkhge7': {
      'en': '',
      'ar': '',
    },
    'tcsdzf8c': {
      'en': '',
      'ar': '',
    },
    'ar8r0ren': {
      'en': '',
      'ar': '',
    },
    '8rfxacfo': {
      'en': '',
      'ar': '',
    },
    'zktd5d11': {
      'en': '',
      'ar': '',
    },
    '1eckl07o': {
      'en': '',
      'ar': '',
    },
    'bukm2hfm': {
      'en': '',
      'ar': '',
    },
    '1huzz4ij': {
      'en': '',
      'ar': '',
    },
    '5f4oqlxo': {
      'en': '',
      'ar': '',
    },
    'a9r4w988': {
      'en': '',
      'ar': '',
    },
    'atvf6cx6': {
      'en': '',
      'ar': '',
    },
    'rlbermg0': {
      'en': '',
      'ar': '',
    },
    'ep2ih4qe': {
      'en': '',
      'ar': '',
    },
    'a442m2oe': {
      'en': '',
      'ar': '',
    },
    '83uqnfzq': {
      'en': '',
      'ar': '',
    },
    'cvfrf2gf': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
