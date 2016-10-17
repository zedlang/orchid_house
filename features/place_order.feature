Feature: A user can place their order

@view_order
  Scenario: A user can review an order
    Given they are on the basket page
     When they go to the order page
     Then they see details of the order
