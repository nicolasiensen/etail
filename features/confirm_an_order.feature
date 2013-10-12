Feature: confirm an order
  In order to make the revenue based on confirmed orders available
  As an API
  I want to confirm an order

  Scenario: when the order exists
    Given there is an order
    When I confirm this order
    Then this order should be confirmed
