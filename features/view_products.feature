Feature: A user wishes to view the products on offer

  Scenario: A user views the products
    Given products exist
    When they visit the products page
    Then they see a list of products