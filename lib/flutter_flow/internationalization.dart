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
      'ar': 'يجب أن كلمة المرور:',
    },
    '05f9nfea': {
      'en': '-Be 6 character or more.\n-Contain both letters and numbers.',
      'ar': '-تكون من 6 شخصيات أو أكثر.\n- تحتوي على حروف وأرقام.',
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
      'ar': 'الرئيسية',
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
      'ar': 'الملف الشخصي للعائلة',
    },
    'o09fvi6t': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // Calendar
  {
    '7dmf86h5': {
      'en': 'Calendar',
      'ar': 'تقويم',
    },
    'ya9nswq3': {
      'en': 'Get Google Events',
      'ar': 'استيرات  تقويم جوجل',
    },
    '2adgmlg5': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // AllLists
  {
    'ukdoyt69': {
      'en': 'Lists',
      'ar': 'القوائم',
    },
    '4n5krc0e': {
      'en': 'Shopping Lists',
      'ar': 'قوائم التسوق',
    },
    'fory4hmy': {
      'en': 'Shopping Lists',
      'ar': 'قوائم التسوق',
    },
    'm4twvzo7': {
      'en': 'To-Do Lists',
      'ar': 'قوائم المهام',
    },
    'gm9ryqi8': {
      'en': 'To-Do Lists',
      'ar': 'قوائم المهام',
    },
    'cjn0szm1': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // Announcements
  {
    'pezqh1x2': {
      'en': 'Announcement',
      'ar': 'الإعلانات',
    },
    'yzk7wcws': {
      'en': 'Home',
      'ar': 'الرئيسية',
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
      'ar': 'عائلاتي',
    },
    'r2qmfx8y': {
      'en': 'List of invitations',
      'ar': 'قائمة الدعوات',
    },
    'xa30v5q4': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // InvitationsStatus
  {
    'fpijkt8v': {
      'en': 'Invitation Status',
      'ar': 'حالة الدعوات',
    },
    'fv3muwjj': {
      'en': 'Previous invitations status:',
      'ar': 'حالة الدعوات السابقة:',
    },
    'u4fngcl6': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // EventDetails
  {
    'hxb3dou2': {
      'en': 'Event Details',
      'ar': 'تفاصيل الحدث',
    },
    'kl5bxlrg': {
      'en': 'Location:',
      'ar': 'موقع:',
    },
    'n2awoucz': {
      'en': 'Created By:',
      'ar': 'انشأ من قبل:',
    },
    'b12rd52o': {
      'en': 'Start Date:',
      'ar': 'تاريخ البدء:',
    },
    '1amfqjkx': {
      'en': 'End Date:',
      'ar': 'تاريخ الانتهاء:',
    },
    'c1ttzv4s': {
      'en': 'All Day?',
      'ar': 'طوال اليوم؟',
    },
    '0zm0p2xp': {
      'en': 'Start Time:',
      'ar': 'وقت البدء:',
    },
    's1t8wf0q': {
      'en': 'Description:',
      'ar': 'وصف:',
    },
    'p2ig0zto': {
      'en': 'Notify before:',
      'ar': 'أبلغ قبل:',
    },
    'gdyxs1pp': {
      'en': 'Delete Event',
      'ar': 'حذف الحدث',
    },
    'nq3wvj5i': {
      'en': 'Edit Event',
      'ar': 'تحرير الحدث',
    },
    '9o0kfql3': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // EventAdd
  {
    'jzc3hql1': {
      'en': 'Add Event',
      'ar': 'أضف حدثًا',
    },
    'tcv0ph2h': {
      'en': 'Event Title*',
      'ar': 'عنوان الحدث*',
    },
    '1t1zas8h': {
      'en': 'Location',
      'ar': 'موقع',
    },
    'rkw1wryf': {
      'en': '',
      'ar': '',
    },
    'dgwagjyw': {
      'en': 'Start Date:',
      'ar': 'تاريخ البدء:',
    },
    'tbjugdlp': {
      'en': 'End Date:',
      'ar': 'تاريخ الانتهاء:',
    },
    '2r97dlvu': {
      'en': 'All Day Event',
      'ar': 'حدث طوال اليوم',
    },
    'yq08qni8': {
      'en': 'Start Time:',
      'ar': 'وقت البدء:',
    },
    '1nf8yb4f': {
      'en': 'Description here...',
      'ar': 'الوصف هنا...',
    },
    'c6dotpix': {
      'en': 'Notification Time*',
      'ar': 'وقت الإخطار*',
    },
    'iv8wtubh': {
      'en': 'Notify Me On The Same Time Of The Event',
      'ar': 'أعلمني في نفس وقت الحدث',
    },
    'zatc132l': {
      'en': 'Before...*',
      'ar': 'قبل...*',
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
      'ar': 'أيام',
    },
    'pha4nnb8': {
      'en': 'Min/hour/Day',
      'ar': 'دقيقة / ساعة / يوم',
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
      'ar': 'العنوان مطلوب.',
    },
    'm46xe6zv': {
      'en':
          'Title can not contain only white spaces, only numbers, or only special characters.',
      'ar':
          'لا يمكن أن يحتوي العنوان على مسافات بيضاء فقط، أو أرقام فقط، أو أحرف خاصة فقط.',
    },
    'vhet5li1': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '0pxsha3o': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'jpa6ql7w': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '1hd1oabu': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'tcuhnno2': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ri0jttn7': {
      'en': 'Notification time is required.',
      'ar': 'مطلوب وقت الإخطار.',
    },
    '60oxzw1i': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'xa9qerf6': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // EventEdit
  {
    'yywc6jcb': {
      'en': 'Edit Event',
      'ar': 'تحرير الحدث',
    },
    'ix5shetm': {
      'en': 'Event Title*',
      'ar': 'عنوان الحدث*',
    },
    'yzk7stxn': {
      'en': 'Location',
      'ar': 'موقع',
    },
    'aaz0tz4c': {
      'en': 'Start Date',
      'ar': 'تاريخ البدء',
    },
    '5s338iif': {
      'en': 'End Date',
      'ar': 'تاريخ الانتهاء',
    },
    '92ynmofy': {
      'en': 'All Day Event',
      'ar': 'حدث طوال اليوم',
    },
    '3g57q6s6': {
      'en': 'Start Time',
      'ar': 'وقت البدء',
    },
    'vm4w5w5m': {
      'en': 'Description here...',
      'ar': 'الوصف هنا...',
    },
    '9yp5vtc1': {
      'en': 'Notification Time',
      'ar': 'وقت الإخطار',
    },
    'wtpwjh7t': {
      'en': 'Notify Me On The Same Time Of The Event',
      'ar': 'أعلمني في نفس وقت الحدث',
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
      'ar': 'أيام',
    },
    'g02kws35': {
      'en': 'Min/hour/Day',
      'ar': 'دقيقة / ساعة / يوم',
    },
    'h76zmi9i': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '0fr2vbr9': {
      'en': 'Edit',
      'ar': 'يحرر',
    },
    'w2ggis78': {
      'en': 'Title is required.',
      'ar': 'العنوان مطلوب.',
    },
    'i7ibfc1k': {
      'en':
          'Title can not contain only white spaces, only numbers, or only special characters.',
      'ar':
          'لا يمكن أن يحتوي العنوان على مسافات بيضاء فقط، أو أرقام فقط، أو أحرف خاصة فقط.',
    },
    'wtirbjwh': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'e5iv9yxy': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'n8b2ly46': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'obxm1gpx': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'o1ofk0ce': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    't6gp1yoz': {
      'en': 'Notification time is required.',
      'ar': 'مطلوب وقت الإخطار.',
    },
    'lpf0htbj': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'z30xdtld': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // CreateList
  {
    '6ah2um8m': {
      'en': 'List Title*',
      'ar': 'عنوان القائمة*',
    },
    'xjp0brpw': {
      'en': 'Description here...',
      'ar': 'الوصف هنا...',
    },
    'zpovikzi': {
      'en': 'Who is responsible?*',
      'ar': 'من المسؤول؟*',
    },
    '77qo8vgy': {
      'en': 'Create',
      'ar': 'يخلق',
    },
    '18jily7q': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'wo9uv0fe': {
      'en': 'Only 12 Characters Allowed.',
      'ar': 'مسموح بـ 12 حرفًا فقط.',
    },
    'guh1116p': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '50yfiij4': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'mx80mf7w': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'p3420utz': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // ListView
  {
    'wv8w2fhb': {
      'en': 'Description : ',
      'ar': 'وصف :',
    },
    '1oo63y60': {
      'en': 'No description.',
      'ar': 'بدون وصف.',
    },
    '38s7atkv': {
      'en': 'Responsible Members :',
      'ar': 'الأعضاء المسؤولون :',
    },
    '10ujipip': {
      'en': 'There are no members assigned.',
      'ar': 'لا يوجد أعضاء معينون.',
    },
    'l46cpzmu': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // EditList
  {
    'ha62esrv': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'vdgsduyz': {
      'en': 'List Title*',
      'ar': 'عنوان القائمة*',
    },
    '24252ns7': {
      'en': 'Description here...',
      'ar': 'الوصف هنا...',
    },
    's6xuqhjs': {
      'en': 'Who is responsible?*',
      'ar': 'من المسؤول؟*',
    },
    'b3fimz7a': {
      'en': 'Edit',
      'ar': 'يحرر',
    },
    'zkb3z6r9': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '4smomdk0': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '5pcccvh2': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'aynr6wv5': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '4ym2ud12': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Profile
  {
    'xmfddfme': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
    },
    'epk3hl4i': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // AddAnouncement
  {
    '9v1sltzw': {
      'en': 'Send',
      'ar': 'يرسل',
    },
    'gn22egrf': {
      'en': 'What\'s on you mind ?',
      'ar': 'ماذا يدور في ذهنك ؟',
    },
    'mynvvh3r': {
      'en': 'New  Anouncement',
      'ar': 'إعلان جديد',
    },
    'be6bl8y0': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // AddDocument
  {
    '9oaj5sfa': {
      'en': 'Add Document',
      'ar': 'إضافة مستند',
    },
    'd7hp5rox': {
      'en': 'Item gallery Title',
      'ar': 'عنوان معرض العناصر',
    },
    '95dq19pa': {
      'en': 'Label here...',
      'ar': 'التسمية هنا...',
    },
    'cgdopig4': {
      'en': 'Item gallery Image',
      'ar': 'صورة معرض العناصر',
    },
    '0b1ytslj': {
      'en': 'Attached Files',
      'ar': 'الملفات المرفقة',
    },
    'jx8cs0m7': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
    },
    'xrg8q0gd': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Gallery
  {
    '69anokm1': {
      'en': 'Gallery',
      'ar': 'صالة عرض',
    },
    'q1vup2a1': {
      'en': 'Home',
      'ar': 'بيت',
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
  // ListViewMyFamily
  {
    '4t0j9wzp': {
      'en': 'Enter',
      'ar': 'يدخل',
    },
  },
  // ListViewEmptyFamilies
  {
    'kkxfr7vw': {
      'en': 'Seems that you don\'t have any family',
      'ar': 'يبدو أنه ليس لديك أي عائلة',
    },
    'unepzpw3': {
      'en': 'Create a new family or join an existing one',
      'ar': 'أنشئ عائلة جديدة أو انضم إلى عائلة موجودة',
    },
  },
  // ListViewEmptyInvitations
  {
    'drm1h3u0': {
      'en': 'Seems that you don\'t have any invitation',
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
  // ListViewInvitationStatus
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
      'ar': 'البحث',
    },
    'gm9au358': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
    'ggt2kn8t': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
    },
    'cospxlxu': {
      'en': 'Log out',
      'ar': 'تسجيل الخروج',
    },
  },
  // ResetPassword
  {
    'tic4iunl': {
      'en': 'Enter email',
      'ar': 'أدخل البريد الإلكتروني',
    },
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
  // DialogInviteSentSuccessfully
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
  // DialogMemberAlreadyInvited
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
  // DialogEmailNotSupported
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
  // DialogForgetPasswordEmailSent
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
  // InputComponentEnterFamilyName
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
  // DialogMemberInvitedAlreadyMember
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
  // DialogColorAlreadyUsed
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
      'en': 'Seems that you haven\'t sent any invitation',
      'ar': 'يبدو أنك لم ترسل أي دعوة',
    },
    'rs82kstz': {
      'en':
          'You can invite a member to your family by clicking \"invite a member\" button in the family profile page...',
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
  // ConfirmDeleteEvent
  {
    'r23g2h16': {
      'en': 'Delete Event',
      'ar': 'حذف الحدث',
    },
    's5vahqnt': {
      'en': 'Are you sure you want to delete this event?',
      'ar': 'هل أنت متأكد من حذف هذا الحدث؟',
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
  // ConfirmAddingGoogleEvents
  {
    'xo14loky': {
      'en':
          'By adding these events to the family calendar only you can view them to share them with the rest of family member you have to share each of them individually.',
      'ar':
          'من خلال إضافة هذه الأحداث إلى تقويم العائلة، يمكنك فقط مشاهدتها لمشاركتها مع بقية أفراد العائلة، ويجب عليك مشاركة كل منها على حدة.',
    },
    'ilima01z': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
  },
  // DialogNoGoogleEventsFound
  {
    'h89salka': {
      'en': 'No Events Has Been Found',
      'ar': 'لم يتم العثور على أي أحداث',
    },
    'fvciq7rl': {
      'en': 'Make sure that your google account has events.',
      'ar': 'تأكد من أن حسابك في جوجل يحتوي على أحداث.',
    },
    'n9zfpovu': {
      'en': 'OK',
      'ar': 'نعم',
    },
  },
  // DialogDoneAddingGoogleEvents
  {
    'yyczdsla': {
      'en': 'Done Adding Google Events',
      'ar': 'تم الانتهاء من إضافة أحداث جوجل',
    },
    'ebsj0unj': {
      'en': 'Events Added Only You Will Be Able To View Them.',
      'ar': 'الأحداث المضافة لن يتمكن أحد سواك من مشاهدتها.',
    },
    'gxzwqdq9': {
      'en': 'OK',
      'ar': 'نعم',
    },
  },
  // DialogInviteEmailSentSuccessfully
  {
    'ip672t8f': {
      'en': 'Invitation Sent.',
      'ar': 'دعوة التي وجهت.',
    },
    'ld4bdvij': {
      'en':
          'The member you have tried to invite does not have a Homi account. Therefore, we have sent an invitation through their email!',
      'ar':
          'العضو الذي حاولت دعوته ليس لديه حساب Homi. ولذلك أرسلنا دعوة عبر البريد الإلكتروني الخاص بهم!',
    },
    'wi0woc47': {
      'en': 'OK',
      'ar': 'نعم',
    },
  },
  // DialogChangeAdminToLeaveFamily
  {
    'dmfuc24x': {
      'en': 'You are an admin.',
      'ar': 'أنت المشرف.',
    },
    '1hq72vq2': {
      'en':
          'Please make another member an admin to be able to leave this family.',
      'ar': 'يرجى تعيين عضو آخر كمسؤول حتى يتمكن من مغادرة هذه العائلة.',
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
      'ar': 'أنت العضو الأخير.',
    },
    'c6cz1bx5': {
      'en':
          'If you leave, this family and all its information will be deleted. Are you sure you want to leave?',
      'ar':
          'إذا غادرت، سيتم حذف هذه العائلة وجميع معلوماتها. هل انت متاكد انك تريد ان تغادر؟',
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
  // DialogFamilyHasBeenDeleted
  {
    'eqfzsfcf': {
      'en': 'This Family Has Been Deleted',
      'ar': 'لقد تم حذف هذه العائلة',
    },
    'qclq5vmq': {
      'en': 'Contact The Family Admin For More Information',
      'ar': 'اتصل بمسؤول العائلة للحصول على مزيد من المعلومات',
    },
    'rmt1z625': {
      'en': 'Back To Home',
      'ar': 'العودة إلى المنزل',
    },
  },
  // ListViewEmptyEvents
  {
    '2fyocw01': {
      'en': 'Seems that you don\'t have any events for the selected date',
      'ar': 'يبدو أنه ليس لديك أي أحداث في التاريخ المحدد',
    },
    'g83mgxnn': {
      'en': 'Create a new new or import your event from Google.',
      'ar': 'قم بإنشاء حدث جديد أو قم باستيراد حدثك من Google.',
    },
  },
  // InputComponentAddTask
  {
    '4trrlsb1': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    '79u5prtl': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    'cxa6xxm4': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'cg1daqpw': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
  },
  // ConfirmDeleteList
  {
    's3oasfam': {
      'en': 'Delete List',
      'ar': 'حذف القائمة',
    },
    'gsrvx6y2': {
      'en':
          'Are you sure you want to delete this list? You will not be able to undo this action.',
      'ar':
          'هل أنت متأكد أنك تريد حذف هذه القائمة؟ لن تتمكن من التراجع عن هذا الإجراء.',
    },
    'qzomzscu': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    'c1aeqm6g': {
      'en': 'OK',
      'ar': 'نعم',
    },
  },
  // EmptyListComponent
  {
    'vmsu80yu': {
      'en': 'Seems that you don\'t have any lists',
      'ar': 'يبدو أنه ليس لديك أية قوائم',
    },
    'a1hctaw8': {
      'en': 'Create a new list to get started',
      'ar': 'أنشئ قائمة جديدة للبدء',
    },
  },
  // EmptyTaskComponent
  {
    'r1x4j5x5': {
      'en': 'Add a new task to get started',
      'ar': 'أضف مهمة جديدة للبدء',
    },
  },
  // NoMembersMessage
  {
    'ectvpj4y': {
      'en': 'There are no members assigned.',
      'ar': 'لا يوجد أعضاء معينون.',
    },
  },
  // InputComponentEditTask
  {
    '5d6os4kr': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    'nmi5qrvo': {
      'en': 'Edit',
      'ar': 'يحرر',
    },
    'zld3dmwd': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'she3rpco': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
  },
  // InputComponentEnterNewEmail
  {
    '0kuota2f': {
      'en': 'Enter The  New Email',
      'ar': 'أدخل البريد الإلكتروني الجديد',
    },
    'hypj5w34': {
      'en': 'Enter the family name',
      'ar': 'أدخل اسم العائلة',
    },
    'vo59mw0u': {
      'en': 'Update the email',
      'ar': 'قم بتحديث البريد الإلكتروني',
    },
  },
  // InputComponentEnterNewName
  {
    'b8q6jrgw': {
      'en': 'Enter The  New Name',
      'ar': 'أدخل الاسم الجديد',
    },
    'w6vmmd02': {
      'en': 'name',
      'ar': 'اسم',
    },
    'yrsqjdx2': {
      'en': 'Update the name',
      'ar': 'قم بتحديث الاسم',
    },
  },
  // AnnouncementComponent
  {
    '6f04v8rp': {
      'en': ' • ',
      'ar': '•',
    },
  },
  // ListViewDocument
  {
    '3ly8geug': {
      'en': 'Attached Files',
      'ar': 'الملفات المرفقة',
    },
  },
  // FamilyLoading
  {
    'iuoylfdk': {
      'en': 'Family Is Loading...',
      'ar': 'جاري تحميل العائلة...',
    },
    'bnwbcegp': {
      'en':
          'If the process takes an extended duration, it\'s possible that the family might have been deleted. Please reach out to the admin for further assistance and information.',
      'ar':
          'إذا استغرقت العملية مدة طويلة، فمن المحتمل أن تكون العائلة قد تم حذفها. يرجى التواصل مع المشرف للحصول على مزيد من المساعدة والمعلومات.',
    },
    'v97ywihd': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // DialogYouHaveBeenRemoved
  {
    '0fuynu28': {
      'en': 'It seems you are no longer a memebr of this family.',
      'ar': 'يبدو أنك لم تعد عضوا في هذه العائلة.',
    },
    'fpd47f1e': {
      'en':
          'Check your connection or Contact the family admin if you thing there is any mistake.',
      'ar': 'تحقق من اتصالك أو اتصل بمسؤول العائلة إذا شعرت بوجود أي خطأ.',
    },
    'f27kexoi': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // EditFamily
  {
    'r4tkskw2': {
      'en': 'New Family Name',
      'ar': 'اسم العائلة الجديد',
    },
    'd420t5a7': {
      'en': 'Enter email',
      'ar': 'أدخل البريد الإلكتروني',
    },
    '5t6boukz': {
      'en': 'Change Color',
      'ar': 'غير اللون',
    },
    'eay0t43o': {
      'en': 'Change Image',
      'ar': 'تغيير الصورة',
    },
  },
  // Miscellaneous
  {
    'cbigx2f8': {
      'en': '',
      'ar': '',
    },
    'plnbq6e1': {
      'en': '',
      'ar': '',
    },
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
