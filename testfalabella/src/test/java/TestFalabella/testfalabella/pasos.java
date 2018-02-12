package TestFalabella.testfalabella; 

import org.openqa.selenium.By; 
import org.openqa.selenium.WebDriver; 
import org.openqa.selenium.firefox.FirefoxDriver; 

import cucumber.annotation.en.Given; 
import cucumber.annotation.en.Then; 
import cucumber.annotation.en.When; 

public class pasos { 
   WebDriver driver = null; 
	
   @Given("^user navigates to Google$") 
   public void goToGoogle() { 
      driver = new FirefoxDriver(); 
      driver.navigate().to("https://www.google.com/"); 
   } 
	
   @When("^I enter  as \"([^\"]*)\" ") 
   public void I_enter_Busqueda_as(String arg1) {
      driver.findElement(By.id("sb_ifc0")).sendKeys(arg1);
     
   } 
	
   @Then("^Shearch should be successful$") 
   public void validateRelogin() { 
      if(driver.getCurrentUrl().equalsIgnoreCase(
      "https://www.falabella.com/falabella-cl/")){
         System.out.println("Test Pass"); 
      } else { 
         System.out.println("Test Failed"); 
      } 
      driver.close(); 
   }    
}