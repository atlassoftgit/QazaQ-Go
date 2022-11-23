// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(company) => "Copyright © ${company}, Все права защищены.";

  static String m1(count) => "& ${count} другие валюты";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account_deletion":
            MessageLookupByLibrary.simpleMessage("Удаление аккаунта"),
        "account_deletion_desc": MessageLookupByLibrary.simpleMessage(
            "Вы уверены, что хотите удалить свой аккаунт? Вы можете снова войти в систему в течение 30 дней, чтобы восстановить аккаунт. По истечении этого срока ваши данные будут полностью удалены, включая все оставшиеся кредиты."),
        "account_number": MessageLookupByLibrary.simpleMessage("Номер счета"),
        "action_cancel": MessageLookupByLibrary.simpleMessage("Отменить"),
        "action_continue": MessageLookupByLibrary.simpleMessage("Продолжить"),
        "action_in": MessageLookupByLibrary.simpleMessage("через"),
        "action_ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "action_restart": MessageLookupByLibrary.simpleMessage("Перезапустить"),
        "action_upload_document":
            MessageLookupByLibrary.simpleMessage("Загрузить документ"),
        "add_credit": MessageLookupByLibrary.simpleMessage("Добавить карту"),
        "address": MessageLookupByLibrary.simpleMessage("Адрес"),
        "at_the_criteria_set_above_we_cant_find_any_records":
            MessageLookupByLibrary.simpleMessage(
                "По указанным выше критериям мы не можем найти ни одной записи."),
        "available_order_action_accept":
            MessageLookupByLibrary.simpleMessage("Принять заказ"),
        "available_order_cost": MessageLookupByLibrary.simpleMessage("Расходы"),
        "available_order_dropoff_location":
            MessageLookupByLibrary.simpleMessage("Место высадки"),
        "available_order_pickup_location":
            MessageLookupByLibrary.simpleMessage("Мест посадки"),
        "back": MessageLookupByLibrary.simpleMessage("Назад"),
        "bankRoutingNumber": MessageLookupByLibrary.simpleMessage(
            "Банковский номер маршрутизации"),
        "bank_name": MessageLookupByLibrary.simpleMessage("Название банка"),
        "bank_routing_numbe": MessageLookupByLibrary.simpleMessage(
            "Банковский номер маршрутизации"),
        "bank_swift": MessageLookupByLibrary.simpleMessage("Банк Свифт"),
        "cancel_ride": MessageLookupByLibrary.simpleMessage("Отменить поездку"),
        "canceled": MessageLookupByLibrary.simpleMessage("Отменено"),
        "car_color": MessageLookupByLibrary.simpleMessage("Цвет автомобиля"),
        "car_model": MessageLookupByLibrary.simpleMessage("Модель автомобиля"),
        "car_production_year":
            MessageLookupByLibrary.simpleMessage("Производственный год"),
        "cash": MessageLookupByLibrary.simpleMessage("Наличные"),
        "cell_number": MessageLookupByLibrary.simpleMessage("Сотовый номер"),
        "certificate_number":
            MessageLookupByLibrary.simpleMessage("Номер сертификата"),
        "choose_amount": MessageLookupByLibrary.simpleMessage("Выберите сумму"),
        "choose_an_app_to_navigate_with":
            MessageLookupByLibrary.simpleMessage("Выберите навигатор"),
        "complete_registration":
            MessageLookupByLibrary.simpleMessage("Завершить регистрацию"),
        "confirm_continue":
            MessageLookupByLibrary.simpleMessage("Подтвердить и продолжить"),
        "copyright_notice": m0,
        "custom": MessageLookupByLibrary.simpleMessage("Другая сумма"),
        "delete_account":
            MessageLookupByLibrary.simpleMessage("Удалить аккаунт"),
        "driver_register_contact_details_title":
            MessageLookupByLibrary.simpleMessage("Контактная информация"),
        "driver_register_document_first":
            MessageLookupByLibrary.simpleMessage("1-ID"),
        "driver_register_document_second":
            MessageLookupByLibrary.simpleMessage("2-водительские права"),
        "driver_register_document_third": MessageLookupByLibrary.simpleMessage(
            "Право собственности на 3-Ride"),
        "driver_register_profile_submitted_message":
            MessageLookupByLibrary.simpleMessage(
                "Ваш профиль отправлен на одобрение администратора. Вы можете вернуться позже, чтобы увидеть статус вашей заявки."),
        "driver_register_ride_details_step_title":
            MessageLookupByLibrary.simpleMessage("Детали поездки"),
        "driver_register_step_documents_heading":
            MessageLookupByLibrary.simpleMessage(
                "Для проверки вышеуказанных документов нам необходимы загруженные ниже документы."),
        "driver_register_step_documents_title":
            MessageLookupByLibrary.simpleMessage("Документы"),
        "driver_register_step_payout_details_title":
            MessageLookupByLibrary.simpleMessage("Детали выплаты"),
        "driver_register_title":
            MessageLookupByLibrary.simpleMessage("Регистрация водителя"),
        "driver_register_verification_code_textfield_hint":
            MessageLookupByLibrary.simpleMessage("Код верификации"),
        "driver_registration":
            MessageLookupByLibrary.simpleMessage("Регистрация водителя"),
        "driver_registration_approved_demo_mode":
            MessageLookupByLibrary.simpleMessage(
                "Обычно на этом этапе администратору необходимо одобрить отправку драйвера из панели администратора. Однако для демонстрации ваш профиль теперь автоматически одобрен и готов к использованию."),
        "driver_registration_step_verify_number_title":
            MessageLookupByLibrary.simpleMessage("Проверить номер"),
        "earnings": MessageLookupByLibrary.simpleMessage("Статистика"),
        "edit_submission":
            MessageLookupByLibrary.simpleMessage("Редактировать заявку"),
        "email": MessageLookupByLibrary.simpleMessage("Эл. почта"),
        "enum_driver_deduct_transaction_type_commission":
            MessageLookupByLibrary.simpleMessage("Комиссия"),
        "enum_driver_deduct_transaction_type_correction":
            MessageLookupByLibrary.simpleMessage("Исправление"),
        "enum_driver_deduct_transaction_type_withdraw":
            MessageLookupByLibrary.simpleMessage("Снять со счета"),
        "enum_driver_recharge_transaction_type_order_fee":
            MessageLookupByLibrary.simpleMessage("Комиссия за заказ"),
        "enum_driver_recharge_type_bank_transfer":
            MessageLookupByLibrary.simpleMessage("Банковский перевод"),
        "enum_driver_recharge_type_gift":
            MessageLookupByLibrary.simpleMessage("Подарок"),
        "enum_driver_recharge_type_in_app_payment":
            MessageLookupByLibrary.simpleMessage("Оплата в приложении"),
        "enum_unknown": MessageLookupByLibrary.simpleMessage("Неизвестно"),
        "expected_you": MessageLookupByLibrary.simpleMessage("Ожидает вас"),
        "expects_you_in": MessageLookupByLibrary.simpleMessage("Ожидает вас"),
        "firstname": MessageLookupByLibrary.simpleMessage("Имя"),
        "form_required_field_error":
            MessageLookupByLibrary.simpleMessage("Обязательное поле"),
        "gender": MessageLookupByLibrary.simpleMessage("Пол"),
        "gender_female": MessageLookupByLibrary.simpleMessage("женский"),
        "gender_male": MessageLookupByLibrary.simpleMessage("Мужчина"),
        "get_online_to_see_requests": MessageLookupByLibrary.simpleMessage(
            "Вы не можете принимать заказы пока вы оффлайн"),
        "heading_to_destination": MessageLookupByLibrary.simpleMessage(
            "Навигация к месту назначения"),
        "i_have_read_and_agree_with":
            MessageLookupByLibrary.simpleMessage("Я прочитал и согласен с "),
        "lastname": MessageLookupByLibrary.simpleMessage("Фамилия"),
        "loading": MessageLookupByLibrary.simpleMessage("ЗАГРУЗКА"),
        "log_out_desc": MessageLookupByLibrary.simpleMessage(
            "Вы уверены, что хотите выйти из приложения?"),
        "menu_about": MessageLookupByLibrary.simpleMessage("О"),
        "menu_announcement_empty_state": MessageLookupByLibrary.simpleMessage(
            "На данный момент объявлений нет."),
        "menu_announcements": MessageLookupByLibrary.simpleMessage("Анонсы"),
        "menu_chat": MessageLookupByLibrary.simpleMessage("Чат"),
        "menu_logout": MessageLookupByLibrary.simpleMessage("Выйти"),
        "menu_trip_history":
            MessageLookupByLibrary.simpleMessage("История поездки"),
        "menu_wallet": MessageLookupByLibrary.simpleMessage("Кошелек"),
        "message_cant_open_url":
            MessageLookupByLibrary.simpleMessage("Команда не поддерживается"),
        "message_notification_permission_denined_message":
            MessageLookupByLibrary.simpleMessage(
                "Ранее в разрешении на уведомление было отказано. Чтобы получать уведомления о новых заказах, вы можете включить разрешение в настройках приложения."),
        "message_notification_permission_title":
            MessageLookupByLibrary.simpleMessage("Разрешение на уведомление"),
        "message_unknown_error":
            MessageLookupByLibrary.simpleMessage("Неизвестная ошибка"),
        "message_verification_completed":
            MessageLookupByLibrary.simpleMessage("Проверка завершена"),
        "navigate_to_drop_off_point":
            MessageLookupByLibrary.simpleMessage("Навигация к месту высадки"),
        "navigate_to_pickup_point":
            MessageLookupByLibrary.simpleMessage("Навигация к пункту посадки"),
        "no_announcements_yet":
            MessageLookupByLibrary.simpleMessage("Нет объявлении!"),
        "no_connection_description": MessageLookupByLibrary.simpleMessage(
            "Проверте ваше интернет-соединение и попробуйте снова"),
        "no_data_found":
            MessageLookupByLibrary.simpleMessage("Ничего не найдено!"),
        "no_description_provided":
            MessageLookupByLibrary.simpleMessage("Описание не предоставлено"),
        "no_necords": MessageLookupByLibrary.simpleMessage("Нет записей!"),
        "order_status_action_arrived":
            MessageLookupByLibrary.simpleMessage("На месте"),
        "order_status_action_finished":
            MessageLookupByLibrary.simpleMessage("Закончить поездку"),
        "order_status_action_navigate":
            MessageLookupByLibrary.simpleMessage("Навигация"),
        "order_status_action_received_cash":
            MessageLookupByLibrary.simpleMessage("Наличные"),
        "order_status_action_start":
            MessageLookupByLibrary.simpleMessage("Начать поездку"),
        "order_status_expected_in":
            MessageLookupByLibrary.simpleMessage("Ожидается в:"),
        "order_status_expected_soon":
            MessageLookupByLibrary.simpleMessage("Скоро"),
        "order_status_fee_paid":
            MessageLookupByLibrary.simpleMessage("Оплачен"),
        "order_status_fee_unpaid":
            MessageLookupByLibrary.simpleMessage("Неоплачен"),
        "payment_info":
            MessageLookupByLibrary.simpleMessage("Информация о платеже"),
        "payment_method":
            MessageLookupByLibrary.simpleMessage(" Способ оплаты:"),
        "phone_number_empty": MessageLookupByLibrary.simpleMessage(
            "Пожалуйста, введите номер телефона"),
        "plate_number": MessageLookupByLibrary.simpleMessage("Номерной знак"),
        "please_complete_your":
            MessageLookupByLibrary.simpleMessage("Пожалуйста, заполните"),
        "reach_next_point":
            MessageLookupByLibrary.simpleMessage("Точка достигнута"),
        "redeem_gift_card": MessageLookupByLibrary.simpleMessage(
            "Использовать подарочную карту"),
        "registration_submission":
            MessageLookupByLibrary.simpleMessage("заявку на регистрацию"),
        "ride_hasnt_been_paid_yet":
            MessageLookupByLibrary.simpleMessage("Поездка еще не оплачена"),
        "ride_options": MessageLookupByLibrary.simpleMessage("Опции"),
        "ride_preferences":
            MessageLookupByLibrary.simpleMessage("Настройки поездки"),
        "rider": MessageLookupByLibrary.simpleMessage("Клиент"),
        "rider_has_been_notified":
            MessageLookupByLibrary.simpleMessage("Пассажир был уведомлен"),
        "rider_has_been_paid":
            MessageLookupByLibrary.simpleMessage("Клиент оплатил"),
        "rider_preferences":
            MessageLookupByLibrary.simpleMessage("Параметры пользователя"),
        "rider_will_be_notified_once_you_tap_Arrived":
            MessageLookupByLibrary.simpleMessage(
                "Пользователь получит уведомление, как только вы нажмете «Прибыл»."),
        "rider_will_be_notified_once_you_tap_arrived":
            MessageLookupByLibrary.simpleMessage(
                "Клиент получит уведомление, как только вы нажмете На месте."),
        "ridy_wallet": MessageLookupByLibrary.simpleMessage("Личный счёт"),
        "searching_for_ride":
            MessageLookupByLibrary.simpleMessage("Поиск пассажиров"),
        "sign_up_now":
            MessageLookupByLibrary.simpleMessage("Зарегистрируйтесь сейчас"),
        "statusOffline": MessageLookupByLibrary.simpleMessage("Оффлайн"),
        "statusOnline": MessageLookupByLibrary.simpleMessage("Онлайн"),
        "status_need_login":
            MessageLookupByLibrary.simpleMessage("Войти в первую очередь"),
        "subtotal": MessageLookupByLibrary.simpleMessage("Итого"),
        "terms_conditions": MessageLookupByLibrary.simpleMessage("Условиями"),
        "thanks_for_patience":
            MessageLookupByLibrary.simpleMessage("Спасибо за ожидание"),
        "theme_mode": MessageLookupByLibrary.simpleMessage("Переключить тему"),
        "there_is_a_problem_with_the_submission":
            MessageLookupByLibrary.simpleMessage(
                "Возникла проблема с подачей заявки"),
        "this_account_is_blocked_from_providing_services":
            MessageLookupByLibrary.simpleMessage(
                "Эта учетная запись заблокирована для предоставления услуг."),
        "time_min": MessageLookupByLibrary.simpleMessage("минут"),
        "tip": MessageLookupByLibrary.simpleMessage("Чаевые"),
        "title_important": MessageLookupByLibrary.simpleMessage("ВАЖНЫЙ!"),
        "title_no_connection":
            MessageLookupByLibrary.simpleMessage("Отсутствует подключение"),
        "title_not_enough_funds": MessageLookupByLibrary.simpleMessage(
            "У вас недостаточно средств, пожалуйста, пополните счет недостаточно средств"),
        "title_success": MessageLookupByLibrary.simpleMessage("Успех"),
        "title_unexpected_error":
            MessageLookupByLibrary.simpleMessage("Неожиданная ошибка"),
        "top_up_sheet_pay_button":
            MessageLookupByLibrary.simpleMessage("Платить"),
        "top_up_sheet_textfield_hint": MessageLookupByLibrary.simpleMessage(
            "Введите сумму для пополнения"),
        "trip_history_canceled_tab":
            MessageLookupByLibrary.simpleMessage("Отменен"),
        "trip_history_completed_tab":
            MessageLookupByLibrary.simpleMessage("Выполненные"),
        "trip_history_empty_state": MessageLookupByLibrary.simpleMessage(
            "Предыдущий заказ не зарегистрирован."),
        "trip_information":
            MessageLookupByLibrary.simpleMessage("Информация о поездке"),
        "unexpected_error_description": MessageLookupByLibrary.simpleMessage(
            "Упс! Во время работы произошла непредвиденная ошибка. Пожалуйста, перезапустите приложение"),
        "unknown_unregistrered_state":
            MessageLookupByLibrary.simpleMessage("Неизвестный статус"),
        "update_profile":
            MessageLookupByLibrary.simpleMessage("Обновить профиль"),
        "waiting_for_rider_payment":
            MessageLookupByLibrary.simpleMessage("Ожидание оплаты от клиента"),
        "wallet_activities_heading":
            MessageLookupByLibrary.simpleMessage("История"),
        "wallet_add_credit":
            MessageLookupByLibrary.simpleMessage("Пополнить кошелек"),
        "wallet_empty_state_message":
            MessageLookupByLibrary.simpleMessage("История не записана."),
        "wallet_gateway_empty_state":
            MessageLookupByLibrary.simpleMessage("Шлюз недоступен."),
        "wallet_other_currencies_available": m1,
        "wallet_select_currency":
            MessageLookupByLibrary.simpleMessage("Выберите валюту:"),
        "wallet_select_payment_method":
            MessageLookupByLibrary.simpleMessage("Выберите способ оплаты:"),
        "wallet_switch_currency":
            MessageLookupByLibrary.simpleMessage("Валюта"),
        "we_found_issues_with_your_submission_which_are_not_suitable_for_our_providers_feel_free_to_contact_in_case_needed":
            MessageLookupByLibrary.simpleMessage(
                "Мы обнаружили проблемы с вашей заявкой, которые не подходят для наших поставщиков. Не стесняйтесь обращаться в случае необходимости."),
        "we_found_that_there_is_an_issue_with_your_registration_form_you_can_update_your_submission_form_and_resubmit_for_review":
            MessageLookupByLibrary.simpleMessage(
                "Мы обнаружили проблему с вашей регистрацией. Вы можете обновить страницу и повторно отправить на рассмотрение."),
        "we_will_notify_you_when_new_announcements_comes":
            MessageLookupByLibrary.simpleMessage(
                "Мы сообщим вам, когда появятся новые объявления."),
        "welcome": MessageLookupByLibrary.simpleMessage("Добро пожаловать"),
        "you_can_also_receive_cash_instead_of_online_payment":
            MessageLookupByLibrary.simpleMessage(
                "Вы также можете получить наличные вместо онлайн-оплаты, если вы и клиент оба согласны."),
        "you_can_update_your_submission_in_case_needed":
            MessageLookupByLibrary.simpleMessage(
                "Вы можете обновить свою заявку в случае необходимости."),
        "your_registration_form_was_submitted_and_it_is_waiting_for_review":
            MessageLookupByLibrary.simpleMessage(
                "Ваша заявка была отправлена   и ожидает рассмотрения."),
        "your_submission_is_fully_rejected":
            MessageLookupByLibrary.simpleMessage(
                "Ваша заявка полностью отклонена"),
        "your_submission_is_under_review": MessageLookupByLibrary.simpleMessage(
            "Ваша заявка находится на рассмотрении")
      };
}
