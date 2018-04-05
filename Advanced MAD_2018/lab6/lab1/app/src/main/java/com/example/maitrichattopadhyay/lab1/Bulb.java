package com.example.maitrichattopadhyay.lab1;

/**
 * Created by maitrichattopadhyay on 3/22/18.
 */

public class Bulb {

    private String name;
    private int imageResourceID;

    //constructor
    private Bulb(String newname, int newID){
        this.name = newname;
        this.imageResourceID = newID;
    }

    public static final Bulb[] tulips = {
           // new Bulb("Daydream", R.drawable.daydream),
            new Bulb("Apeldoorn Elite", R.drawable.apeldoorn),
            new Bulb("Banja Luka", R.drawable.banjaluka),
           // new Bulb("Burning Heart", R.drawable.burningheart),
            //new Bulb("Cape Cod", R.drawable.capecod)
    };
    public static final Bulb[] Daffodils = {
            // new Bulb("Daydream", R.drawable.daydream),
            new Bulb("biggum", R.drawable.biggun),
            //new Bulb("Banja Luka", R.drawable.blazingsunrise),
            // new Bulb("Burning Heart", R.drawable.burningheart),
            //new Bulb("Cape Cod", R.drawable.capecod)
    };
    public static final Bulb[] Iris = {
            // new Bulb("Daydream", R.drawable.daydream),
            new Bulb("Apeldoorn ", R.drawable.apeldoorn),
            //new Bulb("Banja Luka", R.drawable.biggun),
            // new Bulb("Burning Heart", R.drawable.burningheart),
            //new Bulb("Cape Cod", R.drawable.capecod)
    };

    public String getName()
    {
        return name;
    }

    public int getImageResourceID()
    {
        return imageResourceID;
    }

    //have to implement the tostring method since the adapter only calls to this. If not present; error or crash
    public String toString()
    {
        return this.name;
    }

}
