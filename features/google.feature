Feature: Google
  Scenario: Google it
    Given I am on the 'https://google.com'
    When fill in search with 'cucumber'
    Then I should see 'cucumber'
