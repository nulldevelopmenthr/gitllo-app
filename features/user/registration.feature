Feature: Registration
  In order to use site
  As a user
  I need to register

  Scenario: From homepage I go to registration
    Given I am on "/"
    And I click "Join"
    Then I should see "Sign up!"
    And I should be on "/register/"

  Scenario: Check that registration works
    Given there is no user on site with username "newuser1"
    And I am on "/register/"
    And I fill in "Username" with "newuser1"
    And I fill in "Email" with "testing+newuser1@nulldevelopment.hr"
    And I fill in "Password" with "test"
    And I fill in "Verification" with "test"
    And I press "Sign up"
    Then url is "/register/confirmed"
    And I should see "Logged in as newuser1"
    And I should see "The user has been created successfully"
    And I should see "Congrats newuser1, your account is now activated."

  Scenario: Check that new user cant register with existing email
    Given there is no user on site with username "visitor51exists"
    And I am on "/register/"
    And I fill in "Username" with "visitor51exists"
    And I fill in "Email" with "testing+visitor1@nulldevelopment.hr"
    And I fill in "Password" with "pass123"
    And I fill in "Verification" with "pass123"
    And I press "Sign up"
    Then I should see "The email is already used"
    And I should be on "/register/"

  Scenario: Check that new user cant register with existing username
    Given there is a user with username "visitor1"
    And I am on "/register/"
    And I fill in "Username" with "visitor1"
    And I fill in "Email" with "testing+visitor1newemail@nulldevelopment.hr"
    And I fill in "Password" with "pass123"
    And I fill in "Verification" with "pass123"
    And I press "Sign up"
    Then I should see "The username is already used"
    And I should be on "/register/"

  Scenario: Check that user passwords must match
    Given there is no user on site with username "visitor52"
    And I am on "/register/"
    And I fill in "Username" with "visitor52"
    And I fill in "Email" with "testing+visitor52@nulldevelopment.hr"
    And I fill in "Password" with "pass123"
    And I fill in "Verification" with "notExpectedPassword"
    And I press "Sign up"
    Then I should see "The entered passwords don't match"
    And I should be on "/register/"
