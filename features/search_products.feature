Feature: A user searches for a product

  Scenario: A user searches the products
    Given they are on any page
     When they enter a value into the Search field
     Then they see a list of products matching the search criteria

  Scenario: A user searches for a product that doesn't exist
    Given they are on any page
     When they enter a non-existent value into the Search field
     Then they see no results