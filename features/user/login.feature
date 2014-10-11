Feature: Login
  In order to access data
  As a user
  I need to log in

  Scenario: Check that login works for superadmin
    Given I am on "/login"
    And I fill in "Username" with "superadmin"
    And I fill in "Password" with "pass123"
    And I press "Sign in"
    Then url is "/"

  Scenario: Check that login works for admin
    Given I am on "/login"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "pass123"
    And I press "Sign in"
    Then url is "/"

  Scenario: Check that login works for visitor
    Given I am on "/login"
    And I fill in "Username" with "visitor1"
    And I fill in "Password" with "pass123"
    And I press "Sign in"
    Then url is "/"

  Scenario: Check that disable user cannot login
    Given I am on "/login"
    And I fill in "Username" with "disabledUser1"
    And I fill in "Password" with "pass123"
    And I press "Sign in"
    Then url is "/login"
    And I should see "User account is disabled."


  Scenario: Check that user is unable to login with wrong username
    Given I am on "/login"
    And I fill in "Username" with "unknownUser"
    And I fill in "Password" with "pass123"
    And I press "Sign in"
    Then url is "/login"
    And I should see "Bad credentials."

  Scenario: Check that user is unable to login with wrong password
    Given I am on "/login"
    And I fill in "Username" with "superadmin"
    And I fill in "Password" with "wrong"
    And I press "Sign in"
    Then url is "/login"
    And I should see "Bad credentials."