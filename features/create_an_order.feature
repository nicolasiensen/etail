Feature: create an order
  In order to sync with dashboard
  As an API
  I want to create an order

  Scenario: when the order is valid
    Given there is a store
    When I create an order uid "1" for this store
    Then an order with uid "1" should be created
