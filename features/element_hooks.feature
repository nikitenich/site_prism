Feature: Element hooks

  Background:
    Given I navigate to the appearing page

  Scenario: Initially invisible element visible and interactable by before hook
    Then I should see hidden text by before hook

  Scenario: Check after element hook
    Then I should receive transformed text instead of element