Feature: Manage Access
  In order to 
  As a
  I want to

  Scenario: Allow all by default
    When I go to /allow_all_by_default
    Then I should be authorized

  Scenario: Explicitly allow all
    When I go to /explicitly_allow_all
    Then I should be authorized

  Scenario: Unauthorized when explicitly denying all
    When I go to /deny_all
    Then I should not be authorized

  Scenario: Authorized when the user is allowed
    Given I am Nancy
    When I go to /allowed_user
    Then I should be authorized

  Scenario: Unauthorized when the user is not allowed
    Given I am Jackie Boy
    When I go to /allowed_user
    Then I should not be authorized

  Scenario: Authorized when the user belongs to the allowed rule
    Given I have the role admin
    When I go to /allowed_role
    Then I should be authorized

  Scenario: Unauthorized when the user does not belong to the rule
    Given I have the role not_admin
    When I go to /allowed_role
    Then I should not be authorized

  Scenario: Authorized when the user does not belong to the denied role
    When I go to /denied_role
    Then I should be authorized

  Scenario: Unauthorized when the user belongs to the denied role
    Given I have the role troll
    When I go to /denied_role
    Then I should not be authorized

  Scenario: Authorized when the user belongs to an allowed role
    Given I have the role admin
    When I go to /allowed_and_denied_roles
    Then I should be authorized

  Scenario: Unauthorized when the user belongs to the denied role
    Given I have the role troll
    When I go to /allowed_and_denied_roles
    Then I should not be authorized

  Scenario: Unauthorized when the user does not belong to the role
     Given I have no roles
     When I go to /allowed_role_with_only/show
     Then I should not be authorized

  Scenario: Authorized when he user belongs to the role
    Given I have the role admin
    When I go to /allowed_role_with_only/show
    Then I should be authorized
    Given I have no roles
    When I go to /allowed_role_with_only
    Then I should be authorized

  Scenario: Authorized when the rule does not apply to the action
    Given I have the role admin
    When I go to /allowed_role_with_only
    Then I should be authorized

  Scenario: Unauthorized when the host is not explicitly allowed
    When I go to /access_control_by_host
    Then I should not be authorized

  Scenario: Unauthorized when authorizing via role and there is not acurrent user
    When There is no current user
    And  I go to /allowed_role
    Then I should not be authorized


  Scenario: View Helpers - Allow
    Given I have the role admin
    When I go to /view_helpers/allow_via_role
    Then I should see "Allowed"
    Given I have no roles
    When I go to /view_helpers/allow_via_role
    Then I should not see "Allowed"

  Scenario: View Helpers - Deny
    Given I have no roles
    When I go to /view_helpers/deny_via_role
    Then I should see "Allowed"
    Given I have the role troll
    When I go to /view_helpers/deny_via_role
    Then I should not see "Allowed"
