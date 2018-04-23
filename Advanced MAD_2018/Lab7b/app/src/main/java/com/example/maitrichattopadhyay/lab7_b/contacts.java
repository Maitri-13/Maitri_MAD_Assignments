package com.example.maitrichattopadhyay.lab7_b;

/**
 * Created by maitrichattopadhyay on 4/22/18.
 */

public class contacts {



    String name;



    contacts(String name)
    {
        this.name = name;
    }
    public String getName()
    {
        return  name;
    }




    @Override
    public String toString() {
        return "Name " + name;
    }
}
