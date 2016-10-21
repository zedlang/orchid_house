Feature: A user can place their order

  Scenario: A user must be signed in to place an order
    Given they are on the basket page
     When they try to place an order
      And they are not signed in
     Then they are directed to the Sign In page

@view_order
  Scenario: A user can review an order
    Given they are on the basket page
     When they go to the order page
     Then they see details of the order