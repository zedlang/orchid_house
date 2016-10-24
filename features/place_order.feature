Feature: A user can place their order

  Scenario: A user must be signed in to place an order
    Given they are on the basket page
     When they try to place an order
      And they are not signed in
     Then they are directed to the Sign In page

@view_order
  Scenario: A user can place an order
    Given they are on the basket page
     When they go to the order page
     Then they see details of the order

  Scenario: A user can't place an order if the basket is empty
     Given they are on the basket page
      When they go to the order page
       And they have an empty basket
      Then they stay on the basket page
       And they see a helpful message