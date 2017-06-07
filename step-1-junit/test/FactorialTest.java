import static org.junit.Assert.assertEquals;
import org.junit.Test;

public class FactorialTest {
    @Test
    public void calculate_0() {
        Factorial factorial = new Factorial();
        int testStartValue = 0;
        int expectedResult = 0;

        assertEquals(expectedResult, factorial.calculate(testStartValue));
    }

    @Test
    public void calculate_1() {
        Factorial factorial = new Factorial();
        int testStartValue = 1;
        int expectedResult = 1;

        assertEquals(expectedResult, factorial.calculate(testStartValue));
    }
}
