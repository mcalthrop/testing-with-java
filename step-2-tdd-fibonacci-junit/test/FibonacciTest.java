import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.Test;

public class FibonacciTest {
    private Fibonacci fibonacci;

    @Before
    public void setUp() {
        fibonacci = new Fibonacci();
    }

    @Test
    public void calculate_0() {
        int testIndex = 0;
        int expectedResult = 1;

        assertEquals(expectedResult, fibonacci.calculate(testIndex));
    }

    @Test
    public void calculate_1() {
        int testIndex = 1;
        int expectedResult = 1;

        assertEquals(expectedResult, fibonacci.calculate(testIndex));
    }

    @Test
    public void calculate_6() {
        int testIndex = 6;
        int expectedResult = 13;

        assertEquals(expectedResult, fibonacci.calculate(testIndex));
    }

    @Test(expected=IllegalArgumentException.class)
    public void calculate_negative() {
        fibonacci.calculate(-1);
    }
}
