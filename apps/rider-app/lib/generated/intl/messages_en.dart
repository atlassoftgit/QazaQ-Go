// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(cancelFee) =>
      "Cancelation of service after driver has accepted the trip is subject to cancellation penalty of ${cancelFee}. Do you confirm?";

  static String m1(company) => "Copyright © ${company}, All rights reserved.";

  static String m2(appName) => "Welcome to ${appName}!";

  static String m3(time) => "Book for ${time}";

  static String m4(count) => "& ${count} other currencies";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "action_add_photo": MessageLookupByLibrary.simpleMessage("Add Photo"),
        "action_apply": MessageLookupByLibrary.simpleMessage("Apply"),
        "action_back": MessageLookupByLibrary.simpleMessage("Back"),
        "action_cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "action_cancel_request":
            MessageLookupByLibrary.simpleMessage("Cancel request"),
        "action_cancel_ride":
            MessageLookupByLibrary.simpleMessage("Cancel Ride"),
        "action_canceled": MessageLookupByLibrary.simpleMessage("Canceled"),
        "action_confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "action_confirm_and_pay":
            MessageLookupByLibrary.simpleMessage("Confirm & Pay"),
        "action_confirm_and_reserve_ride":
            MessageLookupByLibrary.simpleMessage("Confirm & Reserve ride"),
        "action_confirm_location":
            MessageLookupByLibrary.simpleMessage("Confirm Location"),
        "action_continue": MessageLookupByLibrary.simpleMessage("Continue"),
        "action_delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "action_delete_account":
            MessageLookupByLibrary.simpleMessage("Delete Account"),
        "action_edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "action_next": MessageLookupByLibrary.simpleMessage("Next"),
        "action_ok": MessageLookupByLibrary.simpleMessage("OK"),
        "action_pay_for_ride":
            MessageLookupByLibrary.simpleMessage("Pay for ride"),
        "action_redeem_gift_card":
            MessageLookupByLibrary.simpleMessage("Redeem Gift Card"),
        "action_save": MessageLookupByLibrary.simpleMessage("Save"),
        "action_see_reserves":
            MessageLookupByLibrary.simpleMessage("See reserved rides"),
        "action_send_feedback":
            MessageLookupByLibrary.simpleMessage("Send Feedback"),
        "action_set_location":
            MessageLookupByLibrary.simpleMessage("Set location"),
        "action_skip_for_now":
            MessageLookupByLibrary.simpleMessage("Skip for now"),
        "add_custom_credit":
            MessageLookupByLibrary.simpleMessage("Add Custom Credit"),
        "add_location_welcome":
            MessageLookupByLibrary.simpleMessage("Add Favorite location"),
        "add_tip": MessageLookupByLibrary.simpleMessage("Tip"),
        "add_total": MessageLookupByLibrary.simpleMessage("Total"),
        "addresses_empty_state_message":
            MessageLookupByLibrary.simpleMessage("Noting To See Here."),
        "alert_select_type_address": MessageLookupByLibrary.simpleMessage(
            "Please select the type of address"),
        "announcements_empty_state_message":
            MessageLookupByLibrary.simpleMessage("Nothing to see here."),
        "body_enter_code": MessageLookupByLibrary.simpleMessage(
            "Code has been sent to your phone number."),
        "body_favorite_location": MessageLookupByLibrary.simpleMessage(
            "You can save your favorite locations for easier access"),
        "body_location_error": MessageLookupByLibrary.simpleMessage(
            "We were not able to get your current location using your device\'s GPS, Please check device location permission for app from device\'s settings. Alternatively you can use search field above to select your pickup point."),
        "body_no_news": MessageLookupByLibrary.simpleMessage(
            "We will notify you when new announcements comes."),
        "body_reservation_empty": MessageLookupByLibrary.simpleMessage(
            "You will be able to see your future bookings once you make them at the main screen."),
        "body_ride_requested": MessageLookupByLibrary.simpleMessage(
            "We are looking for nearest driver for you."),
        "body_sign_in": MessageLookupByLibrary.simpleMessage(
            "First you need to sign in to book your rider. A verification code will be sent to your phone number."),
        "cancel_body": m0,
        "cancel_title": MessageLookupByLibrary.simpleMessage("Warning"),
        "choose_on_map": MessageLookupByLibrary.simpleMessage("Choose on map"),
        "command_unsupported":
            MessageLookupByLibrary.simpleMessage("Command is not supported"),
        "complaint_submit_success_message": MessageLookupByLibrary.simpleMessage(
            "Complaint is submitted. Please wait for a contact from our support reperesentitive about your inquiry."),
        "copyright_notice": m1,
        "coupon_expired":
            MessageLookupByLibrary.simpleMessage("Coupon is expired"),
        "coupon_heading": MessageLookupByLibrary.simpleMessage(
            "Enter the coupon code below:"),
        "coupon_textfield_hint":
            MessageLookupByLibrary.simpleMessage("Coupon code"),
        "create_address_details_empty_error":
            MessageLookupByLibrary.simpleMessage(
                "Please enter details about the address"),
        "create_address_details_textfield_hint":
            MessageLookupByLibrary.simpleMessage("Details"),
        "create_address_name_empty_error": MessageLookupByLibrary.simpleMessage(
            "Please enter name of location"),
        "create_address_title_textfield_hint":
            MessageLookupByLibrary.simpleMessage("Title"),
        "delete_account_body": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete your account? You can login again within 30 days to restore the account. After this period your data gets completely removed including all your remaining credits."),
        "delete_account_title":
            MessageLookupByLibrary.simpleMessage("Account deletion"),
        "driver_arrived": MessageLookupByLibrary.simpleMessage(
            "The driver has arrived at your address"),
        "driver_heading":
            MessageLookupByLibrary.simpleMessage("Heading to your destination"),
        "driver_info_card_call": MessageLookupByLibrary.simpleMessage("Call"),
        "driver_info_card_message":
            MessageLookupByLibrary.simpleMessage("Message"),
        "enter_gift_code_body":
            MessageLookupByLibrary.simpleMessage("Enter your gift card code"),
        "enter_gift_code_hint":
            MessageLookupByLibrary.simpleMessage("Enter gift card code"),
        "enter_gift_code_title":
            MessageLookupByLibrary.simpleMessage("Enter gift code"),
        "enum_address_type_cafe": MessageLookupByLibrary.simpleMessage("Cafe"),
        "enum_address_type_gym": MessageLookupByLibrary.simpleMessage("Gym"),
        "enum_address_type_home": MessageLookupByLibrary.simpleMessage("Home"),
        "enum_address_type_other":
            MessageLookupByLibrary.simpleMessage("Other"),
        "enum_address_type_parent":
            MessageLookupByLibrary.simpleMessage("Parent\'s House"),
        "enum_address_type_park": MessageLookupByLibrary.simpleMessage("Park"),
        "enum_address_type_partner":
            MessageLookupByLibrary.simpleMessage("Partner"),
        "enum_address_type_work": MessageLookupByLibrary.simpleMessage("Work"),
        "enum_gender_female": MessageLookupByLibrary.simpleMessage("Female"),
        "enum_gender_male": MessageLookupByLibrary.simpleMessage("Male"),
        "enum_gender_unknown": MessageLookupByLibrary.simpleMessage("Unknown"),
        "enum_rider_transaction_deduct_correction":
            MessageLookupByLibrary.simpleMessage("Correction"),
        "enum_rider_transaction_deduct_order_fee":
            MessageLookupByLibrary.simpleMessage("Order Fee"),
        "enum_rider_transaction_deduct_withdraw":
            MessageLookupByLibrary.simpleMessage("Withdraw"),
        "enum_rider_transaction_recharge_bank_transfer":
            MessageLookupByLibrary.simpleMessage("Bank Transfer"),
        "enum_rider_transaction_recharge_correction":
            MessageLookupByLibrary.simpleMessage("Correction"),
        "enum_rider_transaction_recharge_gift":
            MessageLookupByLibrary.simpleMessage("Gift"),
        "enum_rider_transaction_recharge_in_app_payment":
            MessageLookupByLibrary.simpleMessage("In-app Payment"),
        "enum_unknown": MessageLookupByLibrary.simpleMessage("Unkonwn"),
        "error_field_cant_be_empty":
            MessageLookupByLibrary.simpleMessage("Can not be empty"),
        "error_region_unsupported":
            MessageLookupByLibrary.simpleMessage("Region is not supported."),
        "hello_welcome": MessageLookupByLibrary.simpleMessage("Hello"),
        "hint_add_stop": MessageLookupByLibrary.simpleMessage("Add Stop"),
        "hint_current_location":
            MessageLookupByLibrary.simpleMessage("Current Location"),
        "hint_name_fav_location":
            MessageLookupByLibrary.simpleMessage("Name your favorite location"),
        "hint_type_address": MessageLookupByLibrary.simpleMessage("Type"),
        "hint_your_destination":
            MessageLookupByLibrary.simpleMessage("Your Destination"),
        "history_payment_method_cash":
            MessageLookupByLibrary.simpleMessage("Cash"),
        "invoice_apply_coupon_action":
            MessageLookupByLibrary.simpleMessage("Apply Coupon"),
        "invoice_coupon_discount":
            MessageLookupByLibrary.simpleMessage("Coupon discount"),
        "invoice_pay_online_action":
            MessageLookupByLibrary.simpleMessage("Pay Online"),
        "invoice_service_fee":
            MessageLookupByLibrary.simpleMessage("Service Fee"),
        "invoice_subtotal": MessageLookupByLibrary.simpleMessage("Subtotal"),
        "issue_description_placeholder": MessageLookupByLibrary.simpleMessage(
            "Write a description of your issue..."),
        "issue_subject_placeholder":
            MessageLookupByLibrary.simpleMessage("Subject"),
        "issue_submit_button":
            MessageLookupByLibrary.simpleMessage("Report issue"),
        "issue_submit_description": MessageLookupByLibrary.simpleMessage(
            "You can report any issue you had with your ride ,we will help you with the issue within a call."),
        "issue_submit_title":
            MessageLookupByLibrary.simpleMessage("Report an issue"),
        "loading": MessageLookupByLibrary.simpleMessage("Loading"),
        "locale": MessageLookupByLibrary.simpleMessage("en"),
        "login_cell_number_empty_error": MessageLookupByLibrary.simpleMessage(
            "Please enter the phone number in correct format"),
        "login_cell_number_textfield_hint":
            MessageLookupByLibrary.simpleMessage("Cell Number"),
        "login_heading_first_line":
            MessageLookupByLibrary.simpleMessage("Enter your"),
        "login_heading_second_line":
            MessageLookupByLibrary.simpleMessage("mobile number"),
        "login_heading_third_line": MessageLookupByLibrary.simpleMessage(
            "We will send you confirmation code"),
        "looking_cancel_request":
            MessageLookupByLibrary.simpleMessage("Cancel Request"),
        "looking_heading": MessageLookupByLibrary.simpleMessage(
            "Looking for ride, please wait..."),
        "menu_about": MessageLookupByLibrary.simpleMessage("About"),
        "menu_announcements":
            MessageLookupByLibrary.simpleMessage("Announcements"),
        "menu_chat": MessageLookupByLibrary.simpleMessage("Chat"),
        "menu_help": MessageLookupByLibrary.simpleMessage("Help"),
        "menu_login": MessageLookupByLibrary.simpleMessage("Login"),
        "menu_logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "menu_payment_method":
            MessageLookupByLibrary.simpleMessage("Payment method"),
        "menu_profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "menu_programme":
            MessageLookupByLibrary.simpleMessage("Privilege Program"),
        "menu_reserved_rider":
            MessageLookupByLibrary.simpleMessage("Reserved rides"),
        "menu_saved_locations":
            MessageLookupByLibrary.simpleMessage("Saved locations"),
        "menu_settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "menu_trip_history":
            MessageLookupByLibrary.simpleMessage("Trip history"),
        "menu_wallet": MessageLookupByLibrary.simpleMessage("Wallet"),
        "menu_website": MessageLookupByLibrary.simpleMessage("Website"),
        "message_notification_permission_denined_message":
            MessageLookupByLibrary.simpleMessage(
                "Notification permission was denied previously. In order to get new order\\\'s notifications you can enable the permission from app settings."),
        "message_notification_permission_title":
            MessageLookupByLibrary.simpleMessage("Notification Permission"),
        "no_connection_description": MessageLookupByLibrary.simpleMessage(
            "Check your Internet connection and try again"),
        "notice_tip_description": MessageLookupByLibrary.simpleMessage(
            "Adding tip is optional, You can add any amount you like as tip for the driver."),
        "notice_tip_title":
            MessageLookupByLibrary.simpleMessage("Would you like to add tip?"),
        "onboarding_first_page_body": MessageLookupByLibrary.simpleMessage(
            "Taxi service designed for your comfort \n have Trips with your favorite drivers and chose your ride preferences"),
        "onboarding_first_page_title": m2,
        "onboarding_second_page_body": MessageLookupByLibrary.simpleMessage(
            "Get extra bonuses for referring a friend, completing trips and many more..."),
        "onboarding_second_page_title":
            MessageLookupByLibrary.simpleMessage("Get rewarded!"),
        "onboarding_select_language_title":
            MessageLookupByLibrary.simpleMessage("Select Language"),
        "onboarding_sign_in_body": MessageLookupByLibrary.simpleMessage(
            "A few seconds away from signing in and starting a comfortable ride"),
        "onboarding_sign_in_title":
            MessageLookupByLibrary.simpleMessage("Sign in"),
        "option_cancel_ride":
            MessageLookupByLibrary.simpleMessage("Cancel Ride"),
        "option_coupon_code":
            MessageLookupByLibrary.simpleMessage("Coupon Code"),
        "option_gift_card":
            MessageLookupByLibrary.simpleMessage("Gift Card Code"),
        "option_wait_time": MessageLookupByLibrary.simpleMessage("Wait time"),
        "order_arrive_title":
            MessageLookupByLibrary.simpleMessage("Arriving in"),
        "order_status_canceled":
            MessageLookupByLibrary.simpleMessage("Canceled"),
        "payment_in_cash": MessageLookupByLibrary.simpleMessage("Cash"),
        "payment_method":
            MessageLookupByLibrary.simpleMessage("Payment Method"),
        "payment_method_title":
            MessageLookupByLibrary.simpleMessage("Payment Method"),
        "phone_number": MessageLookupByLibrary.simpleMessage("Phone number"),
        "place_search_hint": MessageLookupByLibrary.simpleMessage(
            "Enter keywords of the location"),
        "point_selection_add_destination":
            MessageLookupByLibrary.simpleMessage("Add Destination"),
        "point_selection_confirm_pickup":
            MessageLookupByLibrary.simpleMessage("Confirm Pickup Location"),
        "point_selection_final_destination":
            MessageLookupByLibrary.simpleMessage("Final Destination"),
        "profile_email": MessageLookupByLibrary.simpleMessage("E-Mail"),
        "profile_firstname": MessageLookupByLibrary.simpleMessage("First Name"),
        "profile_gender": MessageLookupByLibrary.simpleMessage("Gender"),
        "profile_lastname": MessageLookupByLibrary.simpleMessage("Last Name"),
        "profile_mobilenumber":
            MessageLookupByLibrary.simpleMessage("Mobile Number"),
        "program_asterisk": MessageLookupByLibrary.simpleMessage(
            "*These rates will roll over and be active for 1 month. Extension is only if the monthly criterion for maintaining the current level is reached."),
        "program_intro": MessageLookupByLibrary.simpleMessage(
            "Four levels of customer service are available to you:"),
        "rate_add_comment_body":
            MessageLookupByLibrary.simpleMessage("write your comment ..."),
        "rate_add_comment_title":
            MessageLookupByLibrary.simpleMessage("Add comment"),
        "rate_body": MessageLookupByLibrary.simpleMessage(
            "Help us improve your experience by rating your driver"),
        "rate_negative_points":
            MessageLookupByLibrary.simpleMessage("Negative Points"),
        "rate_nice_points": MessageLookupByLibrary.simpleMessage("Nice Points"),
        "rate_title":
            MessageLookupByLibrary.simpleMessage("How was your ride?"),
        "references_title":
            MessageLookupByLibrary.simpleMessage("Ride Preferences"),
        "reserve_body": MessageLookupByLibrary.simpleMessage(
            "You can check out reserved rides in the menu to see reserve information of this ride."),
        "reserve_title":
            MessageLookupByLibrary.simpleMessage("Your ride is reserved."),
        "review_action_submit_review":
            MessageLookupByLibrary.simpleMessage("Submit Review"),
        "review_text_heading": MessageLookupByLibrary.simpleMessage(
            "How would you rate your experience?"),
        "review_textfield_hint":
            MessageLookupByLibrary.simpleMessage("Add Comment"),
        "ride_options": MessageLookupByLibrary.simpleMessage("Ride Options"),
        "ride_safety": MessageLookupByLibrary.simpleMessage("Ride Safety"),
        "ride_safety_sos": MessageLookupByLibrary.simpleMessage("SOS"),
        "safety_share_trip":
            MessageLookupByLibrary.simpleMessage("Share trip information"),
        "service_selection_book_later": m3,
        "service_selection_book_now":
            MessageLookupByLibrary.simpleMessage("Book Now"),
        "sos_body": MessageLookupByLibrary.simpleMessage(
            "Distress signals are for emergencies and call to authorities such as police might be made on your behalf. Please use this feature only in emergencies that you might be in danger."),
        "sos_ok_action":
            MessageLookupByLibrary.simpleMessage("It\'s an emergency"),
        "sos_sent_alert": MessageLookupByLibrary.simpleMessage("SOS is sent"),
        "sos_title": MessageLookupByLibrary.simpleMessage("Distress Signal"),
        "title_add_credit": MessageLookupByLibrary.simpleMessage("Add Credit"),
        "title_coupon": MessageLookupByLibrary.simpleMessage(
            "Enter the coupon code that will be applied to the price"),
        "title_enter_code": MessageLookupByLibrary.simpleMessage("Enter code"),
        "title_favorite_location":
            MessageLookupByLibrary.simpleMessage("Favorite locations"),
        "title_history_empty":
            MessageLookupByLibrary.simpleMessage("No Records!"),
        "title_location_error":
            MessageLookupByLibrary.simpleMessage("Location"),
        "title_no_connection":
            MessageLookupByLibrary.simpleMessage("No connection"),
        "title_no_news":
            MessageLookupByLibrary.simpleMessage("No Announcements yet!"),
        "title_reserve_ride":
            MessageLookupByLibrary.simpleMessage("Reserve Ride"),
        "title_reserved_empty":
            MessageLookupByLibrary.simpleMessage("No Reservations!"),
        "title_ride_requested":
            MessageLookupByLibrary.simpleMessage("Ride requested"),
        "title_sign_in": MessageLookupByLibrary.simpleMessage("Sign In"),
        "title_wait_time": MessageLookupByLibrary.simpleMessage("Wait time"),
        "top_up_sheet_pay_button": MessageLookupByLibrary.simpleMessage("Pay"),
        "top_up_sheet_textfield_hint":
            MessageLookupByLibrary.simpleMessage("Input amount to recharge"),
        "trip_history_canceled_tab":
            MessageLookupByLibrary.simpleMessage("Canceled"),
        "trip_history_completed_tab":
            MessageLookupByLibrary.simpleMessage("Completed"),
        "trip_history_empty_state_message":
            MessageLookupByLibrary.simpleMessage(
                "No past order has been recorded."),
        "trip_history_information":
            MessageLookupByLibrary.simpleMessage("Trip Information"),
        "trip_information_title":
            MessageLookupByLibrary.simpleMessage("Trip Information"),
        "verify_phone_code_empty_message": MessageLookupByLibrary.simpleMessage(
            "Verification code is not entered."),
        "verify_phone_heading_first_line":
            MessageLookupByLibrary.simpleMessage("Enter code sent"),
        "verify_phone_heading_second_line":
            MessageLookupByLibrary.simpleMessage("to your phone"),
        "verify_phone_heading_third_line": MessageLookupByLibrary.simpleMessage(
            "We will send you the confirmation code"),
        "wallet_action_custom": MessageLookupByLibrary.simpleMessage("Custom"),
        "wallet_activities_heading":
            MessageLookupByLibrary.simpleMessage("Activity"),
        "wallet_add_credit": MessageLookupByLibrary.simpleMessage("Add Credit"),
        "wallet_choose_amount":
            MessageLookupByLibrary.simpleMessage("Choose amount"),
        "wallet_empty_state_message":
            MessageLookupByLibrary.simpleMessage("No history recorded."),
        "wallet_gateway_empty_state":
            MessageLookupByLibrary.simpleMessage("No Gateway is available."),
        "wallet_other_currencies_available": m4,
        "wallet_select_currency":
            MessageLookupByLibrary.simpleMessage("Select currency:"),
        "wallet_select_payment_method":
            MessageLookupByLibrary.simpleMessage("Select Payment Method:"),
        "wallet_switch_currency":
            MessageLookupByLibrary.simpleMessage("Switch"),
        "where_destination_welcome":
            MessageLookupByLibrary.simpleMessage("Destination point"),
        "where_going_welcome":
            MessageLookupByLibrary.simpleMessage("Where we\'re going?")
      };
}
