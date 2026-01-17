// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'منتجات طازجة';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get rememberMe => 'تذكرني';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟ سجل الآن';

  @override
  String get register => 'تسجيل';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get welcomeBack => 'مرحباً بعودتك!';

  @override
  String get createAccount => 'إنشاء حساب';

  @override
  String get activeRounds => 'الجولات النشطة';

  @override
  String get myOrders => 'طلباتي';

  @override
  String get selectNeighborhood => 'اختر المنطقة';

  @override
  String get confirmOrder => 'تأكيد الطلب';

  @override
  String get cancel => 'إلغاء';

  @override
  String get checkout => 'الدفع';

  @override
  String get total => 'الإجمالي';

  @override
  String get delivery => 'توصيل';

  @override
  String get pickup => 'استلام';

  @override
  String get produceRounds => 'جولات المنتجات';

  @override
  String get all => 'الكل';

  @override
  String get open => 'مفتوح';

  @override
  String get pricing => 'التسعير';

  @override
  String get deliveryPhase => 'التوصيل';

  @override
  String get done => 'تم';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get noRoundsFound => 'لم يتم العثور على جولات.';

  @override
  String get noRoundsOpen => 'لا توجد جولات مفتوحة للطلبات بعد.';

  @override
  String get noRoundsPricing => 'لا توجد جولات في مرحلة التسعير.';

  @override
  String get noRoundsDelivery => 'لا توجد جولات في مرحلة التوصيل.';

  @override
  String get noHistoryFound => 'لا يوجد سجل طلبيات.';

  @override
  String get roundDetails => 'تفاصيل الجولة';

  @override
  String get orderNo => 'Order #';

  @override
  String get roundHash => 'الجولة #';

  @override
  String get deadline => 'الموعد النهائي: ';

  @override
  String get priceNotice => 'تنبيه السعر:';

  @override
  String get priceNoticeDetail =>
      'الأسعار تقديرية وقد تختلف بنسبة ±15% بناءً على الشراء النهائي من سوق الجملة.';

  @override
  String get batchClosed => 'الدفعة مغلقة للطلبات';

  @override
  String get addItemsToStart => 'أضف منتجات لبدء الطلب';

  @override
  String get reviewOrderPayDeposit => 'مراجعة الطلب وتقديمه';

  @override
  String get orderSummary => 'ملخص الطلب';

  @override
  String get orderItems => 'المنتجات';

  @override
  String get totalEstimated => 'إجمالي تقديري';

  @override
  String get homeDeliveryFee => 'رسوم التوصيل للمنزل';

  @override
  String get placeOrder => 'تقديم الطلب';

  @override
  String get cashOnDeliveryNotice =>
      'الدفع عند الاستلام - ادفع عند استلام طلبك';

  @override
  String get amountDueOnDelivery => 'المبلغ المستحق عند التوصيل:';

  @override
  String get kg => 'كجم';

  @override
  String get egp => 'ج.م';

  @override
  String get ends => 'ينتهي:';

  @override
  String targetLabel(String amount, String unit) {
    return '$amount$unit مستهدف';
  }

  @override
  String leftLabel(String amount, String unit) {
    return '$amount$unit متبقي';
  }

  @override
  String moreItems(int count) {
    return '+ $count منتجات إضافية';
  }

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
  String est(String price, String currency, String unit) {
    return 'تقدير: $price $currency / $unit';
  }

  @override
  String marketPrice(String price, String currency) {
    return 'سعر السوق: $price $currency';
  }

  @override
  String percentageFilled(int percentage) {
    return '$percentage% مكتمل';
  }

  @override
  String get pleaseLoginToViewOrders => 'يرجى تسجيل الدخول لعرض طلباتك.';

  @override
  String get noOrdersYet => 'لا توجد طلبات بعد.';

  @override
  String get placedOn => 'تم الطلب في: ';

  @override
  String get priceChangedNotice =>
      'لقد تغير السعر. يرجى التأكيد إذا كنت ترغب في الاستمرار في هذا الطلب.';

  @override
  String get reject => 'رفض';

  @override
  String get confirm => 'تأكيد';

  @override
  String get welcomeTo => 'مرحباً بكم في';

  @override
  String get chooseNeighborhoodNotice =>
      'اختر منطقتك لمشاهدة جولات الشراء الجماعي النشطة في القاهرة.';

  @override
  String get orderPlaced => 'تم تقديم الطلب!';

  @override
  String get orderSuccessDetail =>
      'تم تقديم طلبك بنجاح. سيتم إخطارك عند إغلاق الجولة وتأكيد الأسعار النهائية. سيتم تحصيل المبلغ نقداً عند التوصيل.';

  @override
  String get backToHome => 'العودة للرئيسية';

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
  String error(String message) {
    return 'خطأ: $message';
  }
}
