package bla;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class BlaTest {
    private Bla bla;

    @Before
    public void setUp(){
        bla = new Bla();
    }

    @Test
    public void test(){
        bla.setBle("Aguante River");
        Assert.assertEquals(bla.getBle(),"Aguante River");
    }
}
