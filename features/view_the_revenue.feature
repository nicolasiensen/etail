Feature: view the revenue
  In order to take better decisions
  As a store admin
  I want to view the revenue

  Scenario: when there is at least one order
    Given there is a store
    And there is an order for this store
    When I go to "the orders page of this store"
    Then I should see "this order"
