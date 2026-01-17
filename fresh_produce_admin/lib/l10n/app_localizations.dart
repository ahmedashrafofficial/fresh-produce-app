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

  /// No description provided for @adminPanel.
  ///
  /// In en, this message translates to:
  /// **'Admin Panel'**
  String get adminPanel;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// No description provided for @rounds.
  ///
  /// In en, this message translates to:
  /// **'Rounds'**
  String get rounds;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// No description provided for @inventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get inventory;

  /// No description provided for @min.
  ///
  /// In en, this message translates to:
  /// **'Min:'**
  String get min;

  /// No description provided for @addProduct.
  ///
  /// In en, this message translates to:
  /// **'Add Product'**
  String get addProduct;

  /// No description provided for @editProduct.
  ///
  /// In en, this message translates to:
  /// **'Edit Product'**
  String get editProduct;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @unit.
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get unit;

  /// No description provided for @minInventoryAmount.
  ///
  /// In en, this message translates to:
  /// **'Min Inventory Amount'**
  String get minInventoryAmount;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @adminLogin.
  ///
  /// In en, this message translates to:
  /// **'Admin Login'**
  String get adminLogin;

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

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @ordersView.
  ///
  /// In en, this message translates to:
  /// **'Orders View'**
  String get ordersView;

  /// No description provided for @orderId.
  ///
  /// In en, this message translates to:
  /// **'Order ID'**
  String get orderId;

  /// No description provided for @user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user;

  /// No description provided for @totalEst.
  ///
  /// In en, this message translates to:
  /// **'Total (Est)'**
  String get totalEst;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @actions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get actions;

  /// No description provided for @cancelOrder.
  ///
  /// In en, this message translates to:
  /// **'Cancel Order'**
  String get cancelOrder;

  /// No description provided for @cancelOrderConfirm.
  ///
  /// In en, this message translates to:
  /// **'Cancel Order?'**
  String get cancelOrderConfirm;

  /// No description provided for @cancelOrderNotice.
  ///
  /// In en, this message translates to:
  /// **'This will remove the order and adjust round quotas.'**
  String get cancelOrderNotice;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @yesCancel.
  ///
  /// In en, this message translates to:
  /// **'Yes, Cancel'**
  String get yesCancel;

  /// No description provided for @roundsManagement.
  ///
  /// In en, this message translates to:
  /// **'Rounds Management'**
  String get roundsManagement;

  /// No description provided for @noRoundsFound.
  ///
  /// In en, this message translates to:
  /// **'No rounds found in this category.'**
  String get noRoundsFound;

  /// No description provided for @productsCount.
  ///
  /// In en, this message translates to:
  /// **'Products: {count}'**
  String productsCount(int count);

  /// No description provided for @roundPrefix.
  ///
  /// In en, this message translates to:
  /// **'Round '**
  String get roundPrefix;

  /// No description provided for @selectProduct.
  ///
  /// In en, this message translates to:
  /// **'Select Product'**
  String get selectProduct;

  /// No description provided for @createRound.
  ///
  /// In en, this message translates to:
  /// **'Create Round'**
  String get createRound;

  /// No description provided for @editRound.
  ///
  /// In en, this message translates to:
  /// **'Edit Round'**
  String get editRound;

  /// No description provided for @neighborhood.
  ///
  /// In en, this message translates to:
  /// **'Neighborhood'**
  String get neighborhood;

  /// No description provided for @maadi.
  ///
  /// In en, this message translates to:
  /// **'Maadi'**
  String get maadi;

  /// No description provided for @zamalek.
  ///
  /// In en, this message translates to:
  /// **'Zamalek'**
  String get zamalek;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDate;

  /// No description provided for @endDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get endDate;

  /// No description provided for @totalTransportCost.
  ///
  /// In en, this message translates to:
  /// **'Total Transport Cost (Shared)'**
  String get totalTransportCost;

  /// No description provided for @targetKg.
  ///
  /// In en, this message translates to:
  /// **'Target Kg'**
  String get targetKg;

  /// No description provided for @wholesaleEgp.
  ///
  /// In en, this message translates to:
  /// **'Wholesale EGP'**
  String get wholesaleEgp;

  /// No description provided for @margin.
  ///
  /// In en, this message translates to:
  /// **'Margin'**
  String get margin;

  /// No description provided for @opShare.
  ///
  /// In en, this message translates to:
  /// **'Op. Share'**
  String get opShare;

  /// No description provided for @actualWholesalePrice.
  ///
  /// In en, this message translates to:
  /// **'Actual Wholesale Price'**
  String get actualWholesalePrice;

  /// No description provided for @userFirst.
  ///
  /// In en, this message translates to:
  /// **'User First'**
  String get userFirst;

  /// No description provided for @market.
  ///
  /// In en, this message translates to:
  /// **'Market'**
  String get market;

  /// No description provided for @wholesale.
  ///
  /// In en, this message translates to:
  /// **'Wholesale'**
  String get wholesale;

  /// No description provided for @transportEst.
  ///
  /// In en, this message translates to:
  /// **'Transport Est'**
  String get transportEst;

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

  /// No description provided for @delivery.
  ///
  /// In en, this message translates to:
  /// **'DELIVERY'**
  String get delivery;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'DONE'**
  String get done;

  /// No description provided for @statusAll.
  ///
  /// In en, this message translates to:
  /// **'ALL'**
  String get statusAll;

  /// No description provided for @statusPlaced.
  ///
  /// In en, this message translates to:
  /// **'PLACED'**
  String get statusPlaced;

  /// No description provided for @statusAwaitingConfirmation.
  ///
  /// In en, this message translates to:
  /// **'AWAITING CONFIRMATION'**
  String get statusAwaitingConfirmation;

  /// No description provided for @statusConfirmed.
  ///
  /// In en, this message translates to:
  /// **'CONFIRMED'**
  String get statusConfirmed;

  /// No description provided for @statusRejected.
  ///
  /// In en, this message translates to:
  /// **'REJECTED'**
  String get statusRejected;

  /// No description provided for @statusPaid.
  ///
  /// In en, this message translates to:
  /// **'PAID'**
  String get statusPaid;

  /// No description provided for @statusDelivered.
  ///
  /// In en, this message translates to:
  /// **'DELIVERED'**
  String get statusDelivered;

  /// No description provided for @statusCancelled.
  ///
  /// In en, this message translates to:
  /// **'CANCELLED'**
  String get statusCancelled;

  /// No description provided for @roundStatusDraft.
  ///
  /// In en, this message translates to:
  /// **'DRAFT'**
  String get roundStatusDraft;

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

  /// No description provided for @transport.
  ///
  /// In en, this message translates to:
  /// **'Transport'**
  String get transport;

  /// No description provided for @egp.
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get egp;

  /// No description provided for @kg.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get kg;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error: {message}'**
  String error(String message);

  /// No description provided for @round.
  ///
  /// In en, this message translates to:
  /// **'Round'**
  String get round;

  /// No description provided for @ordersManagement.
  ///
  /// In en, this message translates to:
  /// **'Orders Management'**
  String get ordersManagement;

  /// No description provided for @noOrdersYet.
  ///
  /// In en, this message translates to:
  /// **'No orders yet.'**
  String get noOrdersYet;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get order;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @items.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get items;
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
