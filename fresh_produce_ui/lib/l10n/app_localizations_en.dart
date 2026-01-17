// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Fresh Produce';

  @override
  String get login => 'Login';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get rememberMe => 'Remember Me';

  @override
  String get dontHaveAccount => 'Don\'t have an account? Register';

  @override
  String get register => 'Register';

  @override
  String get fullName => 'Full Name';

  @override
  String get welcomeBack => 'Welcome Back!';

  @override
  String get createAccount => 'Create Account';

  @override
  String get activeRounds => 'Active Rounds';

  @override
  String get myOrders => 'My Orders';

  @override
  String get selectNeighborhood => 'Select Neighborhood';

  @override
  String get confirmOrder => 'Confirm Order';

  @override
  String get cancel => 'Cancel';

  @override
  String get checkout => 'Checkout';

  @override
  String get total => 'Total';

  @override
  String get delivery => 'Delivery';

  @override
  String get pickup => 'Pickup';

  @override
  String get produceRounds => 'Produce Rounds';

  @override
  String get all => 'ALL';

  @override
  String get open => 'OPEN';

  @override
  String get pricing => 'PRICING';

  @override
  String get deliveryPhase => 'DELIVERY';

  @override
  String get done => 'DONE';

  @override
  String get logout => 'Logout';

  @override
  String get noRoundsFound => 'No rounds found.';

  @override
  String get noRoundsOpen => 'No rounds open for orders yet.';

  @override
  String get noRoundsPricing => 'No rounds in pricing phase.';

  @override
  String get noRoundsDelivery => 'No rounds in delivery.';

  @override
  String get noHistoryFound => 'No history found.';

  @override
  String get roundDetails => 'Round Details';

  @override
  String get orderNo => 'Order #';

  @override
  String get roundHash => 'Round #';

  @override
  String get deadline => 'Deadline: ';

  @override
  String get priceNotice => 'Price Notice:';

  @override
  String get priceNoticeDetail =>
      'Prices are estimates and may vary by ±15% based on wholesale market final purchase.';

  @override
  String get batchClosed => 'Batch is Closed for Ordering';

  @override
  String get addItemsToStart => 'Add items to start order';

  @override
  String get reviewOrderPayDeposit => 'Review Order & Place';

  @override
  String get orderSummary => 'Order Summary';

  @override
  String get orderItems => 'Items';

  @override
  String get totalEstimated => 'Total Estimated';

  @override
  String get homeDeliveryFee => 'Home Delivery Fee';

  @override
  String get placeOrder => 'Place Order';

  @override
  String get cashOnDeliveryNotice =>
      'Cash on Delivery - Pay when you receive your order';

  @override
  String get amountDueOnDelivery => 'Amount Due on Delivery:';

  @override
  String get kg => 'kg';

  @override
  String get egp => 'EGP';

  @override
  String get ends => 'Ends:';

  @override
  String targetLabel(String amount, String unit) {
    return '$amount$unit target';
  }

  @override
  String leftLabel(String amount, String unit) {
    return '$amount$unit left';
  }

  @override
  String moreItems(int count) {
    return '+ $count more items';
  }

  @override
  String get roundStatusOpen => 'OPEN';

  @override
  String get roundStatusLocked => 'LOCKED';

  @override
  String get roundStatusFinished => 'FINISHED';

  @override
  String get roundStatusDelivering => 'DELIVERING';

  @override
  String get roundStatusDelivered => 'DELIVERED';

  @override
  String get roundStatusCompleted => 'COMPLETED';

  @override
  String get roundStatusCancelled => 'CANCELLED';

  @override
  String est(String price, String currency, String unit) {
    return 'Est. $price $currency / $unit';
  }

  @override
  String marketPrice(String price, String currency) {
    return 'Market Price: $price $currency';
  }

  @override
  String percentageFilled(int percentage) {
    return '$percentage% filled';
  }

  @override
  String get pleaseLoginToViewOrders => 'Please login to view your orders.';

  @override
  String get noOrdersYet => 'No orders yet.';

  @override
  String get placedOn => 'Placed on: ';

  @override
  String get priceChangedNotice =>
      'Price has changed. Please confirm if you want to proceed with this order.';

  @override
  String get reject => 'Reject';

  @override
  String get confirm => 'Confirm';

  @override
  String get welcomeTo => 'Welcome to';

  @override
  String get chooseNeighborhoodNotice =>
      'Choose your neighborhood to see active group-buying rounds in Cairo.';

  @override
  String get orderPlaced => 'Order Placed!';

  @override
  String get orderSuccessDetail =>
      'Your order has been placed successfully. You will be notified once the round closes and final prices are confirmed. Payment will be collected in cash on delivery.';

  @override
  String get backToHome => 'Back to Home';

  @override
  String get statusPlaced => 'Placed';

  @override
  String get statusAwaitingConfirmation => 'Awaiting Confirmation';

  @override
  String get statusConfirmed => 'Confirmed';

  @override
  String get statusRejected => 'Rejected';

  @override
  String get statusPaid => 'Paid';

  @override
  String get statusDelivered => 'Delivered';

  @override
  String get statusCancelled => 'Cancelled';

  @override
  String error(String message) {
    return 'Error: $message';
  }
}
