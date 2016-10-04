Feature: A user wishes to view their account

  Scenario: A user sees a link to their account
    Given a user is signed in
     When they are on any page
     Then they see a My Account button

  Scenario: A user views their account details
    Given a user is signed in
     When they are on any page
      And they click the My Account button
     Then they see their account details
