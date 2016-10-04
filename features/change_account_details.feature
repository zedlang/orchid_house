Feature: A user wishes to change their account details

Background: Changing details
  Given a user is signed in
    And they are viewing their account
   When they want to edit their account details
   Then they are on the edit registration page

  Scenario: A user changes their name
    Then they can change their name

  Scenario: A user changes their address
    Then they can change their address details

  Scenario: A user changes their email address
    Then they can change their email address