Feature: Feature: Display and manage customer data
    Scenario: Initialize App
        Given the app is running
        When the list of customers is retrieved from the Supabase database
        Then the customers' information should be displayed in a table

    Scenario: Add a new customer
        Given a user is on the main page
        When the user clicks the "Add" button
        Then a dialog should appear with fields to enter the new customer's information
        And the user should be able to submit the new customer's information
        And the new customer should be added to the Supabase database
        And a success message should be displayed

    Scenario: Edit an existing customer
        Given a user is on the main page
        When the user clicks the "Edit" button next to a customer in the table
        Then a dialog should appear with the customer's current information pre-filled in the fields
        And the user should be able to edit the customer's information
        And the updated customer should be saved to the Supabase database
        And a success message should be displayed

    Scenario: Delete an existing customer
        Given a user is on the main page
        When the user clicks the "Delete" button next to a customer in the table
        Then a confirmation dialog should appear
        And if the user confirms, the customer should be deleted from the Supabase database
        And a success message should be displayed