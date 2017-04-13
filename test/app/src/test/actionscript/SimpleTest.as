package
{

import org.flexunit.asserts.assertTrue;


/**
 * Simple test case.
 */
public class SimpleTest
{

    [Test]
    /**
     * Simple test.
     * Checks assertion:
     *   Always true.
     */
    public function alwaysTrue():void
    {
        assertTrue(true);
    }
}
}
