package com.example.maitrichattopadhyay.project_android_11;

import android.content.Intent;
import android.app.Activity;
import android.os.Bundle;
import android.util.AndroidException;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import java.util.HashMap;
import java.util.Map;

public class Answer extends Activity {


    EditText answerEntered;
    TextView textField;
    String questionToBeAnswered;
    Button save;
    TextView addAnsTitle;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_answer);

        Intent i = getIntent();
        questionToBeAnswered = i.getStringExtra("question");


        TextView title = (TextView) findViewById(R.id.questionTitle);
        addAnsTitle = (TextView) findViewById(R.id.textView3) ;
        textField = (TextView) findViewById((R.id.textView));
         save = (Button) findViewById(R.id.button);
        answerEntered = (EditText) findViewById(R.id.editText);
        final Button create = (Button) findViewById(R.id.button3);


        save.setVisibility(save.GONE);
        answerEntered.setVisibility(save.GONE);
        addAnsTitle.setVisibility(save.GONE);


        title.setText(questionToBeAnswered);
        if(AnswerBank.answers.get(questionToBeAnswered)!= null)
        textField.setText(AnswerBank.answers.get(questionToBeAnswered));


    create.setOnClickListener(new View.OnClickListener() {
        @Override
        public void onClick(View v) {

            save.setVisibility(save.VISIBLE);
            answerEntered.setVisibility(save.VISIBLE);
            addAnsTitle.setVisibility(save.VISIBLE);
            create.setVisibility(create.GONE);


        }
    });


        save.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

//                for(Map.Entry<String, String> s : AnswerBank.answers.entrySet())
//                {
//                    Log.d("map key", s.getKey());
//                    Log.d("map value", s.getValue());
//
//                }
                    AnswerBank.answers.put(questionToBeAnswered, String.valueOf(answerEntered.getText()));

                    textField.setText(AnswerBank.answers.get(questionToBeAnswered));
                    answerEntered.setText("");



                save.setVisibility(save.GONE);
                answerEntered.setVisibility(save.GONE);
                addAnsTitle.setVisibility(save.GONE);
                create.setVisibility(create.VISIBLE);

                //}
            }
        });

    }


}
