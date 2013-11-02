Feature: create an order
  In order to sync with dashboard
  As an API
  I want to create an order

  Scenario: when the order is valid
    Given there is a store
    When I create an order code "1" for this store
    Then an order with code "1" should be created
