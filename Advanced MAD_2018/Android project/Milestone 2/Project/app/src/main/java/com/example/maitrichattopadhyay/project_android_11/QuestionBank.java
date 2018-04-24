package com.example.maitrichattopadhyay.project_android_11;

import java.util.ArrayList;

/**
 * Created by maitrichattopadhyay on 4/23/18.
 */


public class QuestionBank
{

    private String type;
    private String qn;
//    private  int qnId;


    QuestionBank(String t, String q )
    {
        type = t;
        qn = q;
    }

    public static ArrayList<QuestionBank> Technical = new ArrayList<>();

    public static ArrayList<QuestionBank> Hr = new ArrayList<>();
    public static ArrayList<QuestionBank> General = new ArrayList<>();
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

    public String getType() {
        return type;
    }

    public String getQn(){
        return qn;
    }


    @Override
    public String toString() {
        return this.qn + " " + this.type  ;
    }
}
