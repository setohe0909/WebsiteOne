@javascript @vcr
Feature: Editing an event with start date in the past
  As a site user
  In order to be able to update existing activities
  I would like to edit event details

  Background:
    Given the date is "2016/02/01 09:15:00 UTC"
    And I am logged in
    And I am on Events index page
    When I click "New Event"
    And I select "Repeats" to "weekly"
    And I check "Monday"
    And I check "Thursday"
    Given I fill in event field:
      | name        | value         |
      | Name        | Daily Standup |
      | Start Date  | 2014-02-04    |
      | Start Time  | 09:00         |
      | Description | we stand up   |
      | End Date    | 2016-03-04    |
    Then the event is set to end sometime
    And I click on the "repeat_ends_on" div
    And I click the "Save" button
    And I am on Events index page

  Scenario: Check that edit page reflects initial settings
    And I visit the edit page for the event named "Daily Standup"
    Then the "Repeat ends" selector should be set to "on"

  Scenario: Edit an existing event to never end
    And I visit the edit page for the event named "Daily Standup"
    And I select "Repeat ends" to "never"
    And I click the "Save" button
    Then I should be on the event "Show" page for "Daily Standup"
    And I should see "09:00-09:30 (UTC)"
    And I visit the edit page for the event named "Daily Standup"
    Then the "Repeat ends" selector should be set to "never"

  Scenario: User in non-UTC timezone edits and overrides the timezone of an existing event, and has no side-effects for user in UTC timezone
    Given an existing event
    And the user is in "US/Hawaii"
    Then the user should see the date and time adjusted for their timezone in the edit form
    And I select "Japan" from the time zone dropdown
    And they save without making any changes
    When the user is in "Etc/UTC"
    Then the user should see the date and time adjusted for their timezone and updated by 19 hours in the edit form

  Scenario: Edit an existing event to be in a different time zone
    And I visit the edit page for the event named "Daily Standup"
    And I select "Hawaii" from the time zone dropdown
    And I click the "Save" button
    Then I should be on the event "Show" page for "Daily Standup"
    And I should see "19:00-19:30 (UTC)"
    And I visit the edit page for the event named "Daily Standup"
    Then the start time is "07:00 PM"

  Scenario: User in non-UTC timezone edits but makes no changes to an existing event, and has no side-effects for user in UTC timezone
    Given an existing event
    And the user is in "US/Hawaii"
    Then the user should see the date and time adjusted for their timezone in the edit form
    And they save without making any changes
    When the user is in "Etc/UTC"
    Then the user should see the date and time adjusted for their timezone in the edit form

  Scenario: User in non-UTC timezone saves an existing event with no changes, during daylight savings
    Given daylight savings are in effect now
    And the user is in "Europe/London"
    And edits an event with start date in standard time
    When they save without making any changes
    Then the event date and time should be unchanged

  Scenario: User in UTC timezone edits an existing event, with no changes, that repeats but with end date in the past
    Given it is now past the end date for the event
    And the user is in "UTC"
    And they edit and save the event without making any changes
    Then the event date and time should be unchanged

  Scenario: User in non-UTC timezone edits an existing event, with no changes, and daylight savings involved, that repeats but with end date in past
    Given daylight savings are in effect and it is now past the end date for the event
    And the user is in "Europe/London"
    And edits an event with start date in standard time
    When they save without making any changes
    Then the event date and time should be unchanged