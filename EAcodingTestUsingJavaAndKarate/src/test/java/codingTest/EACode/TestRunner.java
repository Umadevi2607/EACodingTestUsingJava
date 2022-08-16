package codingTest.EACode;

import com.intuit.karate.junit5.Karate;


public class TestRunner {

    @Karate.Test
    Karate testCodeTest() {
        return Karate.run("codeTest").relativeTo(getClass());
    }
}
