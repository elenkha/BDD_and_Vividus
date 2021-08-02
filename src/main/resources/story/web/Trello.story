Description: Simple story to check the trello.com;
Lifecycle:
Examples:
|firstName                  |email                             |boardName                               |
|#{generate(Name.firstName)}|#{generate(Internet.emailAddress)}|#{generate(regexify '[a-z]{5}[A-Z]{2}')}|
|#{generate(Name.firstName)}|#{generate(Internet.emailAddress)}|#{generate(regexify '[a-z]{5}[A-Z]{2}')}|

Scenario: Create board
Given I am on a page with the URL 'https://trello.com/signup'
When I wait until state of element located `By.xpath(//input[@id="email"])` is VISIBLE
When I enter `<email>` in field located `By.xpath(//input[@id="email"])`
When I wait until state of element located `By.xpath(//input[@id="signup-submit"])` is VISIBLE
When I click on element located `By.xpath(//input[@id="signup-submit"])`
When I wait until state of element located `By.xpath(//input[@id="displayName"])` is VISIBLE
When I enter `<firstName>` in field located `By.xpath(//input[@id="displayName"])`
When I wait until state of element located `By.xpath(//button[@id="signup-submit"])` is VISIBLE
When I click on element located `By.xpath(//button[@id="signup-submit"])`
When I wait until state of element located `By.xpath(//div[@id="banners"])` is VISIBLE
Then field located `By.xpath(//div[@id="banners"]//li[contains(text(),"<email>")])` exists

Scenario: Create board
Given I am on a page with the URL 'https://trello.com/app-key'
When I wait until state of element located `By.xpath(//input[@id="accept-developer-agreement"])` is VISIBLE
When I click on element located `By.xpath(//input[@id="accept-developer-agreement"])`
When I click on element located `By.xpath(//button[contains(@class,"js-generate-api-key")])`
When I wait until state of element located `By.xpath(//input[@id="key"])` is VISIBLE
When I save `value` attribute value of element located `By.xpath(//input[@id="key"])` to SCENARIO variable `key`
When I save `href` attribute value of element located `By.xpath(//a[@data-track-direct-object="generate token link"])` to SCENARIO variable `tokenUrl`
When I open URL `${tokenUrl}` in new window
When I scroll context to BOTTOM edge
When I wait until state of element located `By.xpath(//input[@id="approveButton" and not(@disabled)])` is VISIBLE
When I click on element located `By.xpath(//input[@id="approveButton"])`
When I change context to element located `By.xpath(//div[@class="surface"]/div[@class="content"]/pre)`
When I save text of context element to SCENARIO variable `token`
When I close the current window
When I issue a HTTP POST request for a resource with the URL 'https://api.trello.com/1/boards/?key=44f43bbb1565b45823721eb4ac55c26b&token=89541b6722c9a43eacd5eb5866ee233475e03f01fcff81635abe34ddd997292a&name=<boardName>'
Then the response code is equal to '200'
Then the response body contains '<boardName>'
