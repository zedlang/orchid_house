Feature: A user wishes to view their basket

  Scenario: A user views their basket
    Given they are on any page
     When they click the Basket link
     Then they see the basket's contents
     
@view_basket
  Scenario: The number of items in the basket is visible from all pages
    Given they are on any page
     Then they see the number of items in the basket