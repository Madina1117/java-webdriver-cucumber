@predefined
Feature: Smoke steps

  @predefined1
  Scenario: Complete the search in Google
    Given I open url "https://google.com"
    Then I should see page title as "Google"
    Then element with xpath "//input[@name='q']" should be present
    When I type "Behavior Driven Development" into element with xpath "//input[@name='q']"
    Then I click on element using JavaScript with xpath "(//input[@name='btnK'])[1]"
    Then I wait for element with xpath "//*[@id='res']" to be present
    Then element with xpath "//*[@id='res']" should contain text "Cucumber"

  @predefined2
  Scenario: Complete the search in Yahoo
    Given I open url "https://yahoo.com"
    Then I should see page title contains "Yahoo"
    Then element with xpath "//*[@id='ybar-sbq']" should be present
    When I type "Behavior Driven Development" into element with xpath "//*[@id='ybar-sbq']"
    Then I click on element using JavaScript with xpath "//*[@id='ybar-search']"
    Then I wait for element with xpath "//*[@id='web']" to be present
    Then element with xpath "//*[@id='web']" should contain text "Cucumber"
    
  @predefined3
  Scenario: Complete the search in Bing
    Given I open url "https://bing.com"
    Then I should see page title as "Bing"
    Then element with xpath "//*[@name='q']" should be present
    When I type "Behavior Driven Development" into element with xpath "//*[@name='q']"
    Then I click on element using JavaScript with xpath "//*[@id='search_icon']"
    Then I wait for element with xpath "//*[@id='b_results']" to be present
    Then element with xpath "//*[@id='b_results']" should contain text "Cucumber"

  @predefined4
  Scenario: Complete the search in Gibiru
    Given I open url "https://gibiru.com"
    Then I should see page title contains "Gibiru"
    Then element with xpath "//*[@id='q']" should be present
    When I type "Behavior Driven Development" into element with xpath "//*[@id='q']"
    Then I click on element using JavaScript with xpath "//*[@id='button-addon2']"
    Then I wait for element with xpath "//*[@id='web-results']" to be present
    Then element with xpath "//*[@id='web-results']" should contain text "Cucumber"

  @predefined5
  Scenario: Complete the search in DuckDuckGo
    Given I open url "https://duckduckgo.com"
    Then I should see page title contains "DuckDuckGo"
    Then element with xpath "//*[@id='search_form_input_homepage']" should be present
    When I type "Behavior Driven Development" into element with xpath "//*[@id='search_form_input_homepage']"
    Then I click on element using JavaScript with xpath "//*[@id='search_button_homepage']"
    Then I wait for element with xpath "//*[@class='results--main']" to be present
    Then element with xpath "//*[@class='results--main']" should contain text "Cucumber"



  @predefined200
  Scenario: Check if google search for PCS will return online class website on the first page.
    Given I open url "https://google.com"
    Then I should see page title as "Google"
    Then element with xpath "//input[@name='q']" should be present
    When I type "Portnov Computer School" into element with xpath "//input[@name='q']"
    Then I click on element with xpath "(//input[@name='btnK'])[2]"
    Then I wait for element with xpath "//*[@id='res']" to be present
    Then element with xpath "//*[@id='res']//a[@href='https://portnov.net/']" should be present