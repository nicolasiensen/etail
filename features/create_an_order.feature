Feature: create an order
  In order to sync with dashboard
  As an API
  I want to create an order

  Scenario: when the order is valid
    When I create an order uid "1"
    Then an order with uid "1" should be created
