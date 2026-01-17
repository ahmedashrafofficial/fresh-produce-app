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

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Fresh Produce'**
  String get appTitle;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember Me'**
  String get rememberMe;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? Register'**
  String get dontHaveAccount;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcomeBack;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @activeRounds.
  ///
  /// In en, this message translates to:
  /// **'Active Rounds'**
  String get activeRounds;

  /// No description provided for @myOrders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get myOrders;

  /// No description provided for @selectNeighborhood.
  ///
  /// In en, this message translates to:
  /// **'Select Neighborhood'**
  String get selectNeighborhood;

  /// No description provided for @confirmOrder.
  ///
  /// In en, this message translates to:
  /// **'Confirm Order'**
  String get confirmOrder;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery;

  /// No description provided for @pickup.
  ///
  /// In en, this message translates to:
  /// **'Pickup'**
  String get pickup;

  /// No description provided for @produceRounds.
  ///
  /// In en, this message translates to:
  /// **'Produce Rounds'**
  String get produceRounds;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'ALL'**
  String get all;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'OPEN'**
  String get open;

  /// No description provided for @pricing.
  ///
  /// In en, this message translates to:
  /// **'PRICING'**
  String get pricing;

  /// No description provided for @deliveryPhase.
  ///
  /// In en, this message translates to:
  /// **'DELIVERY'**
  String get deliveryPhase;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'DONE'**
  String get done;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @noRoundsFound.
  ///
  /// In en, this message translates to:
  /// **'No rounds found.'**
  String get noRoundsFound;

  /// No description provided for @noRoundsOpen.
  ///
  /// In en, this message translates to:
  /// **'No rounds open for orders yet.'**
  String get noRoundsOpen;

  /// No description provided for @noRoundsPricing.
  ///
  /// In en, this message translates to:
  /// **'No rounds in pricing phase.'**
  String get noRoundsPricing;

  /// No description provided for @noRoundsDelivery.
  ///
  /// In en, this message translates to:
  /// **'No rounds in delivery.'**
  String get noRoundsDelivery;

  /// No description provided for @noHistoryFound.
  ///
  /// In en, this message translates to:
  /// **'No history found.'**
  String get noHistoryFound;

  /// No description provided for @roundDetails.
  ///
  /// In en, this message translates to:
  /// **'Round Details'**
  String get roundDetails;

  /// No description provided for @orderNo.
  ///
  /// In en, this message translates to:
  /// **'Order #'**
  String get orderNo;

  /// No description provided for @roundHash.
  ///
  /// In en, this message translates to:
  /// **'Round #'**
  String get roundHash;

  /// No description provided for @deadline.
  ///
  /// In en, this message translates to:
  /// **'Deadline: '**
  String get deadline;

  /// No description provided for @priceNotice.
  ///
  /// In en, this message translates to:
  /// **'Price Notice:'**
  String get priceNotice;

  /// No description provided for @priceNoticeDetail.
  ///
  /// In en, this message translates to:
  /// **'Prices are estimates and may vary by ±15% based on wholesale market final purchase.'**
  String get priceNoticeDetail;

  /// No description provided for @batchClosed.
  ///
  /// In en, this message translates to:
  /// **'Batch is Closed for Ordering'**
  String get batchClosed;

  /// No description provided for @addItemsToStart.
  ///
  /// In en, this message translates to:
  /// **'Add items to start order'**
  String get addItemsToStart;

  /// No description provided for @reviewOrderPayDeposit.
  ///
  /// In en, this message translates to:
  /// **'Review Order & Place'**
  String get reviewOrderPayDeposit;

  /// No description provided for @orderSummary.
  ///
  /// In en, this message translates to:
  /// **'Order Summary'**
  String get orderSummary;

  /// No description provided for @orderItems.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get orderItems;

  /// No description provided for @totalEstimated.
  ///
  /// In en, this message translates to:
  /// **'Total Estimated'**
  String get totalEstimated;

  /// No description provided for @homeDeliveryFee.
  ///
  /// In en, this message translates to:
  /// **'Home Delivery Fee'**
  String get homeDeliveryFee;

  /// No description provided for @placeOrder.
  ///
  /// In en, this message translates to:
  /// **'Place Order'**
  String get placeOrder;

  /// No description provided for @cashOnDeliveryNotice.
  ///
  /// In en, this message translates to:
  /// **'Cash on Delivery - Pay when you receive your order'**
  String get cashOnDeliveryNotice;

  /// No description provided for @amountDueOnDelivery.
  ///
  /// In en, this message translates to:
  /// **'Amount Due on Delivery:'**
  String get amountDueOnDelivery;

  /// No description provided for @kg.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get kg;

  /// No description provided for @egp.
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get egp;

  /// No description provided for @ends.
  ///
  /// In en, this message translates to:
  /// **'Ends:'**
  String get ends;

  /// No description provided for @targetLabel.
  ///
  /// In en, this message translates to:
  /// **'{amount}{unit} target'**
  String targetLabel(String amount, String unit);

  /// No description provided for @leftLabel.
  ///
  /// In en, this message translates to:
  /// **'{amount}{unit} left'**
  String leftLabel(String amount, String unit);

  /// No description provided for @moreItems.
  ///
  /// In en, this message translates to:
  /// **'+ {count} more items'**
  String moreItems(int count);

  /// No description provided for @roundStatusOpen.
  ///
  /// In en, this message translates to:
  /// **'OPEN'**
  String get roundStatusOpen;

  /// No description provided for @roundStatusLocked.
  ///
  /// In en, this message translates to:
  /// **'LOCKED'**
  String get roundStatusLocked;

  /// No description provided for @roundStatusFinished.
  ///
  /// In en, this message translates to:
  /// **'FINISHED'**
  String get roundStatusFinished;

  /// No description provided for @roundStatusDelivering.
  ///
  /// In en, this message translates to:
  /// **'DELIVERING'**
  String get roundStatusDelivering;

  /// No description provided for @roundStatusDelivered.
  ///
  /// In en, this message translates to:
  /// **'DELIVERED'**
  String get roundStatusDelivered;

  /// No description provided for @roundStatusCompleted.
  ///
  /// In en, this message translates to:
  /// **'COMPLETED'**
  String get roundStatusCompleted;

  /// No description provided for @roundStatusCancelled.
  ///
  /// In en, this message translates to:
  /// **'CANCELLED'**
  String get roundStatusCancelled;

  /// No description provided for @est.
  ///
  /// In en, this message translates to:
  /// **'Est. {price} {currency} / {unit}'**
  String est(String price, String currency, String unit);

  /// No description provided for @marketPrice.
  ///
  /// In en, this message translates to:
  /// **'Market Price: {price} {currency}'**
  String marketPrice(String price, String currency);

  /// No description provided for @percentageFilled.
  ///
  /// In en, this message translates to:
  /// **'{percentage}% filled'**
  String percentageFilled(int percentage);

  /// No description provided for @pleaseLoginToViewOrders.
  ///
  /// In en, this message translates to:
  /// **'Please login to view your orders.'**
  String get pleaseLoginToViewOrders;

  /// No description provided for @noOrdersYet.
  ///
  /// In en, this message translates to:
  /// **'No orders yet.'**
  String get noOrdersYet;

  /// No description provided for @placedOn.
  ///
  /// In en, this message translates to:
  /// **'Placed on: '**
  String get placedOn;

  /// No description provided for @priceChangedNotice.
  ///
  /// In en, this message translates to:
  /// **'Price has changed. Please confirm if you want to proceed with this order.'**
  String get priceChangedNotice;

  /// No description provided for @reject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @welcomeTo.
  ///
  /// In en, this message translates to:
  /// **'Welcome to'**
  String get welcomeTo;

  /// No description provided for @chooseNeighborhoodNotice.
  ///
  /// In en, this message translates to:
  /// **'Choose your neighborhood to see active group-buying rounds in Cairo.'**
  String get chooseNeighborhoodNotice;

  /// No description provided for @orderPlaced.
  ///
  /// In en, this message translates to:
  /// **'Order Placed!'**
  String get orderPlaced;

  /// No description provided for @orderSuccessDetail.
  ///
  /// In en, this message translates to:
  /// **'Your order has been placed successfully. You will be notified once the round closes and final prices are confirmed. Payment will be collected in cash on delivery.'**
  String get orderSuccessDetail;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backToHome;

  /// No description provided for @statusPlaced.
  ///
  /// In en, this message translates to:
  /// **'Placed'**
  String get statusPlaced;

  /// No description provided for @statusAwaitingConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Awaiting Confirmation'**
  String get statusAwaitingConfirmation;

  /// No description provided for @statusConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get statusConfirmed;

  /// No description provided for @statusRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get statusRejected;

  /// No description provided for @statusPaid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get statusPaid;

  /// No description provided for @statusDelivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get statusDelivered;

  /// No description provided for @statusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get statusCancelled;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error: {message}'**
  String error(String message);
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
