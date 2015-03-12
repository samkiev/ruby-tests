

Feature: An application is working



  Scenario: The application has a home page

    Given Web application is started on

    When I visit the home page

    Then I go to registration page

    Given I field Register Fields

    When I should be registered

    Then I logged out

    When I visit the home page

    And I go to registration page

    Given I repeate Registration procedure with new registration data

    And I should be registered

    But I logged out

    Given Login with "Login" and "Password"

    When I should be login

    Then I Change "New Password"

    And I should see message when my "New password" changed

    Given I Create new Project with "Project Name"

    When I should see message "New Project" Created

   # And Add "New user" into project
#
#    When I should see "New User" added into project
#
#    Then I should be changed "New user" Roles
#
#    And Verify what roles is change
#
    Given I Create new project version

    And I should see new project Version

    Given I Create "Bug" issue

    And I should see new "Bug" issue

    Given I Create "Feature" 2 issue

    And I should see new "Feature" issue

    Given I Create "Support"  issue

    And I should see new "Support" issue