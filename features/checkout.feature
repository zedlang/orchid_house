Feature: A user can pay for their order at a checkout

@checkout
  Scenario: A user goes to the checkout
    Given they are on the order page
     When they go to the checkout page
     Then they see details of how to pay
