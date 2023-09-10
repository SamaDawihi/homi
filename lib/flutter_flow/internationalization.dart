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
      'en': 'Name',
      'ar': 'اسم',
    },
    'v5nmx9mo': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'k23j5lsk': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'mgqcd7uj': {
      'en': 're-enter password',
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
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'pje2u461': {
      'en': 'Password',
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
    'o09fvi6t': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Calendar
  {
    '2adgmlg5': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Lists
  {
    'cjn0szm1': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Announcements
  {
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
          'welcome to homi, choose whether you want to create a new family, join your old families, or accept an invitation to be a member of new family....',
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
    'fv3muwjj': {
      'en': 'Previous invitations status',
      'ar': 'حالة الدعوات السابقة',
    },
    'b3z6yo26': {
      'en': 'Randy Rodriguez',
      'ar': 'راندي رودريجيز',
    },
    'e2s5apsw': {
      'en': 'randy@domainname.com',
      'ar': 'Randy@domainname.com',
    },
    '1bhuqosj': {
      'en': '5 mins ago',
      'ar': 'منذ 5 دقائق',
    },
    'sl8i62em': {
      'en': 'Head of Design',
      'ar': 'رئيس قسم التصميم',
    },
    'oczsijjb': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'bmlyn4pq': {
      'en': 'Randy Rodriguez',
      'ar': 'راندي رودريجيز',
    },
    'lcx6ulki': {
      'en': 'randy@domainname.com',
      'ar': 'Randy@domainname.com',
    },
    'yx815nyk': {
      'en': '5 mins ago',
      'ar': 'منذ 5 دقائق',
    },
    'v8n9vl27': {
      'en': 'Head of Design',
      'ar': 'رئيس قسم التصميم',
    },
    'o4ze7fw5': {
      'en': 'Rejected',
      'ar': 'مرفوض',
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
    'fgegeusg': {
      'en': 'Invite Sent Successfully!',
      'ar': 'جعل المشرف',
    },
    'fs3r0n9v': {
      'en': 'Your family invitation was successfully sent to the member.',
      'ar': 'هل أنت متأكد أنك تريد تمرير دور المشرف إلى فرد العائلة هذا؟',
    },
    'yh45peo9': {
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
