Feature: A user views the Home, About, Contact and FAQ pages

Background: A user is on any of the app's pages
  Given they are on a random app page

  Scenario: A user views the Home page
    When they click on the Home link
    Then they are taken to the home page

  Scenario: A user views the About page
    When they click on the About link
    Then they are taken to the About page

  Scenario: A user views the Contact Us page
    When they click on the Contact Us link
    Then they are taken to the Contact Us page

  Scenario: A user views the FAQ page
    When they click on the FAQ link
    Then they are taken to the FAQ page