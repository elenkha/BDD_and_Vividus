Description: Simple story to check the page availability;

Scenario: Open application under test
Given I am on the main application page

Scenario: Verify page title
Then the page title contains 'reddit:'

Scenario: Open registration page
When I click on element located `By.xpath(//a[@role='button' and contains(text(),'Sign Up')])`
When I switch to frame located `By.xpath(//div[@id='POPUP_CONTAINER']/..//iframe)`
When I enter `1234@qwe.com` in field located `By.xpath(//input[@id='regEmail'])`
When I wait until state of element located `By.xpath(//fieldset[contains(@class,'m-valid')])` is VISIBLE
When I click on element located `By.xpath(//button[contains(text(),'Continue')])`
When I enter `elenkha1234` in field located `By.xpath(//input[@id='regUsername'])`
When I enter `q1w2e3r4!@#` in field located `By.xpath(//input[@id='regPassword'])`
When I wait until state of element located `//div[@class="recaptcha-checkbox-spinner"]` is VISIBLE
When I click on element located `By.xpath(//div[@class="recaptcha-checkbox-spinner"])`
When I wait until state of element located `By.xpath(//div[@class="recaptcha-checkbox-checkmark"])` is VISIBLE
When I click on element located `By.xpath(//button[contains(text(),'Sign Up')])`
