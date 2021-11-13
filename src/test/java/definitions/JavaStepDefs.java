package definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;

public class JavaStepDefs {

    @Then("Show the greeting when I'm {string} {string} and my favorite color is {string}")
    public void showTheGreetingWhenIMAndMyFavoriteColorIs(String firstName, String lastName, String favoriteColor) {
        System.out.println("Hi, my name is " + firstName + " " + lastName + " and my favorite color is " + favoriteColor + "!");
    }

    @Then("I perform exercise on {string} and {string}")
    public void iPerformExerciseOnStringValueOneAndStringValueTwo(String stringValueOne, String stringValueTwo) {
        System.out.println("Value one: " + stringValueOne);
        System.out.println("Value two: " + stringValueTwo);
        System.out.println("Upper case one: " + stringValueOne.toUpperCase());
        System.out.println("Upper case two: " + stringValueTwo.toUpperCase());
        System.out.println("Length one: " + stringValueOne.length());
        System.out.println("Length two: " + stringValueTwo.length());
        System.out.println("Equal: " + stringValueOne.equals(stringValueTwo));
        System.out.println("Equal ignoring case: " + stringValueOne.equalsIgnoreCase(stringValueTwo));
        System.out.println("First contains second: " + stringValueOne.contains(stringValueTwo));
    }

    @Then("I perform exercise on {int} and {int}")
    public void iPerformExerciseOnNumberOneAndNumberTwo(int numberOne, int numberTwo) {
        System.out.println("Number one: " + numberOne);
        System.out.println("Number two: " + numberTwo);
        System.out.println("Number one devided by number two (int): " + numberOne/numberTwo);
        System.out.println("Number one devided by 1.5: " + numberOne/1.5);
        int sum = numberOne + numberTwo;
        int difference = numberOne - numberTwo;
        float quotient = (float) numberOne / numberTwo;
        int product = numberOne * numberTwo;
        System.out.println("Sum: " + sum);
        System.out.println("Difference: " + difference);
        System.out.println("Quotient: " + quotient);
        System.out.println("Product: " + product);
    }

    @Then("Show the message when my favorite color is {string}, but not {string}")
    public void showTheMessageWhenMyFavoriteColorIsButNot(String favoriteColor, String notFavoriteColor) {
        System.out.println("Is my favorite color (" + favoriteColor + ") equal to " + notFavoriteColor + "? " +
                favoriteColor.equals(notFavoriteColor));
    }

    @Then("Compare {string} and {string}")
    public void compareStringOneAndStringTwo(String stringOne, String stringTwo) {
        if (stringOne.equals(stringTwo)) {
            System.out.println(stringOne + " is equal to " + stringTwo);
        } else {
            System.out.println(stringOne + " is not equal to " + stringTwo);
        }
    }

    @Then("I print URL for {string} page")
    public void iPrintURLForSitePage(String websiteReference) {
        String address = switch (websiteReference.toLowerCase()) {
            case "google" -> "https://google.com";
            case "quote form" -> "https://skryabin.com/market/quote.html";
            case "portnov school" -> "https://portnov.com";
            default -> throw new Error("No URL for this reference in our database: " + websiteReference);
        };
        System.out.println(address);
    }

    @And("I print if number {string} is positive")
    public void iPrintIfNumberIsPositive(String numStr) {
        int num = Integer.parseInt(numStr);
        if (num > 0) { System.out.println("Number is positive"); }
        else if (num < 0 ) { System.out.println("Number is negative"); }
        else { System.out.println("Number is zero"); }
    }

    @And("I print day of the week that comes {int} days after today and today is {string}")
    public void iPrintDayOfTheWeekThatComesDaysAfterTodayAndTodayIs(int dayNumber, String startDayStr) {
        String[] daysOfWeek = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
        int dayShift = 0;
        for (int i = 0; i < daysOfWeek.length; ++i) {
            if (daysOfWeek[i].equals(startDayStr)) { dayShift = i; }
        }
        System.out.println(daysOfWeek[(dayNumber % 7) + dayShift]);
    }
}
