@predefinedSearch
Feature: Verify search results in various engines

  @predefinedSearch1
  Scenario: Complete the search in Google
    Given I go to "Google" page
    Then I should see page title as "Google"
    Then element with xpath "//input[@name='q']" should be present
    When I type "Behavior Driven Development" into element with xpath "//input[@name='q']"
    Then I click on element with xpath "(//input[@name='btnK'])[2]"
    Then I wait for element with xpath "//*[@id='res']" to be present
    Then element with xpath "//*[@id='res']" should contain text "Cucumber"

  @predefinedSearch2
  Scenario: Complete the search in Yahoo
    Given I go to "Yahoo" page
    Then I should see page title contains "Yahoo"
    Then element with xpath "//*[@id='ybar-sbq']" should be present
    When I type "Behavior Driven Development" into element with xpath "//*[@id='ybar-sbq']"
    Then I click on element with xpath "//*[@id='ybar-search']"
    Then I wait for element with xpath "//*[@id='web']" to be present
    Then element with xpath "//*[@id='web']" should contain text "Cucumber"

  @predefinedSearch3
  Scenario: Complete the search in Bing
    Given I go to "Bing" page
    Then I should see page title as "Bing"
    Then element with xpath "//*[@name='q']" should be present
    When I type "Behavior Driven Development" into element with xpath "//*[@name='q']"
    Then I click on element with xpath "//*[@id='search_icon']"
    Then I wait for element with xpath "//*[@id='b_results']" to be present
    Then element with xpath "//*[@id='b_results']" should contain text "Cucumber"

  @predefinedSearch4
  Scenario: Complete the search in Gibiru
    Given I go to "Gibiru" page
    Then I should see page title contains "Gibiru"
    Then element with xpath "//*[@id='q']" should be present
    When I type "Behavior Driven Development" into element with xpath "//*[@id='q']"
    Then I click on element with xpath "//*[@id='button-addon2']"
    Then I wait for element with xpath "//*[@class='gsc-resultsbox-visible']" to be present
    Then I wait for element with xpath "//*[@class='gsc-resultsbox-visible']//*[contains(text(),'cucumber')]" to be present

  @predefinedSearch5
  Scenario: Complete the search in DuckDuckGo
    Given I go to "DuckDuckGo" page
    Then I should see page title contains "DuckDuckGo"
    Then element with xpath "//*[@id='search_form_input_homepage']" should be present
    When I type "Behavior Driven Development" into element with xpath "//*[@id='search_form_input_homepage']"
    Then I click on element with xpath "//*[@id='search_button_homepage']"
    Then I wait for element with xpath "//*[@class='results--main']" to be present
    Then element with xpath "//*[@class='results--main']" should contain text "Cucumber"

  @predefinedSearch6
  Scenario: Complete the search in Swisscows
    Given I go to "Swisscows" page
    Then I should see page title contains "Swisscows"
    Then element with xpath "//*[@name='query']" should be present
    When I type "Behavior Driven Development" into element with xpath "//*[@name='query']"
    Then I click on element with xpath "//*[@class='search-submit']"
    Then I wait for element with xpath "//*[@class='web-results']" to be present
    Then element with xpath "//*[@class='web-results']" should contain text "Cucumber"

  @predefinedSearch7
  Scenario: Complete the search in Search Encrypt
    Given I go to "Search Encrypt" page
    Then I should see page title contains "Search Encrypt"
    Then element with xpath "//*[@class='search-bar__search']" should be present
    When I type "Behavior Driven Development" into element with xpath "//*[@class='search-bar__search']"
    Then I click on element with xpath "//*[@class='search-bar__submit']"
    Then I wait for element with xpath "//*[@class='serp__results container']" to be present
    Then I wait for element with xpath "//*[@class='serp__results container']//*[contains(text(),'cucumber')]" to be present

  @predefinedSearch8
  Scenario: Complete the search in Startpage
    Given I go to "Startpage" page
    Then I should see page title contains "Startpage"
    Then element with xpath "//*[@id='q']" should be present
    When I type "Behavior Driven Development" into element with xpath "//*[@id='q']"
    Then I click on element with xpath "//*[@class='search-form-home__button-desktop']"
    Then I wait for element with xpath "//*[@class='show-results']" to be present
    Then I wait for element with xpath "//*[@class='show-results']//*[contains(text(),'cucumber')]" to be present

  @predefinedSearch9
  Scenario: Complete the search in Yandex
    Given I go to "Yandex" page
    Then I should see page title as "Yandex"
    Then element with xpath "//*[@id='text']" should be present
    When I type "Behavior Driven Development" into element with xpath "//*[@id='text']"
    Then I click on element with xpath "//*[@class='search2__button']/button"
    Then I wait for element with xpath "//*[@id='search-result']" to be present
    Then element with xpath "//*[@id='search-result']" should contain text "Cucumber"

  @predefinedSearch10
  Scenario: Complete the search in Boardreader
    Given I go to "Boardreader" page
    Then I should see page title contains "Boardreader"
    Then element with xpath "//*[@id='title-query']" should be present
    When I type "Behavior Driven Development" into element with xpath "//*[@id='title-query']"
    Then I click on element with xpath "//*[@id='title-submit']"
    Then I wait for element with xpath "//ul[@class='mdl-list']//li" to be present
    Then element with xpath "//ul[@class='mdl-list']" should contain text "Cucumber"

  @predefinedSearch11
  Scenario: Complete the search in Ecosia
    Given I go to "Ecosia" page
    Then I should see page title contains "Ecosia"
    Then element with xpath "//*[@data-test-id='search-form-input']" should be present
    When I type "Behavior Driven Development" into element with xpath "//*[@data-test-id='search-form-input']"
    Then I click on element with xpath "//*[@data-test-id='search-form-submit']"
    Then I wait for element with xpath "//*[@class='mainline-results']" to be present
    Then element with xpath "//*[@class='mainline-results']" should contain text "Cucumber"