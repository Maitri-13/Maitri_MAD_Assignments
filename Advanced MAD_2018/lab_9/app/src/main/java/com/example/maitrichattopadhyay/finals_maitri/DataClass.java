package com.example.maitrichattopadhyay.finals_maitri;

import java.util.ArrayList;

/**
 * Created by maitrichattopadhyay on 5/5/18.
 */

public class DataClass
{


    private String type;
    private String qn;
    private String id ; // this is for the firebase

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    //    private  int qnId;


    DataClass(){}
    DataClass(String t, String q , String id)  // constructor
    {
        type = t;
        qn = q;
        this.id = id;
    }

    public static ArrayList<DataClass> Technical = new ArrayList<>();
    public static ArrayList<DataClass> Hr = new ArrayList<>();
    public static ArrayList<DataClass> General = new ArrayList<>();


    public String getType() {
        return type;
    }

    public String getQn(){
        return qn;
    }


    public  void setType(String t)
    {
        this.type = t;

    }

    public void setQn(String qn) {
        this.qn = qn;
    }

    // this should return what you want to display in each row of the ListActivity through
    // the Array Acapter
    @Override
    public String toString() {
        return this.qn   ;
    }



//    Tech.
//    //Tech.add( new QuestionBank("Technical", "What is the default size of AL"));


//    public static QuestionBank Technical[] = {
//            new QuestionBank("Technical", "What is the default size of AL")
//    };
//
//    public static QuestionBank Hr[] = {
//            new QuestionBank("Hr", "What is your strength")
//    };
//
//    public static QuestionBank General[] = {
//        new QuestionBank("General", "How was your weekend")
//        };


}

