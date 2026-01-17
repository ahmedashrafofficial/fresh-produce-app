// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get adminPanel => 'لوحة الإدارة';

  @override
  String get products => 'المنتجات';

  @override
  String get rounds => 'الجولات';

  @override
  String get orders => 'الطلبات';

  @override
  String get inventory => 'المخزون';

  @override
  String get min => 'الأدنى:';

  @override
  String get addProduct => 'إضافة منتج';

  @override
  String get editProduct => 'تعديل منتج';

  @override
  String get name => 'الاسم';

  @override
  String get unit => 'الوحدة';

  @override
  String get minInventoryAmount => 'الحد الأدنى للمخزون';

  @override
  String get cancel => 'إلغاء';

  @override
  String get save => 'حفظ';

  @override
  String get adminLogin => 'دخول المسئول';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get rememberMe => 'تذكرني';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get ordersView => 'عرض الطلبات';

  @override
  String get orderId => 'رقم الطلب';

  @override
  String get user => 'المستخدم';

  @override
  String get totalEst => 'الإجمالي (تقديري)';

  @override
  String get status => 'الحالة';

  @override
  String get actions => 'الإجراءات';

  @override
  String get cancelOrder => 'إلغاء الطلب';

  @override
  String get cancelOrderConfirm => 'إلغاء الطلب؟';

  @override
  String get cancelOrderNotice =>
      'سيؤدي هذا إلى إزالة الطلب وتعديل كوتا الجولة.';

  @override
  String get no => 'لا';

  @override
  String get yesCancel => 'نعم، إلغاء';

  @override
  String get roundsManagement => 'إدارة الجولات';

  @override
  String get noRoundsFound => 'لم يتم العثور على جولات في هذه الفئة.';

  @override
  String productsCount(int count) {
    return 'المنتجات: $count';
  }

  @override
  String get roundPrefix => 'الجولة ';

  @override
  String get selectProduct => 'اختر منتج';

  @override
  String get createRound => 'إنشاء جولة';

  @override
  String get editRound => 'تعديل جولة';

  @override
  String get neighborhood => 'المنطقة';

  @override
  String get maadi => 'المعادي';

  @override
  String get zamalek => 'الزمالك';

  @override
  String get startDate => 'تاريخ البدء';

  @override
  String get endDate => 'تاريخ الانتهاء';

  @override
  String get totalTransportCost => 'إجمالي تكلفة النقل (مشترك)';

  @override
  String get targetKg => 'الكيلوجرام المستهدف';

  @override
  String get wholesaleEgp => 'سعر الجملة (ج.م)';

  @override
  String get margin => 'الهامش';

  @override
  String get opShare => 'مصاريف تشغيل';

  @override
  String get actualWholesalePrice => 'سعر الجملة الفعلي';

  @override
  String get userFirst => 'المستخدم أولاً';

  @override
  String get market => 'السوق';

  @override
  String get wholesale => 'الجملة';

  @override
  String get transportEst => 'تقدير النقل';

  @override
  String get all => 'الكل';

  @override
  String get open => 'مفتوح';

  @override
  String get pricing => 'التسعير';

  @override
  String get delivery => 'التوصيل';

  @override
  String get done => 'تم';

  @override
  String get statusAll => 'الكل';

  @override
  String get statusPlaced => 'تم التقديم';

  @override
  String get statusAwaitingConfirmation => 'في انتظار التأكيد';

  @override
  String get statusConfirmed => 'تم التأكيد';

  @override
  String get statusRejected => 'مرفوض';

  @override
  String get statusPaid => 'تم الدفع';

  @override
  String get statusDelivered => 'تم التوصيل';

  @override
  String get statusCancelled => 'ملغي';

  @override
  String get roundStatusDraft => 'مسودة';

  @override
  String get roundStatusOpen => 'مفتوح';

  @override
  String get roundStatusLocked => 'مغلق';

  @override
  String get roundStatusFinished => 'جاهز';

  @override
  String get roundStatusDelivering => 'جاري التوصيل';

  @override
  String get roundStatusDelivered => 'تم التوصيل';

  @override
  String get roundStatusCompleted => 'مكتمل';

  @override
  String get roundStatusCancelled => 'ملغي';

  @override
  String get transport => 'النقل';

  @override
  String get egp => 'ج.م';

  @override
  String get kg => 'كجم';

  @override
  String error(String message) {
    return 'خطأ: $message';
  }

  @override
  String get round => 'الجولة';

  @override
  String get ordersManagement => 'إدارة الطلبات';

  @override
  String get noOrdersYet => 'لا توجد طلبات بعد.';

  @override
  String get order => 'الطلب';

  @override
  String get date => 'التاريخ';

  @override
  String get total => 'الإجمالي';

  @override
  String get items => 'الأصناف';
}
