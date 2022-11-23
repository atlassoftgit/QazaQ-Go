// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `en`
  String get locale {
    return Intl.message(
      'en',
      name: 'locale',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `No Gateway is available.`
  String get wallet_gateway_empty_state {
    return Intl.message(
      'No Gateway is available.',
      name: 'wallet_gateway_empty_state',
      desc: '',
      args: [],
    );
  }

  /// `& {count} other currencies`
  String wallet_other_currencies_available(Object count) {
    return Intl.message(
      '& $count other currencies',
      name: 'wallet_other_currencies_available',
      desc: '',
      args: [count],
    );
  }

  /// `Phone number`
  String get phone_number {
    return Intl.message(
      'Phone number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get hello_welcome {
    return Intl.message(
      'Hello',
      name: 'hello_welcome',
      desc: '',
      args: [],
    );
  }

  /// `Where we're going?`
  String get where_going_welcome {
    return Intl.message(
      'Where we\'re going?',
      name: 'where_going_welcome',
      desc: '',
      args: [],
    );
  }

  /// `Destination point`
  String get where_destination_welcome {
    return Intl.message(
      'Destination point',
      name: 'where_destination_welcome',
      desc: '',
      args: [],
    );
  }

  /// `Add Favorite location`
  String get add_location_welcome {
    return Intl.message(
      'Add Favorite location',
      name: 'add_location_welcome',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get action_back {
    return Intl.message(
      'Back',
      name: 'action_back',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get action_continue {
    return Intl.message(
      'Continue',
      name: 'action_continue',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get action_canceled {
    return Intl.message(
      'Canceled',
      name: 'action_canceled',
      desc: '',
      args: [],
    );
  }

  /// `Cancel request`
  String get action_cancel_request {
    return Intl.message(
      'Cancel request',
      name: 'action_cancel_request',
      desc: '',
      args: [],
    );
  }

  /// `Set location`
  String get action_set_location {
    return Intl.message(
      'Set location',
      name: 'action_set_location',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get action_edit {
    return Intl.message(
      'Edit',
      name: 'action_edit',
      desc: '',
      args: [],
    );
  }

  /// `Name your favorite location`
  String get hint_name_fav_location {
    return Intl.message(
      'Name your favorite location',
      name: 'hint_name_fav_location',
      desc: '',
      args: [],
    );
  }

  /// `Please select the type of address`
  String get alert_select_type_address {
    return Intl.message(
      'Please select the type of address',
      name: 'alert_select_type_address',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get hint_type_address {
    return Intl.message(
      'Type',
      name: 'hint_type_address',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get payment_method {
    return Intl.message(
      'Payment Method',
      name: 'payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Add Custom Credit`
  String get add_custom_credit {
    return Intl.message(
      'Add Custom Credit',
      name: 'add_custom_credit',
      desc: '',
      args: [],
    );
  }

  /// `Tip`
  String get add_tip {
    return Intl.message(
      'Tip',
      name: 'add_tip',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get add_total {
    return Intl.message(
      'Total',
      name: 'add_total',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get title_sign_in {
    return Intl.message(
      'Sign In',
      name: 'title_sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Enter code`
  String get title_enter_code {
    return Intl.message(
      'Enter code',
      name: 'title_enter_code',
      desc: '',
      args: [],
    );
  }

  /// `No Reservations!`
  String get title_reserved_empty {
    return Intl.message(
      'No Reservations!',
      name: 'title_reserved_empty',
      desc: '',
      args: [],
    );
  }

  /// `No Records!`
  String get title_history_empty {
    return Intl.message(
      'No Records!',
      name: 'title_history_empty',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get title_location_error {
    return Intl.message(
      'Location',
      name: 'title_location_error',
      desc: '',
      args: [],
    );
  }

  /// `Ride requested`
  String get title_ride_requested {
    return Intl.message(
      'Ride requested',
      name: 'title_ride_requested',
      desc: '',
      args: [],
    );
  }

  /// `No Announcements yet!`
  String get title_no_news {
    return Intl.message(
      'No Announcements yet!',
      name: 'title_no_news',
      desc: '',
      args: [],
    );
  }

  /// `We will notify you when new announcements comes.`
  String get body_no_news {
    return Intl.message(
      'We will notify you when new announcements comes.',
      name: 'body_no_news',
      desc: '',
      args: [],
    );
  }

  /// `We are looking for nearest driver for you.`
  String get body_ride_requested {
    return Intl.message(
      'We are looking for nearest driver for you.',
      name: 'body_ride_requested',
      desc: '',
      args: [],
    );
  }

  /// `We were not able to get your current location using your device's GPS, Please check device location permission for app from device's settings. Alternatively you can use search field above to select your pickup point.`
  String get body_location_error {
    return Intl.message(
      'We were not able to get your current location using your device\'s GPS, Please check device location permission for app from device\'s settings. Alternatively you can use search field above to select your pickup point.',
      name: 'body_location_error',
      desc: '',
      args: [],
    );
  }

  /// `You will be able to see your future bookings once you make them at the main screen.`
  String get body_reservation_empty {
    return Intl.message(
      'You will be able to see your future bookings once you make them at the main screen.',
      name: 'body_reservation_empty',
      desc: '',
      args: [],
    );
  }

  /// `Code has been sent to your phone number.`
  String get body_enter_code {
    return Intl.message(
      'Code has been sent to your phone number.',
      name: 'body_enter_code',
      desc: '',
      args: [],
    );
  }

  /// `First you need to sign in to book your rider. A verification code will be sent to your phone number.`
  String get body_sign_in {
    return Intl.message(
      'First you need to sign in to book your rider. A verification code will be sent to your phone number.',
      name: 'body_sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Current Location`
  String get hint_current_location {
    return Intl.message(
      'Current Location',
      name: 'hint_current_location',
      desc: '',
      args: [],
    );
  }

  /// `Your Destination`
  String get hint_your_destination {
    return Intl.message(
      'Your Destination',
      name: 'hint_your_destination',
      desc: '',
      args: [],
    );
  }

  /// `Add Stop`
  String get hint_add_stop {
    return Intl.message(
      'Add Stop',
      name: 'hint_add_stop',
      desc: '',
      args: [],
    );
  }

  /// `Choose on map`
  String get choose_on_map {
    return Intl.message(
      'Choose on map',
      name: 'choose_on_map',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Location`
  String get action_confirm_location {
    return Intl.message(
      'Confirm Location',
      name: 'action_confirm_location',
      desc: '',
      args: [],
    );
  }

  /// `Switch`
  String get wallet_switch_currency {
    return Intl.message(
      'Switch',
      name: 'wallet_switch_currency',
      desc: '',
      args: [],
    );
  }

  /// `No history recorded.`
  String get wallet_empty_state_message {
    return Intl.message(
      'No history recorded.',
      name: 'wallet_empty_state_message',
      desc: '',
      args: [],
    );
  }

  /// `Add Credit`
  String get wallet_add_credit {
    return Intl.message(
      'Add Credit',
      name: 'wallet_add_credit',
      desc: '',
      args: [],
    );
  }

  /// `Order Fee`
  String get enum_rider_transaction_deduct_order_fee {
    return Intl.message(
      'Order Fee',
      name: 'enum_rider_transaction_deduct_order_fee',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw`
  String get enum_rider_transaction_deduct_withdraw {
    return Intl.message(
      'Withdraw',
      name: 'enum_rider_transaction_deduct_withdraw',
      desc: '',
      args: [],
    );
  }

  /// `Correction`
  String get enum_rider_transaction_deduct_correction {
    return Intl.message(
      'Correction',
      name: 'enum_rider_transaction_deduct_correction',
      desc: '',
      args: [],
    );
  }

  /// `Unkonwn`
  String get enum_unknown {
    return Intl.message(
      'Unkonwn',
      name: 'enum_unknown',
      desc: '',
      args: [],
    );
  }

  /// `In-app Payment`
  String get enum_rider_transaction_recharge_in_app_payment {
    return Intl.message(
      'In-app Payment',
      name: 'enum_rider_transaction_recharge_in_app_payment',
      desc: '',
      args: [],
    );
  }

  /// `Gift`
  String get enum_rider_transaction_recharge_gift {
    return Intl.message(
      'Gift',
      name: 'enum_rider_transaction_recharge_gift',
      desc: '',
      args: [],
    );
  }

  /// `Correction`
  String get enum_rider_transaction_recharge_correction {
    return Intl.message(
      'Correction',
      name: 'enum_rider_transaction_recharge_correction',
      desc: '',
      args: [],
    );
  }

  /// `Bank Transfer`
  String get enum_rider_transaction_recharge_bank_transfer {
    return Intl.message(
      'Bank Transfer',
      name: 'enum_rider_transaction_recharge_bank_transfer',
      desc: '',
      args: [],
    );
  }

  /// `Select currency:`
  String get wallet_select_currency {
    return Intl.message(
      'Select currency:',
      name: 'wallet_select_currency',
      desc: '',
      args: [],
    );
  }

  /// `Select Payment Method:`
  String get wallet_select_payment_method {
    return Intl.message(
      'Select Payment Method:',
      name: 'wallet_select_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Input amount to recharge`
  String get top_up_sheet_textfield_hint {
    return Intl.message(
      'Input amount to recharge',
      name: 'top_up_sheet_textfield_hint',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get top_up_sheet_pay_button {
    return Intl.message(
      'Pay',
      name: 'top_up_sheet_pay_button',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Pickup Location`
  String get point_selection_confirm_pickup {
    return Intl.message(
      'Confirm Pickup Location',
      name: 'point_selection_confirm_pickup',
      desc: '',
      args: [],
    );
  }

  /// `Book Now`
  String get service_selection_book_now {
    return Intl.message(
      'Book Now',
      name: 'service_selection_book_now',
      desc: '',
      args: [],
    );
  }

  /// `Book for {time}`
  String service_selection_book_later(Object time) {
    return Intl.message(
      'Book for $time',
      name: 'service_selection_book_later',
      desc: '',
      args: [time],
    );
  }

  /// `Cancel`
  String get action_cancel {
    return Intl.message(
      'Cancel',
      name: 'action_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Enter keywords of the location`
  String get place_search_hint {
    return Intl.message(
      'Enter keywords of the location',
      name: 'place_search_hint',
      desc: '',
      args: [],
    );
  }

  /// `Submit Review`
  String get review_action_submit_review {
    return Intl.message(
      'Submit Review',
      name: 'review_action_submit_review',
      desc: '',
      args: [],
    );
  }

  /// `Add Comment`
  String get review_textfield_hint {
    return Intl.message(
      'Add Comment',
      name: 'review_textfield_hint',
      desc: '',
      args: [],
    );
  }

  /// `How would you rate your experience?`
  String get review_text_heading {
    return Intl.message(
      'How would you rate your experience?',
      name: 'review_text_heading',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get invoice_subtotal {
    return Intl.message(
      'Subtotal',
      name: 'invoice_subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Coupon discount`
  String get invoice_coupon_discount {
    return Intl.message(
      'Coupon discount',
      name: 'invoice_coupon_discount',
      desc: '',
      args: [],
    );
  }

  /// `Service Fee`
  String get invoice_service_fee {
    return Intl.message(
      'Service Fee',
      name: 'invoice_service_fee',
      desc: '',
      args: [],
    );
  }

  /// `Apply Coupon`
  String get invoice_apply_coupon_action {
    return Intl.message(
      'Apply Coupon',
      name: 'invoice_apply_coupon_action',
      desc: '',
      args: [],
    );
  }

  /// `Enter the coupon code that will be applied to the price`
  String get title_coupon {
    return Intl.message(
      'Enter the coupon code that will be applied to the price',
      name: 'title_coupon',
      desc: '',
      args: [],
    );
  }

  /// `Pay Online`
  String get invoice_pay_online_action {
    return Intl.message(
      'Pay Online',
      name: 'invoice_pay_online_action',
      desc: '',
      args: [],
    );
  }

  /// `Looking for ride, please wait...`
  String get looking_heading {
    return Intl.message(
      'Looking for ride, please wait...',
      name: 'looking_heading',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Request`
  String get looking_cancel_request {
    return Intl.message(
      'Cancel Request',
      name: 'looking_cancel_request',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get driver_info_card_message {
    return Intl.message(
      'Message',
      name: 'driver_info_card_message',
      desc: '',
      args: [],
    );
  }

  /// `Call`
  String get driver_info_card_call {
    return Intl.message(
      'Call',
      name: 'driver_info_card_call',
      desc: '',
      args: [],
    );
  }

  /// `Copyright © {company}, All rights reserved.`
  String copyright_notice(Object company) {
    return Intl.message(
      'Copyright © $company, All rights reserved.',
      name: 'copyright_notice',
      desc: '',
      args: [company],
    );
  }

  /// `About`
  String get menu_about {
    return Intl.message(
      'About',
      name: 'menu_about',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get menu_login {
    return Intl.message(
      'Login',
      name: 'menu_login',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get menu_profile {
    return Intl.message(
      'Profile',
      name: 'menu_profile',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get menu_wallet {
    return Intl.message(
      'Wallet',
      name: 'menu_wallet',
      desc: '',
      args: [],
    );
  }

  /// `Trip history`
  String get menu_trip_history {
    return Intl.message(
      'Trip history',
      name: 'menu_trip_history',
      desc: '',
      args: [],
    );
  }

  /// `Privilege Program`
  String get menu_programme {
    return Intl.message(
      'Privilege Program',
      name: 'menu_programme',
      desc: '',
      args: [],
    );
  }

  /// `Announcements`
  String get menu_announcements {
    return Intl.message(
      'Announcements',
      name: 'menu_announcements',
      desc: '',
      args: [],
    );
  }

  /// `Saved locations`
  String get menu_saved_locations {
    return Intl.message(
      'Saved locations',
      name: 'menu_saved_locations',
      desc: '',
      args: [],
    );
  }

  /// `Reserved rides`
  String get menu_reserved_rider {
    return Intl.message(
      'Reserved rides',
      name: 'menu_reserved_rider',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get menu_settings {
    return Intl.message(
      'Settings',
      name: 'menu_settings',
      desc: '',
      args: [],
    );
  }

  /// `Payment method`
  String get menu_payment_method {
    return Intl.message(
      'Payment method',
      name: 'menu_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get menu_help {
    return Intl.message(
      'Help',
      name: 'menu_help',
      desc: '',
      args: [],
    );
  }

  /// `Favorite locations`
  String get title_favorite_location {
    return Intl.message(
      'Favorite locations',
      name: 'title_favorite_location',
      desc: '',
      args: [],
    );
  }

  /// `You can save your favorite locations for easier access`
  String get body_favorite_location {
    return Intl.message(
      'You can save your favorite locations for easier access',
      name: 'body_favorite_location',
      desc: '',
      args: [],
    );
  }

  /// `Enter the coupon code below:`
  String get coupon_heading {
    return Intl.message(
      'Enter the coupon code below:',
      name: 'coupon_heading',
      desc: '',
      args: [],
    );
  }

  /// `Coupon code`
  String get coupon_textfield_hint {
    return Intl.message(
      'Coupon code',
      name: 'coupon_textfield_hint',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get action_apply {
    return Intl.message(
      'Apply',
      name: 'action_apply',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get action_save {
    return Intl.message(
      'Save',
      name: 'action_save',
      desc: '',
      args: [],
    );
  }

  /// `Please enter name of location`
  String get create_address_name_empty_error {
    return Intl.message(
      'Please enter name of location',
      name: 'create_address_name_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Please enter details about the address`
  String get create_address_details_empty_error {
    return Intl.message(
      'Please enter details about the address',
      name: 'create_address_details_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get create_address_details_textfield_hint {
    return Intl.message(
      'Details',
      name: 'create_address_details_textfield_hint',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get create_address_title_textfield_hint {
    return Intl.message(
      'Title',
      name: 'create_address_title_textfield_hint',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get action_delete {
    return Intl.message(
      'Delete',
      name: 'action_delete',
      desc: '',
      args: [],
    );
  }

  /// `Noting To See Here.`
  String get addresses_empty_state_message {
    return Intl.message(
      'Noting To See Here.',
      name: 'addresses_empty_state_message',
      desc: '',
      args: [],
    );
  }

  /// `Nothing to see here.`
  String get announcements_empty_state_message {
    return Intl.message(
      'Nothing to see here.',
      name: 'announcements_empty_state_message',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get history_payment_method_cash {
    return Intl.message(
      'Cash',
      name: 'history_payment_method_cash',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get trip_history_completed_tab {
    return Intl.message(
      'Completed',
      name: 'trip_history_completed_tab',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get trip_history_canceled_tab {
    return Intl.message(
      'Canceled',
      name: 'trip_history_canceled_tab',
      desc: '',
      args: [],
    );
  }

  /// `Trip Information`
  String get trip_history_information {
    return Intl.message(
      'Trip Information',
      name: 'trip_history_information',
      desc: '',
      args: [],
    );
  }

  /// `No past order has been recorded.`
  String get trip_history_empty_state_message {
    return Intl.message(
      'No past order has been recorded.',
      name: 'trip_history_empty_state_message',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get profile_mobilenumber {
    return Intl.message(
      'Mobile Number',
      name: 'profile_mobilenumber',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get profile_firstname {
    return Intl.message(
      'First Name',
      name: 'profile_firstname',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get profile_lastname {
    return Intl.message(
      'Last Name',
      name: 'profile_lastname',
      desc: '',
      args: [],
    );
  }

  /// `E-Mail`
  String get profile_email {
    return Intl.message(
      'E-Mail',
      name: 'profile_email',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get profile_gender {
    return Intl.message(
      'Gender',
      name: 'profile_gender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get enum_gender_male {
    return Intl.message(
      'Male',
      name: 'enum_gender_male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get enum_gender_female {
    return Intl.message(
      'Female',
      name: 'enum_gender_female',
      desc: '',
      args: [],
    );
  }

  /// `Enter your`
  String get login_heading_first_line {
    return Intl.message(
      'Enter your',
      name: 'login_heading_first_line',
      desc: '',
      args: [],
    );
  }

  /// `mobile number`
  String get login_heading_second_line {
    return Intl.message(
      'mobile number',
      name: 'login_heading_second_line',
      desc: '',
      args: [],
    );
  }

  /// `We will send you confirmation code`
  String get login_heading_third_line {
    return Intl.message(
      'We will send you confirmation code',
      name: 'login_heading_third_line',
      desc: '',
      args: [],
    );
  }

  /// `Cell Number`
  String get login_cell_number_textfield_hint {
    return Intl.message(
      'Cell Number',
      name: 'login_cell_number_textfield_hint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the phone number in correct format`
  String get login_cell_number_empty_error {
    return Intl.message(
      'Please enter the phone number in correct format',
      name: 'login_cell_number_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get action_next {
    return Intl.message(
      'Next',
      name: 'action_next',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get action_delete_account {
    return Intl.message(
      'Delete Account',
      name: 'action_delete_account',
      desc: '',
      args: [],
    );
  }

  /// `Account deletion`
  String get delete_account_title {
    return Intl.message(
      'Account deletion',
      name: 'delete_account_title',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account? You can login again within 30 days to restore the account. After this period your data gets completely removed including all your remaining credits.`
  String get delete_account_body {
    return Intl.message(
      'Are you sure you want to delete your account? You can login again within 30 days to restore the account. After this period your data gets completely removed including all your remaining credits.',
      name: 'delete_account_body',
      desc: '',
      args: [],
    );
  }

  /// `Enter code sent`
  String get verify_phone_heading_first_line {
    return Intl.message(
      'Enter code sent',
      name: 'verify_phone_heading_first_line',
      desc: '',
      args: [],
    );
  }

  /// `to your phone`
  String get verify_phone_heading_second_line {
    return Intl.message(
      'to your phone',
      name: 'verify_phone_heading_second_line',
      desc: '',
      args: [],
    );
  }

  /// `We will send you the confirmation code`
  String get verify_phone_heading_third_line {
    return Intl.message(
      'We will send you the confirmation code',
      name: 'verify_phone_heading_third_line',
      desc: '',
      args: [],
    );
  }

  /// `Verification code is not entered.`
  String get verify_phone_code_empty_message {
    return Intl.message(
      'Verification code is not entered.',
      name: 'verify_phone_code_empty_message',
      desc: '',
      args: [],
    );
  }

  /// `Activity`
  String get wallet_activities_heading {
    return Intl.message(
      'Activity',
      name: 'wallet_activities_heading',
      desc: '',
      args: [],
    );
  }

  /// `Choose amount`
  String get wallet_choose_amount {
    return Intl.message(
      'Choose amount',
      name: 'wallet_choose_amount',
      desc: '',
      args: [],
    );
  }

  /// `Custom`
  String get wallet_action_custom {
    return Intl.message(
      'Custom',
      name: 'wallet_action_custom',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get menu_logout {
    return Intl.message(
      'Logout',
      name: 'menu_logout',
      desc: '',
      args: [],
    );
  }

  /// `Final Destination`
  String get point_selection_final_destination {
    return Intl.message(
      'Final Destination',
      name: 'point_selection_final_destination',
      desc: '',
      args: [],
    );
  }

  /// `Add Destination`
  String get point_selection_add_destination {
    return Intl.message(
      'Add Destination',
      name: 'point_selection_add_destination',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get menu_chat {
    return Intl.message(
      'Chat',
      name: 'menu_chat',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get enum_gender_unknown {
    return Intl.message(
      'Unknown',
      name: 'enum_gender_unknown',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get enum_address_type_home {
    return Intl.message(
      'Home',
      name: 'enum_address_type_home',
      desc: '',
      args: [],
    );
  }

  /// `Work`
  String get enum_address_type_work {
    return Intl.message(
      'Work',
      name: 'enum_address_type_work',
      desc: '',
      args: [],
    );
  }

  /// `Partner`
  String get enum_address_type_partner {
    return Intl.message(
      'Partner',
      name: 'enum_address_type_partner',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get enum_address_type_other {
    return Intl.message(
      'Other',
      name: 'enum_address_type_other',
      desc: '',
      args: [],
    );
  }

  /// `Gym`
  String get enum_address_type_gym {
    return Intl.message(
      'Gym',
      name: 'enum_address_type_gym',
      desc: '',
      args: [],
    );
  }

  /// `Parent's House`
  String get enum_address_type_parent {
    return Intl.message(
      'Parent\'s House',
      name: 'enum_address_type_parent',
      desc: '',
      args: [],
    );
  }

  /// `Cafe`
  String get enum_address_type_cafe {
    return Intl.message(
      'Cafe',
      name: 'enum_address_type_cafe',
      desc: '',
      args: [],
    );
  }

  /// `Park`
  String get enum_address_type_park {
    return Intl.message(
      'Park',
      name: 'enum_address_type_park',
      desc: '',
      args: [],
    );
  }

  /// `No connection`
  String get title_no_connection {
    return Intl.message(
      'No connection',
      name: 'title_no_connection',
      desc: '',
      args: [],
    );
  }

  /// `Check your Internet connection and try again`
  String get no_connection_description {
    return Intl.message(
      'Check your Internet connection and try again',
      name: 'no_connection_description',
      desc: '',
      args: [],
    );
  }

  /// `Notification permission was denied previously. In order to get new order\'s notifications you can enable the permission from app settings.`
  String get message_notification_permission_denined_message {
    return Intl.message(
      'Notification permission was denied previously. In order to get new order\\\'s notifications you can enable the permission from app settings.',
      name: 'message_notification_permission_denined_message',
      desc: '',
      args: [],
    );
  }

  /// `Notification Permission`
  String get message_notification_permission_title {
    return Intl.message(
      'Notification Permission',
      name: 'message_notification_permission_title',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get action_ok {
    return Intl.message(
      'OK',
      name: 'action_ok',
      desc: '',
      args: [],
    );
  }

  /// `Website`
  String get menu_website {
    return Intl.message(
      'Website',
      name: 'menu_website',
      desc: '',
      args: [],
    );
  }

  /// `Confirm & Reserve ride`
  String get action_confirm_and_reserve_ride {
    return Intl.message(
      'Confirm & Reserve ride',
      name: 'action_confirm_and_reserve_ride',
      desc: '',
      args: [],
    );
  }

  /// `Reserve Ride`
  String get title_reserve_ride {
    return Intl.message(
      'Reserve Ride',
      name: 'title_reserve_ride',
      desc: '',
      args: [],
    );
  }

  /// `Region is not supported.`
  String get error_region_unsupported {
    return Intl.message(
      'Region is not supported.',
      name: 'error_region_unsupported',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get action_confirm {
    return Intl.message(
      'Confirm',
      name: 'action_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Wait time`
  String get title_wait_time {
    return Intl.message(
      'Wait time',
      name: 'title_wait_time',
      desc: '',
      args: [],
    );
  }

  /// `Add Credit`
  String get title_add_credit {
    return Intl.message(
      'Add Credit',
      name: 'title_add_credit',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to add tip?`
  String get notice_tip_title {
    return Intl.message(
      'Would you like to add tip?',
      name: 'notice_tip_title',
      desc: '',
      args: [],
    );
  }

  /// `Adding tip is optional, You can add any amount you like as tip for the driver.`
  String get notice_tip_description {
    return Intl.message(
      'Adding tip is optional, You can add any amount you like as tip for the driver.',
      name: 'notice_tip_description',
      desc: '',
      args: [],
    );
  }

  /// `Pay for ride`
  String get action_pay_for_ride {
    return Intl.message(
      'Pay for ride',
      name: 'action_pay_for_ride',
      desc: '',
      args: [],
    );
  }

  /// `Confirm & Pay`
  String get action_confirm_and_pay {
    return Intl.message(
      'Confirm & Pay',
      name: 'action_confirm_and_pay',
      desc: '',
      args: [],
    );
  }

  /// `Add Photo`
  String get action_add_photo {
    return Intl.message(
      'Add Photo',
      name: 'action_add_photo',
      desc: '',
      args: [],
    );
  }

  /// `Complaint is submitted. Please wait for a contact from our support reperesentitive about your inquiry.`
  String get complaint_submit_success_message {
    return Intl.message(
      'Complaint is submitted. Please wait for a contact from our support reperesentitive about your inquiry.',
      name: 'complaint_submit_success_message',
      desc: '',
      args: [],
    );
  }

  /// `Can not be empty`
  String get error_field_cant_be_empty {
    return Intl.message(
      'Can not be empty',
      name: 'error_field_cant_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Write a description of your issue...`
  String get issue_description_placeholder {
    return Intl.message(
      'Write a description of your issue...',
      name: 'issue_description_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Subject`
  String get issue_subject_placeholder {
    return Intl.message(
      'Subject',
      name: 'issue_subject_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `You can report any issue you had with your ride ,we will help you with the issue within a call.`
  String get issue_submit_description {
    return Intl.message(
      'You can report any issue you had with your ride ,we will help you with the issue within a call.',
      name: 'issue_submit_description',
      desc: '',
      args: [],
    );
  }

  /// `Report an issue`
  String get issue_submit_title {
    return Intl.message(
      'Report an issue',
      name: 'issue_submit_title',
      desc: '',
      args: [],
    );
  }

  /// `Report issue`
  String get issue_submit_button {
    return Intl.message(
      'Report issue',
      name: 'issue_submit_button',
      desc: '',
      args: [],
    );
  }

  /// `Trip Information`
  String get trip_information_title {
    return Intl.message(
      'Trip Information',
      name: 'trip_information_title',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get payment_in_cash {
    return Intl.message(
      'Cash',
      name: 'payment_in_cash',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get payment_method_title {
    return Intl.message(
      'Payment Method',
      name: 'payment_method_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter gift code`
  String get enter_gift_code_title {
    return Intl.message(
      'Enter gift code',
      name: 'enter_gift_code_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter your gift card code`
  String get enter_gift_code_body {
    return Intl.message(
      'Enter your gift card code',
      name: 'enter_gift_code_body',
      desc: '',
      args: [],
    );
  }

  /// `Enter gift card code`
  String get enter_gift_code_hint {
    return Intl.message(
      'Enter gift card code',
      name: 'enter_gift_code_hint',
      desc: '',
      args: [],
    );
  }

  /// `Arriving in`
  String get order_arrive_title {
    return Intl.message(
      'Arriving in',
      name: 'order_arrive_title',
      desc: '',
      args: [],
    );
  }

  /// `The driver has arrived at your address`
  String get driver_arrived {
    return Intl.message(
      'The driver has arrived at your address',
      name: 'driver_arrived',
      desc: '',
      args: [],
    );
  }

  /// `Heading to your destination`
  String get driver_heading {
    return Intl.message(
      'Heading to your destination',
      name: 'driver_heading',
      desc: '',
      args: [],
    );
  }

  /// `Ride Options`
  String get ride_options {
    return Intl.message(
      'Ride Options',
      name: 'ride_options',
      desc: '',
      args: [],
    );
  }

  /// `Ride Safety`
  String get ride_safety {
    return Intl.message(
      'Ride Safety',
      name: 'ride_safety',
      desc: '',
      args: [],
    );
  }

  /// `Command is not supported`
  String get command_unsupported {
    return Intl.message(
      'Command is not supported',
      name: 'command_unsupported',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get cancel_title {
    return Intl.message(
      'Warning',
      name: 'cancel_title',
      desc: '',
      args: [],
    );
  }

  /// `Cancelation of service after driver has accepted the trip is subject to cancellation penalty of {cancelFee}. Do you confirm?`
  String cancel_body(Object cancelFee) {
    return Intl.message(
      'Cancelation of service after driver has accepted the trip is subject to cancellation penalty of $cancelFee. Do you confirm?',
      name: 'cancel_body',
      desc: '',
      args: [cancelFee],
    );
  }

  /// `How was your ride?`
  String get rate_title {
    return Intl.message(
      'How was your ride?',
      name: 'rate_title',
      desc: '',
      args: [],
    );
  }

  /// `Help us improve your experience by rating your driver`
  String get rate_body {
    return Intl.message(
      'Help us improve your experience by rating your driver',
      name: 'rate_body',
      desc: '',
      args: [],
    );
  }

  /// `Nice Points`
  String get rate_nice_points {
    return Intl.message(
      'Nice Points',
      name: 'rate_nice_points',
      desc: '',
      args: [],
    );
  }

  /// `Negative Points`
  String get rate_negative_points {
    return Intl.message(
      'Negative Points',
      name: 'rate_negative_points',
      desc: '',
      args: [],
    );
  }

  /// `Add comment`
  String get rate_add_comment_title {
    return Intl.message(
      'Add comment',
      name: 'rate_add_comment_title',
      desc: '',
      args: [],
    );
  }

  /// `write your comment ...`
  String get rate_add_comment_body {
    return Intl.message(
      'write your comment ...',
      name: 'rate_add_comment_body',
      desc: '',
      args: [],
    );
  }

  /// `Send Feedback`
  String get action_send_feedback {
    return Intl.message(
      'Send Feedback',
      name: 'action_send_feedback',
      desc: '',
      args: [],
    );
  }

  /// `Your ride is reserved.`
  String get reserve_title {
    return Intl.message(
      'Your ride is reserved.',
      name: 'reserve_title',
      desc: '',
      args: [],
    );
  }

  /// `You can check out reserved rides in the menu to see reserve information of this ride.`
  String get reserve_body {
    return Intl.message(
      'You can check out reserved rides in the menu to see reserve information of this ride.',
      name: 'reserve_body',
      desc: '',
      args: [],
    );
  }

  /// `See reserved rides`
  String get action_see_reserves {
    return Intl.message(
      'See reserved rides',
      name: 'action_see_reserves',
      desc: '',
      args: [],
    );
  }

  /// `Wait time`
  String get option_wait_time {
    return Intl.message(
      'Wait time',
      name: 'option_wait_time',
      desc: '',
      args: [],
    );
  }

  /// `Coupon Code`
  String get option_coupon_code {
    return Intl.message(
      'Coupon Code',
      name: 'option_coupon_code',
      desc: '',
      args: [],
    );
  }

  /// `Gift Card Code`
  String get option_gift_card {
    return Intl.message(
      'Gift Card Code',
      name: 'option_gift_card',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Ride`
  String get option_cancel_ride {
    return Intl.message(
      'Cancel Ride',
      name: 'option_cancel_ride',
      desc: '',
      args: [],
    );
  }

  /// `Ride Preferences`
  String get references_title {
    return Intl.message(
      'Ride Preferences',
      name: 'references_title',
      desc: '',
      args: [],
    );
  }

  /// `Share trip information`
  String get safety_share_trip {
    return Intl.message(
      'Share trip information',
      name: 'safety_share_trip',
      desc: '',
      args: [],
    );
  }

  /// `Coupon is expired`
  String get coupon_expired {
    return Intl.message(
      'Coupon is expired',
      name: 'coupon_expired',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Ride`
  String get action_cancel_ride {
    return Intl.message(
      'Cancel Ride',
      name: 'action_cancel_ride',
      desc: '',
      args: [],
    );
  }

  /// `Four levels of customer service are available to you:`
  String get program_intro {
    return Intl.message(
      'Four levels of customer service are available to you:',
      name: 'program_intro',
      desc: '',
      args: [],
    );
  }

  /// `*These rates will roll over and be active for 1 month. Extension is only if the monthly criterion for maintaining the current level is reached.`
  String get program_asterisk {
    return Intl.message(
      '*These rates will roll over and be active for 1 month. Extension is only if the monthly criterion for maintaining the current level is reached.',
      name: 'program_asterisk',
      desc: '',
      args: [],
    );
  }

  /// `SOS`
  String get ride_safety_sos {
    return Intl.message(
      'SOS',
      name: 'ride_safety_sos',
      desc: '',
      args: [],
    );
  }

  /// `Distress Signal`
  String get sos_title {
    return Intl.message(
      'Distress Signal',
      name: 'sos_title',
      desc: '',
      args: [],
    );
  }

  /// `Distress signals are for emergencies and call to authorities such as police might be made on your behalf. Please use this feature only in emergencies that you might be in danger.`
  String get sos_body {
    return Intl.message(
      'Distress signals are for emergencies and call to authorities such as police might be made on your behalf. Please use this feature only in emergencies that you might be in danger.',
      name: 'sos_body',
      desc: '',
      args: [],
    );
  }

  /// `SOS is sent`
  String get sos_sent_alert {
    return Intl.message(
      'SOS is sent',
      name: 'sos_sent_alert',
      desc: '',
      args: [],
    );
  }

  /// `It's an emergency`
  String get sos_ok_action {
    return Intl.message(
      'It\'s an emergency',
      name: 'sos_ok_action',
      desc: '',
      args: [],
    );
  }

  /// `Taxi service designed for your comfort \n have Trips with your favorite drivers and chose your ride preferences`
  String get onboarding_first_page_body {
    return Intl.message(
      'Taxi service designed for your comfort \n have Trips with your favorite drivers and chose your ride preferences',
      name: 'onboarding_first_page_body',
      desc: '',
      args: [],
    );
  }

  /// `Get rewarded!`
  String get onboarding_second_page_title {
    return Intl.message(
      'Get rewarded!',
      name: 'onboarding_second_page_title',
      desc: '',
      args: [],
    );
  }

  /// `Get extra bonuses for referring a friend, completing trips and many more...`
  String get onboarding_second_page_body {
    return Intl.message(
      'Get extra bonuses for referring a friend, completing trips and many more...',
      name: 'onboarding_second_page_body',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get onboarding_sign_in_title {
    return Intl.message(
      'Sign in',
      name: 'onboarding_sign_in_title',
      desc: '',
      args: [],
    );
  }

  /// `A few seconds away from signing in and starting a comfortable ride`
  String get onboarding_sign_in_body {
    return Intl.message(
      'A few seconds away from signing in and starting a comfortable ride',
      name: 'onboarding_sign_in_body',
      desc: '',
      args: [],
    );
  }

  /// `Redeem Gift Card`
  String get action_redeem_gift_card {
    return Intl.message(
      'Redeem Gift Card',
      name: 'action_redeem_gift_card',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get order_status_canceled {
    return Intl.message(
      'Canceled',
      name: 'order_status_canceled',
      desc: '',
      args: [],
    );
  }

  /// `Skip for now`
  String get action_skip_for_now {
    return Intl.message(
      'Skip for now',
      name: 'action_skip_for_now',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get onboarding_select_language_title {
    return Intl.message(
      'Select Language',
      name: 'onboarding_select_language_title',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to {appName}!`
  String onboarding_first_page_title(Object appName) {
    return Intl.message(
      'Welcome to $appName!',
      name: 'onboarding_first_page_title',
      desc: '',
      args: [appName],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
