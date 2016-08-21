Feature: A user wishes to view an individual product

  Scenario: A user views a product
    Given products exist
     When they visit the products page
      And they click on a product's link
     Then they see the product's details