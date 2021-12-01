@testcase
Feature: TestCases Day3 lab

  @testcase1
  Scenario: Validate responsive UI behavior
    Given I open url "https://skryabin.com/market/quote.html"
    And I maximize window
    Then I wait for element with xpath "//b[@id='location']" to be present
    And I resize window to 400 and 800
    Then element with xpath "//b[@id='location']" should not be displayed
    And I resize window to 1200 and 800
    Then element with xpath "//b[@id='location']" should be displayed

  @testcase2
  Scenario: Validate minimal “Username” field length requirement
  as 2 characters
    Given I open url "https://skryabin.com/market/quote.html"
    Then I wait for element with xpath "//b[@id='location']" to be present
    When I type "a" into element with xpath "//input[@name='username']"
    And I click on element using JavaScript with xpath "//button[@id='formSubmit']"
    Then element with xpath "//label[@id='username-error']" should contain text "2 char"
    When I type "b" into element with xpath "//input[@name='username']"
    Then element with xpath "//label[@id='username-error']" should not be displayed
    And I clear element with xpath "//input[@name='username']"

  @testcase3
  Scenario Outline: Validate “Email” field behavior:
  validate that email field accepts only valid email
    Given I open url <url>
    Then I should see page title as <title>
    Then I wait for element with xpath <emailTextFieldXPath> to be present
    When I type <invalidEmail1> into element with xpath <emailTextFieldXPath>
    And I click on element with xpath <submitButtonXPath>
    Then element with xpath <labelEmailErrorXPath> should contain text <emailErrorText>
    Then I clear element with xpath <emailTextFieldXPath>
    When I type <invalidEmail2> into element with xpath <emailTextFieldXPath>
    And I click on element with xpath <submitButtonXPath>
    Then element with xpath <labelEmailErrorXPath> should contain text <emailErrorText>
    Then I clear element with xpath <emailTextFieldXPath>
    When I type <invalidEmail3> into element with xpath <emailTextFieldXPath>
    And I click on element with xpath <submitButtonXPath>
    Then element with xpath <labelEmailErrorXPath> should contain text <emailErrorText>
    Then I clear element with xpath <emailTextFieldXPath>
    When I type <validEmail> into element with xpath <emailTextFieldXPath>
    And I click on element with xpath <submitButtonXPath>
    Then element with xpath <labelEmailErrorXPath> should have attribute <attributeOfEmailErrorLabel> as <attributeValueOfEmailErrorLabel>
    Then I clear element with xpath <emailTextFieldXPath>
    Examples:
      | url                                      | title         | emailTextFieldXPath      | invalidEmail1 | submitButtonXPath          | labelEmailErrorXPath         | emailErrorText                        | invalidEmail2 | invalidEmail3 | validEmail | attributeOfEmailErrorLabel | attributeValueOfEmailErrorLabel |
      | "https://skryabin.com/market/quote.html" | "Get a Quote" | "//input[@name='email']" | "t"           | "//button[@type='submit']" | "//label[@id='email-error']" | "Please enter a valid email address." | "@"           | "t@"          | "t@t"      | "style"                    | "display: none;"                |

  @testcase3_1
  Scenario Outline: Validate “Email” field behavior:
  validate that invalid email field didn't accept
    Given I open url "https://skryabin.com/market/quote.html"
    Then I should see page title as "Get a Quote"
    Then I wait for element with xpath "//input[@name='email']" to be present
    Then I clear element with xpath "//input[@name='email']"
    When I type "<invalidEmail>" into element with xpath "//input[@name='email']"
    And I click on element with xpath "//button[@type='submit']"
    Then element with xpath "//label[@id='email-error']" should be displayed
    And element with xpath "//label[@id='email-error']" should contain text "<emailErrorText>"
    Then I clear element with xpath "//input[@name='email']"
    Examples:
      | invalidEmail | emailErrorText                      |
      | t            | Please enter a valid email address. |
      | @            | Please enter a valid email address. |
      | t@           | Please enter a valid email address. |

  @testcase3_2
  Scenario Outline: Validate “Email” field behavior:
  validate a valid email field accepts and element 'email-error' doesn't present when invalid email was never entered and submit button was never clicked before entering valid email.
    Given I open url "https://skryabin.com/market/quote.html"
    Then I should see page title as "Get a Quote"
    Then I wait for element with xpath "//input[@name='email']" to be present
    Then I clear element with xpath "//input[@name='email']"
    When I type "<validEmail>" into element with xpath "//input[@name='email']"
    And I click on element with xpath "//button[@type='submit']"
    Then element with xpath "//label[@id='email-error']" should not be present
    Examples:
      | validEmail |
      | t@t        |

  @testcase3_3
  Scenario Outline: Validate “Email” field behavior:
  validate a valid email field accepts and 'email-error' label present but not displayed if invalid email was entered before valid email
    Given I open url "https://skryabin.com/market/quote.html"
    Then I should see page title as "Get a Quote"
    Then I wait for element with xpath "//input[@name='email']" to be present
    Then I clear element with xpath "//input[@name='email']"
    When I type '<invalidEmail>' into element with xpath "//input[@name='email']"
    #Then I click to other part of the page - in our case - Password text field
    Then I click on element with xpath "//input[@name='password']"
    Then element with xpath "//label[@id='email-error']" should be displayed
    And element with xpath "//label[@id='email-error']" should have text as "<emailErrorText>"
    Then I clear element with xpath "//input[@name='email']"
    When I type "<validEmail>" into element with xpath "//input[@name='email']"
    And I click on element with xpath "//button[@type='submit']"
    Then element with xpath "//label[@id='email-error']" should not be displayed
    Then I clear element with xpath "//input[@name='email']"
    Examples:
      | invalidEmail | validEmail | emailErrorText                      |
      | @            | t@t        | Please enter a valid email address. |

  @testcase3_4
  Scenario Outline: Validate “Email” field behavior:
  validate a valid email field accepts and 'email-error' label to be present but not displayed if submit button was clicked before entering valid email;
    Given I open url "https://skryabin.com/market/quote.html"
    Then I should see page title as "Get a Quote"
    Then I wait for element with xpath "//input[@name='email']" to be present
    And element with xpath "//label[@id='email-error']" should not be present
    Then I click on element with xpath "//button[@type='submit']"
    And element with xpath "//label[@id='email-error']" should be displayed
    And element with xpath "//label[@id='email-error']" should contain text "<emailErrorText>"
    Then I clear element with xpath "//input[@name='email']"
    When I type "<validEmail>" into element with xpath "//input[@name='email']"
    And I click on element with xpath "//button[@type='submit']"
    And element with xpath "//label[@id='email-error']" should not be displayed
    Then I clear element with xpath "//input[@name='email']"
    Examples:
      | validEmail | emailErrorText          |
      | t@t        | This field is required. |

  @testcase4
  Scenario: Fill out and validate “Password” set of fields
  Validate that Confirm Password is disabled if Password
  field is empty.
    Given I open url "https://skryabin.com/market/quote.html"
    And element with xpath "//input[@name='password']" should have attribute "value" as ""
    Then element with xpath "//input[@name='confirmPassword']" should be disabled
    When I type "p" into element with xpath "//input[@name='password']"
    And element with xpath "//input[@name='password']" should have attribute "value" as "p"
    And I click on element with xpath "//label[@for='password']"
    Then element with xpath "//input[@name='confirmPassword']" should be enabled
    When I clear element with xpath "//input[@name='password']"
    And  I click on element with xpath "//label[@for='password']"
    Then element with xpath "//input[@name='confirmPassword']" should be disabled

  @testcase5
  Scenario: Validate “Name” field behavior
  Modal dialog: verify that upon clicking inside of Name
  field popup dialog appears.
  Name concatenation: verify that after putting First
  Name, Middle Name, Last Name, it concatenates it
  correctly and puts the value in the Name field.
    Given I open url "https://skryabin.com/market/quote.html"
    And I wait for element with xpath "//input[@id='name']" to be present
    And element with xpath "//input[@id='name']" should have attribute "value" as ""
    When I click on element with xpath "//input[@id='name']"
    Then element with xpath "//div[contains(@class,'ui-dialog ui-widget')]" should be displayed
    When I click on element with xpath "//input[@id='firstName']"
    Then I type "Irina" into element with xpath "//input[@id='firstName']"
    Then I type "Aleksandrovna" into element with xpath "//input[@id='middleName']"
    Then I type "Gavrilova" into element with xpath "//input[@id='lastName']"
    Then I click on element with xpath "//span[@class='ui-button-text'][text()='Save']"
    Then element with xpath "//div[contains(@class,'ui-dialog ui-widget')]" should not be displayed
    Then element with xpath "//input[@id='name']" should have attribute "value" as "Irina Aleksandrovna Gavrilova"

  @testcase6
  Scenario: Validate that Accepting Privacy Policy is required to
  submit the form, then check the field.
    Given I open url "https://skryabin.com/market/quote.html"
    And I wait for element with xpath "//input[@name='agreedToPrivacyPolicy']" to be present
    Then element with xpath "//label[contains(@class,'required')]/input" should be present
    And element with xpath "//input[@name='agreedToPrivacyPolicy']" should not be selected
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//label[@id='agreedToPrivacyPolicy-error'][contains(text(),'Must check!')]" to be present
    When I click on element using JavaScript with xpath "//input[@name='agreedToPrivacyPolicy'][contains(@class,'ng-untouched')]"
    Then element with xpath "//input[@name='agreedToPrivacyPolicy']" should be selected
    Then element with xpath "//label[@id='agreedToPrivacyPolicy-error']" should not be displayed

  @testcase7
  Scenario: Try entering the following non-required fields in the order:
  • Phone Number
  • Country of Origin
  • Gender
  • Allowed to Contact?
  • Address
  • Car Make
  • 3rd party agreement acceptance
  • Date of Birth
    Given I open url "https://skryabin.com/market/quote.html"
    Then I maximize window
    Then I type "512111111" into element with xpath "//input[@name='phone']"
    When I click on element with xpath "//select[@name='countryOfOrigin']/option[@value='Russia']"
    Then element with xpath "//select[@name='countryOfOrigin']" should have attribute "value" as "Russia"
    Then I click on element with xpath "//input[@name='gender'][@value='female']"
    Then element with xpath "//input[@name='allowedToContact']" should not be selected
    Then I click on element with xpath "//input[@name='allowedToContact']"
    And element with xpath "//input[@name='allowedToContact']" should be selected
    When I type "here is my address" into element with xpath "//textarea[@id='address']"
    Then I click on element with xpath "//select[@name='carMake']/option[@value='Other']"
    Then I click on element with xpath "//button[@id='thirdPartyButton']"
    Then I accept alert
    And element with xpath "//span[@id='thirdPartyResponseMessage']" should be displayed
    Then I click on element with xpath "//input[@id='dateOfBirth']"
    Then I click on element with xpath "//select[@class='ui-datepicker-month']/option[contains(text(),'Jan')]"
    Then I click on element with xpath "//select[@class='ui-datepicker-year']/option[@value='2000']"
    Then I click on element with xpath "(//td[@data-handler='selectDay']/a)[25]"
    #Then I type "01/25/2000" into element with emailTextFieldXPath "//input[@id='dateOfBirth']"
    Then element with xpath "//input[@id='dateOfBirth']" should have attribute "value" as "01/25/2000"
    Then I click on element with xpath "//button[@type='submit']"

  @testcase8
  Scenario: Submit the form and verify the data.
  Validate that after form submission entered fields
  values are present on the page.
  Validate that password is not displayed on the page.
    Given I open url "https://skryabin.com/market/quote.html"
    Then I should see page title as "Get a Quote"
    #Name field
    When I click on element with xpath "//input[@id='name']"
    Then element with xpath "//div[contains(@class,'ui-dialog ui-widget')]" should be displayed
    When I click on element with xpath "//input[@id='firstName']"
    Then I type "Irina" into element with xpath "//input[@id='firstName']"
    Then I type "Aleksandrovna" into element with xpath "//input[@id='middleName']"
    Then I type "Gavrilova" into element with xpath "//input[@id='lastName']"
    Then I click on element with xpath "//span[@class='ui-button-text'][text()='Save']"
    Then element with xpath "//div[contains(@class,'ui-dialog ui-widget')]" should not be displayed
    Then element with xpath "//input[@id='name']" should have attribute "value" as "Irina Aleksandrovna Gavrilova"
    #Username field
    Then I type "gavrilova.irina" into element with xpath "//input[@name='username']"
    #Email field
    Then I type "passioninsoftwaretesting@gmail.com" into element with xpath "//input[@name='email']"
    #password and confirmPassword fields
    Then I type "p1234" into element with xpath "//input[@name='password']"
    Then I type "p1234" into element with xpath "//input[@name='confirmPassword']"
    #checkbox "agreedToPrivacyPolicy"
    When I click on element with xpath "//input[@name='agreedToPrivacyPolicy']"
    Then element with xpath "//input[@name='agreedToPrivacyPolicy']" should be selected
    When I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//legend[@class='applicationResult'][text()='Submitted Application']" to be present
    #verify name
    Then element with xpath "//b[@name='name']" should have text as "Irina Aleksandrovna Gavrilova"
    And element with xpath "//b[@name='firstName']" should have text as "Irina"
    And element with xpath "//b[@name='middleName']" should have text as "Aleksandrovna"
    And element with xpath "//b[@name='lastName']" should have text as "Gavrilova"
    #verify username
    Then element with xpath "//b[@name='username']" should have text as "gavrilova.irina"
    #verify invalidEmail
    Then element with xpath "//b[@name='email']" should have text as "passioninsoftwaretesting@gmail.com"
    #verify password is not displayed
    Then element with xpath "//b[@name='password']" should have text as "[entered]"
    #verify agreed to Privacy Policy
    Then element with xpath "//b[@name='agreedToPrivacyPolicy']" should have text as "true"



