package com.example.maitrichattopadhyay.finals_maitri;

import java.util.ArrayList;

/**
 * Created by maitrichattopadhyay on 5/5/18.
 */

public class DataClass
{


    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getActName() {

        return actName;
    }

    public void setActName(String actName) {
        this.actName = actName;
    }

    private String actName;
    private  String url;

//    private  int qnId;


    DataClass(){}
    DataClass( String q , String u)  // constructor
    {

        actName = q;
        url = u;
    }

    public static ArrayList<DataClass> Cardio = new ArrayList<>();
    public static ArrayList<DataClass> Strength = new ArrayList<>();
    public static ArrayList<DataClass> Flexility = new ArrayList<>();





    // this should return what you want to display in each row of the ListActivity through
    // the Array Acapter
    @Override
    public String toString() {
        return this.actName   ;
    }





}

