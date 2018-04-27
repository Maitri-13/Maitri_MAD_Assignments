package com.example.maitrichattopadhyay.project_android_11;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by maitrichattopadhyay on 4/27/18.
 */

public class AnswerBank {

    private String question;
    private String answer;
//    private  int qnId;

    public  static Map<String, String> answers = new HashMap<>();      // qn, ans

    AnswerBank(String q, String a )
    {
        question = q;
        answer = a;
    }



    public String getQuestion() {
        return question;
    }

    public String getAnswer(){
        return answer;
    }


    @Override
    public String toString() {
        return this.answer   ;
    }
}

