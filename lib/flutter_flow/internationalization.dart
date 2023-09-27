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
      'ar': 'اسم',
    },
    'v5nmx9mo': {
      'en': '* Email',
      'ar': 'بريد إلكتروني',
    },
    'k23j5lsk': {
      'en': '* Password',
      'ar': 'كلمة المرور',
    },
    '6t83f44z': {
      'en': 'Password must:',
      'ar': '',
    },
    '05f9nfea': {
      'en': '-Be 6 character or more.\n-Contain both letters and numbers.',
      'ar': '',
    },
    'mgqcd7uj': {
      'en': '* Re-enter Password',
      'ar': 'إعادة إدخال كلمة المرور',
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
      'ar': 'بريد إلكتروني',
    },
    'pje2u461': {
      'en': '* Password',
      'ar': 'كلمة المرور',
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
  // initPage
  {
    'l88fquol': {
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
      'ar': 'عرض الحالة',
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
      'ar': 'غادر العائلة',
    },
    't405vb32': {
      'en': 'Family Profile',
      'ar': '',
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
      'ar': '',
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
      'ar': '',
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
          'مرحبًا بك في هومي، اختر ما إذا كنت تريد إنشاء عائلة جديدة، أو الانضمام إلى عائلاتك القديمة، أو قبول دعوة لتصبح عضوًا في عائلة جديدة....',
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
      'ar': '',
    },
    'fv3muwjj': {
      'en': 'Previous invitations status:',
      'ar': 'حالة الدعوات السابقة',
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
  // AuthPage
  {
    'jhv5byc6': {
      'en': 'AuthPage',
      'ar': '',
    },
    'gj6hshgi': {
      'en': 'Home',
      'ar': '',
    },
  },
  // CalendarCopy
  {
    '35mpfj4p': {
      'en': 'Calendar',
      'ar': '',
    },
    'md3se1k7': {
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
      'ar': 'أدخل البريد الإلكتروني لعضو العائلة لإرسال دعوة',
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
      'ar': 'ينضم',
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
      'ar': 'الصفحة الرئيسية',
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
      'ar': '',
    },
    'ea94emzo': {
      'en': 'Label here...',
      'ar': '',
    },
    'o8jz3tqm': {
      'en': 'Cancel',
      'ar': '',
    },
    'oljsbdla': {
      'en': 'Create',
      'ar': '',
    },
  },
  // InviteSentSuccessfully
  {
    'fom5m2cu': {
      'en': 'Invitation Sent Successfully',
      'ar': 'جعل المشرف',
    },
    'lyx6ksss': {
      'en': 'The member you have tried to invite will receive your invitation',
      'ar': 'هل أنت متأكد أنك تريد تمرير دور المشرف إلى فرد العائلة هذا؟',
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
      'ar': 'جعل المشرف',
    },
    '6c70sjay': {
      'en':
          'The member you have tried to invite already has an invitation from you to join this family.',
      'ar': 'هل أنت متأكد أنك تريد تمرير دور المشرف إلى فرد العائلة هذا؟',
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
      'ar': 'جعل المشرف',
    },
    'xpp7gczg': {
      'en':
          'The entered email address is not in a valid format. Please correct it and try again.',
      'ar': 'هل أنت متأكد أنك تريد تمرير دور المشرف إلى فرد العائلة هذا؟',
    },
    'd3n87pgf': {
      'en': 'Back',
      'ar': 'نعم',
    },
  },
  // ForgetPasswordEmailSent
  {
    'q2envq8n': {
      'en': 'Reset Email Sent Successfully!',
      'ar': 'جعل المشرف',
    },
    'f3s29q9a': {
      'en': 'Please check your email to reset your password.',
      'ar': 'هل أنت متأكد أنك تريد تمرير دور المشرف إلى فرد العائلة هذا؟',
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
      'ar': 'دعوة عضو',
    },
    'q689li65': {
      'en': 'Please enter a name for your family To create a new family.',
      'ar': 'أدخل البريد الإلكتروني لعضو العائلة لإرسال دعوة',
    },
    '0ag0ttbi': {
      'en': 'Enter the family name',
      'ar': 'أدخل البريد الإلكتروني',
    },
    'ogbc1zm7': {
      'en': 'Create Family',
      'ar': 'يدعو',
    },
  },
  // ConfirmRejectInvitation
  {
    '5o5x6s63': {
      'en': 'Confirm Rejection',
      'ar': 'تأكيد الخروج',
    },
    'ospbmsnf': {
      'en': 'Are you sure you want to reject the invitation?',
      'ar': 'هل أنت متأكد أنك تريد تسجيل الخروج من حسابك؟',
    },
    'no2ejqzl': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    '9w0k1a1w': {
      'en': 'Reject',
      'ar': 'نعم',
    },
  },
  // MemberAlreadyMember
  {
    'wrfqpvmo': {
      'en': 'Member is already in the Family',
      'ar': 'جعل المشرف',
    },
    '0ta5tdxp': {
      'en':
          'The member you have tried to invite already is a member of this family.',
      'ar': 'هل أنت متأكد أنك تريد تمرير دور المشرف إلى فرد العائلة هذا؟',
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
      'ar': 'جعل المشرف',
    },
    '2aljl8xz': {
      'en':
          'The color you selected is already used by another family member select another member.',
      'ar': 'هل أنت متأكد أنك تريد تمرير دور المشرف إلى فرد العائلة هذا؟',
    },
    'hwytjisg': {
      'en': 'Select Color',
      'ar': 'نعم',
    },
  },
  // ConfirmAcceptInvitation
  {
    '2lxkijss': {
      'en': 'Confirm Acceptance',
      'ar': 'تأكيد الخروج',
    },
    '1pv97tnx': {
      'en': 'Are you sure you want to accept the invitation?',
      'ar': 'هل أنت متأكد أنك تريد تسجيل الخروج من حسابك؟',
    },
    '4kd5va2x': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    '521dbf30': {
      'en': 'Accept',
      'ar': 'نعم',
    },
  },
  // emptyStatus
  {
    '4qyq0zn7': {
      'en': 'seems that you haven\'t sent any invitation',
      'ar': 'يبدو أنه ليس لديك أي دعوة',
    },
    'rs82kstz': {
      'en':
          'you can invite a member to your family by clicking \"invite a member\" button in the family profile page...',
      'ar':
          'إذا كنت ترغب في الانضمام إلى عائلة معينة، اطلب من مسؤولها أن يدعوك..',
    },
  },
  // FormPopUp
  {
    '7qr5ps8n': {
      'en': 'Create Project',
      'ar': '',
    },
    '87sy9gir': {
      'en': 'Please enter the information below to add a project.',
      'ar': '',
    },
    'aku2zode': {
      'en': 'Showcase Project Name',
      'ar': '',
    },
    'vnhsknjs': {
      'en': 'Description here...',
      'ar': '',
    },
    'qzmxnlpo': {
      'en': 'URL of the project',
      'ar': '',
    },
    'h3711ctb': {
      'en': 'Clonable Link URL...',
      'ar': '',
    },
    '4xmr55ax': {
      'en': 'Create Showcase',
      'ar': '',
    },
    '4ccaurip': {
      'en': 'Field is required',
      'ar': '',
    },
    '6jslzpq9': {
      'en': 'Please enter a real name',
      'ar': '',
    },
    'nnnc2yjl': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'lvh78mib': {
      'en': 'Please enter a short desription',
      'ar': '',
    },
    '3ifxcowa': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '13hkrxaj': {
      'en': 'We have to have a URL for the project.',
      'ar': '',
    },
    '76q25y9h': {
      'en': 'Please enter a valid URL...',
      'ar': '',
    },
    'y0bjh8b1': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '9rer9l8m': {
      'en': 'Field is required',
      'ar': '',
    },
    'jfyt3yyg': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // Event
  {
    'tbbpfiop': {
      'en': 'Event Name ',
      'ar': '',
    },
  },
  // ConfirmDeleteFamily
  {
    'b9i6l4nb': {
      'en': 'Delete Family',
      'ar': 'إزالة العضو',
    },
    'x5w3r1st': {
      'en':
          'Are you sure you want to delete this family? You will not be able to undo this action.',
      'ar': 'هل أنت متأكد أنك تريد إزالة فرد العائلة هذا؟',
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
      'ar': 'إزالة العضو',
    },
    'c42cg8ir': {
      'en': 'Are you sure you want to leave this family?',
      'ar': 'هل أنت متأكد أنك تريد إزالة فرد العائلة هذا؟',
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
  // editEvent
  {
    '9mr3s5kb': {
      'en': 'Edit Event Information',
      'ar': '',
    },
    'zw3wr96m': {
      'en': '',
      'ar': '',
    },
    'ui1g3t1d': {
      'en': 'Event Title',
      'ar': '',
    },
    '3zs347lu': {
      'en': 'Location',
      'ar': '',
    },
    'e6qh90h0': {
      'en': 'Description here...',
      'ar': '',
    },
    'jjgtziup': {
      'en': 'when do you like to get notified?',
      'ar': '',
    },
    '470kl5e0': {
      'en': 'Edit',
      'ar': '',
    },
    'lxr1tmkr': {
      'en': 'Field is required',
      'ar': '',
    },
    'qibcyf4s': {
      'en': 'Please enter a real name',
      'ar': '',
    },
    'e45enh51': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '3gsxise9': {
      'en': 'Please enter a short desription',
      'ar': '',
    },
    'ucs66lhn': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '6p2hc0wj': {
      'en': 'We have to have a URL for the project.',
      'ar': '',
    },
    '9nk7r0or': {
      'en': 'Please enter a valid URL...',
      'ar': '',
    },
    'sh6u97bk': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'osy6rly5': {
      'en': 'Field is required',
      'ar': '',
    },
    'cpeda4bp': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // addevent
  {
    'qsdkhdfm': {
      'en': 'Add Event',
      'ar': '',
    },
    '8os1qv80': {
      'en': 'Please enter the information below to add an event.',
      'ar': '',
    },
    'w2mpzji7': {
      'en': 'Event Title',
      'ar': '',
    },
    'lp0rlmo1': {
      'en': 'Location',
      'ar': '',
    },
    '0dnuorpx': {
      'en': '',
      'ar': '',
    },
    'nwnx2xr6': {
      'en': 'Description here...',
      'ar': '',
    },
    'uz4kklrd': {
      'en': 'Hello World',
      'ar': '',
    },
    '41pirgda': {
      'en': 'Before...',
      'ar': '',
    },
    '2mo6z7lo': {
      'en': 'Minutes',
      'ar': '',
    },
    '8vp11js9': {
      'en': 'Hours',
      'ar': '',
    },
    'nstszi9w': {
      'en': 'Min/hour',
      'ar': '',
    },
    'k9kwgpww': {
      'en': 'Search for an item...',
      'ar': '',
    },
    '2a6dvxxr': {
      'en': 'Add',
      'ar': '',
    },
    's0rq8eu8': {
      'en': 'Field is required',
      'ar': '',
    },
    'xbgwgwvg': {
      'en': 'Please enter a real name',
      'ar': '',
    },
    '6wr0nxnk': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'jtkgxb35': {
      'en': 'Please enter a short desription',
      'ar': '',
    },
    'iuru8n28': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '50gqk02a': {
      'en': 'We have to have a URL for the project.',
      'ar': '',
    },
    'i98dbndc': {
      'en': 'Please enter a valid URL...',
      'ar': '',
    },
    'pjjmguin': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ezpjnoau': {
      'en': 'Field is required',
      'ar': '',
    },
    '8490g3qk': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
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
