// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/the_list_of_customers_is_retrieved_from_the_supabase_database.dart';
import './step/the_customers_information_should_be_displayed_in_a_table.dart';
import './step/a_user_is_on_the_main_page.dart';
import './step/the_user_clicks_the_add_button.dart';
import './step/a_dialog_should_appear_with_fields_to_enter_the_new_customers_information.dart';
import './step/the_user_should_be_able_to_submit_the_new_customers_information.dart';
import './step/the_new_customer_should_be_added_to_the_supabase_database.dart';
import './step/a_success_message_should_be_displayed.dart';
import './step/the_user_clicks_the_edit_button_next_to_a_customer_in_the_table.dart';
import './step/a_dialog_should_appear_with_the_customers_current_information_prefilled_in_the_fields.dart';
import './step/the_user_should_be_able_to_edit_the_customers_information.dart';
import './step/the_updated_customer_should_be_saved_to_the_supabase_database.dart';
import './step/the_user_clicks_the_delete_button_next_to_a_customer_in_the_table.dart';
import './step/a_confirmation_dialog_should_appear.dart';
import './step/if_the_user_confirms_the_customer_should_be_deleted_from_the_supabase_database.dart';

void main() {
  group('''Feature: Display and manage customer data''', () {
    testWidgets('''Initialize App''', (tester) async {
      await theAppIsRunning(tester);
      await theListOfCustomersIsRetrievedFromTheSupabaseDatabase(tester);
      await theCustomersInformationShouldBeDisplayedInATable(tester);
    });
    testWidgets('''Add a new customer''', (tester) async {
      await aUserIsOnTheMainPage(tester);
      await theUserClicksTheAddButton(tester);
      await aDialogShouldAppearWithFieldsToEnterTheNewCustomersInformation(tester);
      await theUserShouldBeAbleToSubmitTheNewCustomersInformation(tester);
      await theNewCustomerShouldBeAddedToTheSupabaseDatabase(tester);
      await aSuccessMessageShouldBeDisplayed(tester);
    });
    testWidgets('''Edit an existing customer''', (tester) async {
      await aUserIsOnTheMainPage(tester);
      await theUserClicksTheEditButtonNextToACustomerInTheTable(tester);
      await aDialogShouldAppearWithTheCustomersCurrentInformationPrefilledInTheFields(tester);
      await theUserShouldBeAbleToEditTheCustomersInformation(tester);
      await theUpdatedCustomerShouldBeSavedToTheSupabaseDatabase(tester);
      await aSuccessMessageShouldBeDisplayed(tester);
    });
    testWidgets('''Delete an existing customer''', (tester) async {
      await aUserIsOnTheMainPage(tester);
      await theUserClicksTheDeleteButtonNextToACustomerInTheTable(tester);
      await aConfirmationDialogShouldAppear(tester);
      await ifTheUserConfirmsTheCustomerShouldBeDeletedFromTheSupabaseDatabase(tester);
      await aSuccessMessageShouldBeDisplayed(tester);
    });
  });
}
