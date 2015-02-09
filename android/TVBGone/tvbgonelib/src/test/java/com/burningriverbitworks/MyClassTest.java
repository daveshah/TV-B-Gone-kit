package com.burningriverbitworks;


import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class MyClassTest {

    @Test
    public void itIsSetupProperly() {
        MyClass myClass = new MyClass();
        assertEquals("com.burningriverbitworks.MyClass",myClass.getClass().getName());
    }
}
