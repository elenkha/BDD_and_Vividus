Description: Simple story to check the Wlamart.com;

Scenario: Create account
Given I am on a page with the URL 'https://www.walmart.com/account/login?tid=0'
When I click on element located `By.xpath(//div/button[contains(text(),"Create account")])`
When I enter `Alena` in field located `By.xpath(//input[@id="first-name-su"])`
When I enter `Yazerskaya` in field located `By.xpath(//input[@id="last-name-su"])`
When I enter `elenkha#{randomInt(1000, 9999)}@gmail.com` in field located `By.xpath(//input[@id="email-su"])`
When I enter `q1w2e3R$` in field located `By.xpath(//input[@id="password-su"])`
When I click on element located `By.xpath(//form[@id="sign-up-form"]/button[contains(text(),"Create account")])`
When I wait until state of element located `By.xpath(//input[@id="global-search-input"])` is VISIBLE
Then field located `By.xpath(//input[@id="global-search-input"])` exists

Scenario: Perform search for product by search box
Given I am on the main application page
When I enter `apple watch series 6 40mm white` in field located `By.xpath(//input[@id="global-search-input"])`
When I click on element located `By.xpath(//button[@id="global-search-submit"])`
When I wait until state of element located `By.xpath(//div[@id="searchProductResult"]/ul/li[1])` is VISIBLE
When I get the URL path and set it to the story variable '${searchResultsURL}'
Then field located `By.xpath(//div[@id="searchProductResult"]/ul/li[1])` exists

Scenario: Open product page
!--|Given I am on a page with the URL 'https://walmart.com${searchResultsURL}'
Given I am on the main application page
When I click on element located `By.xpath(//div[@id="searchProductResult"]/ul/li[1]/div/div[2]/div[2]/a)`
When I wait until state of element located `By.xpath(//span[contains(text(),"Add to cart")])` is VISIBLE
When I get the URL path and set it to the story variable '${productPageURL}'
Then field located `By.xpath(//span[contains(text(),"Add to cart")])` exists

Scenario: Add product to cart
!--|Given I am on a page with the URL 'https://walmart.com${productPageURL}'
Given I am on the main application page
When I wait until state of element located `By.xpath(//span[contains(text(),"Add to cart")])` is VISIBLE
When I click on element located `By.xpath(//span[contains(text(),"Add to cart")])`
When I wait until state of element located `By.xpath(//span[contains(text()[2],"You just added 1 item")])` is VISIBLE
Then field located `By.xpath(//span[contains(text()[2],"You just added 1 item")])` exists

Scenario: Navigate to cart
!--|Given I am on a page with the URL 'https://www.walmart.com/'
Given I am on the main application page
When I click on element located `By.xpath(//a[@id="hf-cart"])`
Then field located `By.xpath(//h1[@id="cart-active-cart-heading" and contains(@aria-label,"1 item")])` exists
