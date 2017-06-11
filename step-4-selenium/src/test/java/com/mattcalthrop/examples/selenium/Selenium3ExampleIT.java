package com.mattcalthrop.examples.selenium;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.*;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;

public class Selenium3ExampleIT {
    private static WebDriver driver;
    private static WebDriverWait wait;
    private static String startUrl;

    private Boolean result;

    @BeforeClass
    public static void beforeAll() {
        startUrl = "http://www.google.co.uk/";
        driver = new ChromeDriver();
        wait = new WebDriverWait(driver, 10);
    }

    @AfterClass
    public static void afterAll() {
        driver.close();
        driver.quit();
    }

    @Before
    public void beforeEach() {
        driver.get(startUrl);
    }

    @Test
    public void checkPageTitleOnInit() {
        assertEquals("Google", driver.getTitle());
    }

    @Test
    public void checkPageTitleAfterSearch() {
        WebElement searchField = driver.findElement(By.name("q"));
        searchField.sendKeys("Sausages!");
        searchField.submit();
        // Google's search is rendered dynamically with JavaScript, so wait for the page to load.
        result = wait.until(new ExpectedCondition<Boolean>() {
            public Boolean apply(WebDriver driver) {
                return driver.getTitle().toLowerCase().startsWith("sausages!");
            }
        });
        assertTrue(result);
    }

}
