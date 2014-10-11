Feature: User logout
  In order to continue with other things in my life
  As a user
  I need to be able to logout

  Background:
    Given I am on "/login"
    And I fill in "Username" with "visitor1"
    And I fill in "Password" with "pass123"
    And I press "Sign in"

  Scenario: User wants to logout
    Given I am on "/"
    And I click "Logout"
    Then I should see "Sign in"
    And I should be on "/"

