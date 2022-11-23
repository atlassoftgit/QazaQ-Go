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

  /// `Go Online`
  String get statusOffline {
    return Intl.message(
      'Go Online',
      name: 'statusOffline',
      desc: '',
      args: [],
    );
  }

  /// `Go Offline`
  String get statusOnline {
    return Intl.message(
      'Go Offline',
      name: 'statusOnline',
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

  /// `Notification permission was denied previously. In order to get new order's notifications you can enable the permission from app settings.`
  String get message_notification_permission_denined_message {
    return Intl.message(
      'Notification permission was denied previously. In order to get new order\'s notifications you can enable the permission from app settings.',
      name: 'message_notification_permission_denined_message',
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

  /// `Logout`
  String get menu_logout {
    return Intl.message(
      'Logout',
      name: 'menu_logout',
      desc: '',
      args: [],
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

  /// `Wallet`
  String get menu_wallet {
    return Intl.message(
      'Wallet',
      name: 'menu_wallet',
      desc: '',
      args: [],
    );
  }

  /// `Trip History`
  String get menu_trip_history {
    return Intl.message(
      'Trip History',
      name: 'menu_trip_history',
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

  /// `No Announcement at the moment.`
  String get menu_announcement_empty_state {
    return Intl.message(
      'No Announcement at the moment.',
      name: 'menu_announcement_empty_state',
      desc: '',
      args: [],
    );
  }

  /// `Driver Registeration`
  String get driver_register_title {
    return Intl.message(
      'Driver Registeration',
      name: 'driver_register_title',
      desc: '',
      args: [],
    );
  }

  /// `Verification Completed`
  String get message_verification_completed {
    return Intl.message(
      'Verification Completed',
      name: 'message_verification_completed',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error`
  String get message_unknown_error {
    return Intl.message(
      'Unknown error',
      name: 'message_unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get title_success {
    return Intl.message(
      'Success',
      name: 'title_success',
      desc: '',
      args: [],
    );
  }

  /// `Your profile is submitted for admin approval. You can check back later to see the status of your submission.`
  String get driver_register_profile_submitted_message {
    return Intl.message(
      'Your profile is submitted for admin approval. You can check back later to see the status of your submission.',
      name: 'driver_register_profile_submitted_message',
      desc: '',
      args: [],
    );
  }

  /// `Normally at this stage admin would need to approve driver's submission from the Admin Panel. However for the sake of demo your profile is automatically approved now and is ready to use.`
  String get driver_registration_approved_demo_mode {
    return Intl.message(
      'Normally at this stage admin would need to approve driver\'s submission from the Admin Panel. However for the sake of demo your profile is automatically approved now and is ready to use.',
      name: 'driver_registration_approved_demo_mode',
      desc: '',
      args: [],
    );
  }

  /// `IMPORTANT!`
  String get title_important {
    return Intl.message(
      'IMPORTANT!',
      name: 'title_important',
      desc: '',
      args: [],
    );
  }

  /// `Cell Number`
  String get cell_number {
    return Intl.message(
      'Cell Number',
      name: 'cell_number',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the phone number`
  String get phone_number_empty {
    return Intl.message(
      'Please enter the phone number',
      name: 'phone_number_empty',
      desc: '',
      args: [],
    );
  }

  /// `Verify Number`
  String get driver_registration_step_verify_number_title {
    return Intl.message(
      'Verify Number',
      name: 'driver_registration_step_verify_number_title',
      desc: '',
      args: [],
    );
  }

  /// `Verification code`
  String get driver_register_verification_code_textfield_hint {
    return Intl.message(
      'Verification code',
      name: 'driver_register_verification_code_textfield_hint',
      desc: '',
      args: [],
    );
  }

  /// `Contact Details`
  String get driver_register_contact_details_title {
    return Intl.message(
      'Contact Details',
      name: 'driver_register_contact_details_title',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstname {
    return Intl.message(
      'First Name',
      name: 'firstname',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastname {
    return Intl.message(
      'Last Name',
      name: 'lastname',
      desc: '',
      args: [],
    );
  }

  /// `E-Mail`
  String get email {
    return Intl.message(
      'E-Mail',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Certificate Number`
  String get certificate_number {
    return Intl.message(
      'Certificate Number',
      name: 'certificate_number',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get gender_male {
    return Intl.message(
      'Male',
      name: 'gender_male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get gender_female {
    return Intl.message(
      'Female',
      name: 'gender_female',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Ride Details`
  String get driver_register_ride_details_step_title {
    return Intl.message(
      'Ride Details',
      name: 'driver_register_ride_details_step_title',
      desc: '',
      args: [],
    );
  }

  /// `Plate Number`
  String get plate_number {
    return Intl.message(
      'Plate Number',
      name: 'plate_number',
      desc: '',
      args: [],
    );
  }

  /// `Production Year`
  String get car_production_year {
    return Intl.message(
      'Production Year',
      name: 'car_production_year',
      desc: '',
      args: [],
    );
  }

  /// `Car Model`
  String get car_model {
    return Intl.message(
      'Car Model',
      name: 'car_model',
      desc: '',
      args: [],
    );
  }

  /// `Car Color`
  String get car_color {
    return Intl.message(
      'Car Color',
      name: 'car_color',
      desc: '',
      args: [],
    );
  }

  /// `Payout Details`
  String get driver_register_step_payout_details_title {
    return Intl.message(
      'Payout Details',
      name: 'driver_register_step_payout_details_title',
      desc: '',
      args: [],
    );
  }

  /// `Bank Name`
  String get bank_name {
    return Intl.message(
      'Bank Name',
      name: 'bank_name',
      desc: '',
      args: [],
    );
  }

  /// `Account Number`
  String get account_number {
    return Intl.message(
      'Account Number',
      name: 'account_number',
      desc: '',
      args: [],
    );
  }

  /// `Bank Swift`
  String get bank_swift {
    return Intl.message(
      'Bank Swift',
      name: 'bank_swift',
      desc: '',
      args: [],
    );
  }

  /// `Bank Routing Number`
  String get bank_routing_numbe {
    return Intl.message(
      'Bank Routing Number',
      name: 'bank_routing_numbe',
      desc: '',
      args: [],
    );
  }

  /// `Bank Routing Number`
  String get bankRoutingNumber {
    return Intl.message(
      'Bank Routing Number',
      name: 'bankRoutingNumber',
      desc: '',
      args: [],
    );
  }

  /// `Documents`
  String get driver_register_step_documents_title {
    return Intl.message(
      'Documents',
      name: 'driver_register_step_documents_title',
      desc: '',
      args: [],
    );
  }

  /// `In order to verificate above documents we require below documents uploaded`
  String get driver_register_step_documents_heading {
    return Intl.message(
      'In order to verificate above documents we require below documents uploaded',
      name: 'driver_register_step_documents_heading',
      desc: '',
      args: [],
    );
  }

  /// `1-ID`
  String get driver_register_document_first {
    return Intl.message(
      '1-ID',
      name: 'driver_register_document_first',
      desc: '',
      args: [],
    );
  }

  /// `2-Driver License`
  String get driver_register_document_second {
    return Intl.message(
      '2-Driver License',
      name: 'driver_register_document_second',
      desc: '',
      args: [],
    );
  }

  /// `3-Ride's Ownership document`
  String get driver_register_document_third {
    return Intl.message(
      '3-Ride\'s Ownership document',
      name: 'driver_register_document_third',
      desc: '',
      args: [],
    );
  }

  /// `Upload Document`
  String get action_upload_document {
    return Intl.message(
      'Upload Document',
      name: 'action_upload_document',
      desc: '',
      args: [],
    );
  }

  /// `No past order has been recorded.`
  String get trip_history_empty_state {
    return Intl.message(
      'No past order has been recorded.',
      name: 'trip_history_empty_state',
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

  /// `Unkonwn`
  String get enum_unknown {
    return Intl.message(
      'Unkonwn',
      name: 'enum_unknown',
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

  /// `LOADING`
  String get loading {
    return Intl.message(
      'LOADING',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Pickup location`
  String get available_order_pickup_location {
    return Intl.message(
      'Pickup location',
      name: 'available_order_pickup_location',
      desc: '',
      args: [],
    );
  }

  /// `Drop off location`
  String get available_order_dropoff_location {
    return Intl.message(
      'Drop off location',
      name: 'available_order_dropoff_location',
      desc: '',
      args: [],
    );
  }

  /// `Cost`
  String get available_order_cost {
    return Intl.message(
      'Cost',
      name: 'available_order_cost',
      desc: '',
      args: [],
    );
  }

  /// `Accept Order`
  String get available_order_action_accept {
    return Intl.message(
      'Accept Order',
      name: 'available_order_action_accept',
      desc: '',
      args: [],
    );
  }

  /// `Cash Payment received`
  String get order_status_action_received_cash {
    return Intl.message(
      'Cash Payment received',
      name: 'order_status_action_received_cash',
      desc: '',
      args: [],
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

  /// `Navigate`
  String get order_status_action_navigate {
    return Intl.message(
      'Navigate',
      name: 'order_status_action_navigate',
      desc: '',
      args: [],
    );
  }

  /// `Expected in: `
  String get order_status_expected_in {
    return Intl.message(
      'Expected in: ',
      name: 'order_status_expected_in',
      desc: '',
      args: [],
    );
  }

  /// `Soon`
  String get order_status_expected_soon {
    return Intl.message(
      'Soon',
      name: 'order_status_expected_soon',
      desc: '',
      args: [],
    );
  }

  /// `Unpaid`
  String get order_status_fee_unpaid {
    return Intl.message(
      'Unpaid',
      name: 'order_status_fee_unpaid',
      desc: '',
      args: [],
    );
  }

  /// `Paid`
  String get order_status_fee_paid {
    return Intl.message(
      'Paid',
      name: 'order_status_fee_paid',
      desc: '',
      args: [],
    );
  }

  /// `Arrived`
  String get order_status_action_arrived {
    return Intl.message(
      'Arrived',
      name: 'order_status_action_arrived',
      desc: '',
      args: [],
    );
  }

  /// `Start Trip`
  String get order_status_action_start {
    return Intl.message(
      'Start Trip',
      name: 'order_status_action_start',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get order_status_action_finished {
    return Intl.message(
      'Finish',
      name: 'order_status_action_finished',
      desc: '',
      args: [],
    );
  }

  /// `Command is not supported`
  String get message_cant_open_url {
    return Intl.message(
      'Command is not supported',
      name: 'message_cant_open_url',
      desc: '',
      args: [],
    );
  }

  /// `Login First`
  String get status_need_login {
    return Intl.message(
      'Login First',
      name: 'status_need_login',
      desc: '',
      args: [],
    );
  }

  /// `Bank Transfer`
  String get enum_driver_recharge_type_bank_transfer {
    return Intl.message(
      'Bank Transfer',
      name: 'enum_driver_recharge_type_bank_transfer',
      desc: '',
      args: [],
    );
  }

  /// `Gift`
  String get enum_driver_recharge_type_gift {
    return Intl.message(
      'Gift',
      name: 'enum_driver_recharge_type_gift',
      desc: '',
      args: [],
    );
  }

  /// `In-App Payment`
  String get enum_driver_recharge_type_in_app_payment {
    return Intl.message(
      'In-App Payment',
      name: 'enum_driver_recharge_type_in_app_payment',
      desc: '',
      args: [],
    );
  }

  /// `Order Fee`
  String get enum_driver_recharge_transaction_type_order_fee {
    return Intl.message(
      'Order Fee',
      name: 'enum_driver_recharge_transaction_type_order_fee',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw`
  String get enum_driver_deduct_transaction_type_withdraw {
    return Intl.message(
      'Withdraw',
      name: 'enum_driver_deduct_transaction_type_withdraw',
      desc: '',
      args: [],
    );
  }

  /// `Correction`
  String get enum_driver_deduct_transaction_type_correction {
    return Intl.message(
      'Correction',
      name: 'enum_driver_deduct_transaction_type_correction',
      desc: '',
      args: [],
    );
  }

  /// `Commission`
  String get enum_driver_deduct_transaction_type_commission {
    return Intl.message(
      'Commission',
      name: 'enum_driver_deduct_transaction_type_commission',
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

  /// `Are you sure you want to log out of the application?`
  String get log_out_desc {
    return Intl.message(
      'Are you sure you want to log out of the application?',
      name: 'log_out_desc',
      desc: '',
      args: [],
    );
  }

  /// `Delete account`
  String get delete_account {
    return Intl.message(
      'Delete account',
      name: 'delete_account',
      desc: '',
      args: [],
    );
  }

  /// `Account deletion`
  String get account_deletion {
    return Intl.message(
      'Account deletion',
      name: 'account_deletion',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account? You can login again within 30 days to restore the account. After this period your data gets completely removed including all your remaining credits.`
  String get account_deletion_desc {
    return Intl.message(
      'Are you sure you want to delete your account? You can login again within 30 days to restore the account. After this period your data gets completely removed including all your remaining credits.',
      name: 'account_deletion_desc',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '' key

  /// `Activities`
  String get wallet_activities_heading {
    return Intl.message(
      'Activities',
      name: 'wallet_activities_heading',
      desc: '',
      args: [],
    );
  }

  /// `Required field`
  String get form_required_field_error {
    return Intl.message(
      'Required field',
      name: 'form_required_field_error',
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

  /// `Canceled`
  String get trip_history_canceled_tab {
    return Intl.message(
      'Canceled',
      name: 'trip_history_canceled_tab',
      desc: '',
      args: [],
    );
  }

  /// `Get online to see requests`
  String get get_online_to_see_requests {
    return Intl.message(
      'Get online to see requests',
      name: 'get_online_to_see_requests',
      desc: '',
      args: [],
    );
  }

  /// `Searching for ride`
  String get searching_for_ride {
    return Intl.message(
      'Searching for ride',
      name: 'searching_for_ride',
      desc: '',
      args: [],
    );
  }

  /// `Earnings`
  String get earnings {
    return Intl.message(
      'Earnings',
      name: 'earnings',
      desc: '',
      args: [],
    );
  }

  /// `No Data Found!`
  String get no_data_found {
    return Intl.message(
      'No Data Found!',
      name: 'no_data_found',
      desc: '',
      args: [],
    );
  }

  /// `At the criteria set above we can't find any records.`
  String get at_the_criteria_set_above_we_cant_find_any_records {
    return Intl.message(
      'At the criteria set above we can\'t find any records.',
      name: 'at_the_criteria_set_above_we_cant_find_any_records',
      desc: '',
      args: [],
    );
  }

  /// `No Announcements yet!`
  String get no_announcements_yet {
    return Intl.message(
      'No Announcements yet!',
      name: 'no_announcements_yet',
      desc: '',
      args: [],
    );
  }

  /// `We will notify you when new announcements comes.`
  String get we_will_notify_you_when_new_announcements_comes {
    return Intl.message(
      'We will notify you when new announcements comes.',
      name: 'we_will_notify_you_when_new_announcements_comes',
      desc: '',
      args: [],
    );
  }

  /// `Trip Information`
  String get trip_information {
    return Intl.message(
      'Trip Information',
      name: 'trip_information',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message(
      'Cash',
      name: 'cash',
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

  /// `Choose amount`
  String get choose_amount {
    return Intl.message(
      'Choose amount',
      name: 'choose_amount',
      desc: '',
      args: [],
    );
  }

  /// `Choose an app to navigate with`
  String get choose_an_app_to_navigate_with {
    return Intl.message(
      'Choose an app to navigate with',
      name: 'choose_an_app_to_navigate_with',
      desc: '',
      args: [],
    );
  }

  /// `Rider will be notified once you tap Arrived`
  String get rider_will_be_notified_once_you_tap_Arrived {
    return Intl.message(
      'Rider will be notified once you tap Arrived',
      name: 'rider_will_be_notified_once_you_tap_Arrived',
      desc: '',
      args: [],
    );
  }

  /// `Rider has been notified`
  String get rider_has_been_notified {
    return Intl.message(
      'Rider has been notified',
      name: 'rider_has_been_notified',
      desc: '',
      args: [],
    );
  }

  /// `Heading to destination`
  String get heading_to_destination {
    return Intl.message(
      'Heading to destination',
      name: 'heading_to_destination',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Ridy Wallet`
  String get ridy_wallet {
    return Intl.message(
      'Ridy Wallet',
      name: 'ridy_wallet',
      desc: '',
      args: [],
    );
  }

  /// `Add Credit`
  String get add_credit {
    return Intl.message(
      'Add Credit',
      name: 'add_credit',
      desc: '',
      args: [],
    );
  }

  /// `Redeem gift card`
  String get redeem_gift_card {
    return Intl.message(
      'Redeem gift card',
      name: 'redeem_gift_card',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get canceled {
    return Intl.message(
      'Canceled',
      name: 'canceled',
      desc: '',
      args: [],
    );
  }

  /// `Custom`
  String get custom {
    return Intl.message(
      'Custom',
      name: 'custom',
      desc: '',
      args: [],
    );
  }

  /// `Payment Info`
  String get payment_info {
    return Intl.message(
      'Payment Info',
      name: 'payment_info',
      desc: '',
      args: [],
    );
  }

  /// `Waiting for rider payment`
  String get waiting_for_rider_payment {
    return Intl.message(
      'Waiting for rider payment',
      name: 'waiting_for_rider_payment',
      desc: '',
      args: [],
    );
  }

  /// `You can also receive cash instead of online payment if you and the writer are both willing to.`
  String get you_can_also_receive_cash_instead_of_online_payment {
    return Intl.message(
      'You can also receive cash instead of online payment if you and the writer are both willing to.',
      name: 'you_can_also_receive_cash_instead_of_online_payment',
      desc: '',
      args: [],
    );
  }

  /// `Tip`
  String get tip {
    return Intl.message(
      'Tip',
      name: 'tip',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message(
      'Subtotal',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Rider`
  String get rider {
    return Intl.message(
      'Rider',
      name: 'rider',
      desc: '',
      args: [],
    );
  }

  /// `Expected you`
  String get expected_you {
    return Intl.message(
      'Expected you',
      name: 'expected_you',
      desc: '',
      args: [],
    );
  }

  /// `Expects you in`
  String get expects_you_in {
    return Intl.message(
      'Expects you in',
      name: 'expects_you_in',
      desc: '',
      args: [],
    );
  }

  /// `Ride hasn't been paid yet`
  String get ride_hasnt_been_paid_yet {
    return Intl.message(
      'Ride hasn\'t been paid yet',
      name: 'ride_hasnt_been_paid_yet',
      desc: '',
      args: [],
    );
  }

  /// `Rider Has been paid`
  String get rider_has_been_paid {
    return Intl.message(
      'Rider Has been paid',
      name: 'rider_has_been_paid',
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

  /// `Rider Preferences`
  String get rider_preferences {
    return Intl.message(
      'Rider Preferences',
      name: 'rider_preferences',
      desc: '',
      args: [],
    );
  }

  /// `Navigate to pickup point`
  String get navigate_to_pickup_point {
    return Intl.message(
      'Navigate to pickup point',
      name: 'navigate_to_pickup_point',
      desc: '',
      args: [],
    );
  }

  /// `Navigate to drop off point`
  String get navigate_to_drop_off_point {
    return Intl.message(
      'Navigate to drop off point',
      name: 'navigate_to_drop_off_point',
      desc: '',
      args: [],
    );
  }

  /// `Rider will be notified once you tap Arrived`
  String get rider_will_be_notified_once_you_tap_arrived {
    return Intl.message(
      'Rider will be notified once you tap Arrived',
      name: 'rider_will_be_notified_once_you_tap_arrived',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Ride`
  String get cancel_ride {
    return Intl.message(
      'Cancel Ride',
      name: 'cancel_ride',
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

  /// `I have read and agree with `
  String get i_have_read_and_agree_with {
    return Intl.message(
      'I have read and agree with ',
      name: 'i_have_read_and_agree_with',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get terms_conditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'terms_conditions',
      desc: '',
      args: [],
    );
  }

  /// `No Records!`
  String get no_necords {
    return Intl.message(
      'No Records!',
      name: 'no_necords',
      desc: '',
      args: [],
    );
  }

  /// `Complete Registration`
  String get complete_registration {
    return Intl.message(
      'Complete Registration',
      name: 'complete_registration',
      desc: '',
      args: [],
    );
  }

  /// `This account is blocked from providing services.`
  String get this_account_is_blocked_from_providing_services {
    return Intl.message(
      'This account is blocked from providing services.',
      name: 'this_account_is_blocked_from_providing_services',
      desc: '',
      args: [],
    );
  }

  /// `Your registration form was submitted and it is waiting for review.`
  String get your_registration_form_was_submitted_and_it_is_waiting_for_review {
    return Intl.message(
      'Your registration form was submitted and it is waiting for review.',
      name: 'your_registration_form_was_submitted_and_it_is_waiting_for_review',
      desc: '',
      args: [],
    );
  }

  /// `You can update your submission in case needed.`
  String get you_can_update_your_submission_in_case_needed {
    return Intl.message(
      'You can update your submission in case needed.',
      name: 'you_can_update_your_submission_in_case_needed',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get update_profile {
    return Intl.message(
      'Update Profile',
      name: 'update_profile',
      desc: '',
      args: [],
    );
  }

  /// `We found that there is an issue with your registration form. You can update your submission form and resubmit for review.`
  String
      get we_found_that_there_is_an_issue_with_your_registration_form_you_can_update_your_submission_form_and_resubmit_for_review {
    return Intl.message(
      'We found that there is an issue with your registration form. You can update your submission form and resubmit for review.',
      name:
          'we_found_that_there_is_an_issue_with_your_registration_form_you_can_update_your_submission_form_and_resubmit_for_review',
      desc: '',
      args: [],
    );
  }

  /// `No Description Provided`
  String get no_description_provided {
    return Intl.message(
      'No Description Provided',
      name: 'no_description_provided',
      desc: '',
      args: [],
    );
  }

  /// `We found issues with your submission which are not suitable for our providers. Feel free to contact in case needed.`
  String
      get we_found_issues_with_your_submission_which_are_not_suitable_for_our_providers_feel_free_to_contact_in_case_needed {
    return Intl.message(
      'We found issues with your submission which are not suitable for our providers. Feel free to contact in case needed.',
      name:
          'we_found_issues_with_your_submission_which_are_not_suitable_for_our_providers_feel_free_to_contact_in_case_needed',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Unregistered state`
  String get unknown_unregistrered_state {
    return Intl.message(
      'Unknown Unregistered state',
      name: 'unknown_unregistrered_state',
      desc: '',
      args: [],
    );
  }

  /// `Driver Registration`
  String get driver_registration {
    return Intl.message(
      'Driver Registration',
      name: 'driver_registration',
      desc: '',
      args: [],
    );
  }

  /// `Ride Preferences`
  String get ride_preferences {
    return Intl.message(
      'Ride Preferences',
      name: 'ride_preferences',
      desc: '',
      args: [],
    );
  }

  /// `Confirm & Continue`
  String get confirm_continue {
    return Intl.message(
      'Confirm & Continue',
      name: 'confirm_continue',
      desc: '',
      args: [],
    );
  }

  /// `in`
  String get action_in {
    return Intl.message(
      'in',
      name: 'action_in',
      desc: '',
      args: [],
    );
  }

  /// `min`
  String get time_min {
    return Intl.message(
      'min',
      name: 'time_min',
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

  /// `Unexpected Error`
  String get title_unexpected_error {
    return Intl.message(
      'Unexpected Error',
      name: 'title_unexpected_error',
      desc: '',
      args: [],
    );
  }

  /// `Oops! Unexpected error is occurred during operation. Please restart the application.`
  String get unexpected_error_description {
    return Intl.message(
      'Oops! Unexpected error is occurred during operation. Please restart the application.',
      name: 'unexpected_error_description',
      desc: '',
      args: [],
    );
  }

  /// `Restart app`
  String get action_restart {
    return Intl.message(
      'Restart app',
      name: 'action_restart',
      desc: '',
      args: [],
    );
  }

  /// `Theme Mode`
  String get theme_mode {
    return Intl.message(
      'Theme Mode',
      name: 'theme_mode',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Sign up now`
  String get sign_up_now {
    return Intl.message(
      'Sign up now',
      name: 'sign_up_now',
      desc: '',
      args: [],
    );
  }

  /// `Please complete your`
  String get please_complete_your {
    return Intl.message(
      'Please complete your',
      name: 'please_complete_your',
      desc: '',
      args: [],
    );
  }

  /// `registration submission`
  String get registration_submission {
    return Intl.message(
      'registration submission',
      name: 'registration_submission',
      desc: '',
      args: [],
    );
  }

  /// `Your submission is under review`
  String get your_submission_is_under_review {
    return Intl.message(
      'Your submission is under review',
      name: 'your_submission_is_under_review',
      desc: '',
      args: [],
    );
  }

  /// `Thanks for patience`
  String get thanks_for_patience {
    return Intl.message(
      'Thanks for patience',
      name: 'thanks_for_patience',
      desc: '',
      args: [],
    );
  }

  /// `Edit submission`
  String get edit_submission {
    return Intl.message(
      'Edit submission',
      name: 'edit_submission',
      desc: '',
      args: [],
    );
  }

  /// `Your Submission is fully rejected`
  String get your_submission_is_fully_rejected {
    return Intl.message(
      'Your Submission is fully rejected',
      name: 'your_submission_is_fully_rejected',
      desc: '',
      args: [],
    );
  }

  /// `There is a problem with the submission`
  String get there_is_a_problem_with_the_submission {
    return Intl.message(
      'There is a problem with the submission',
      name: 'there_is_a_problem_with_the_submission',
      desc: '',
      args: [],
    );
  }

  /// `Point reached`
  String get reach_next_point {
    return Intl.message(
      'Point reached',
      name: 'reach_next_point',
      desc: '',
      args: [],
    );
  }

  /// `You do not have enough funds, please top up your account`
  String get title_not_enough_funds {
    return Intl.message(
      'You do not have enough funds, please top up your account',
      name: 'title_not_enough_funds',
      desc: '',
      args: [],
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
