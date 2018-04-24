package com.example.maitrichattopadhyay.project_android_11;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;

public class AddQuestions extends AppCompatActivity {

    EditText qnTypeEntered;
    EditText newQuestion;

    QuestionBank QB;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_questions);



        Button submit = (Button) findViewById(R.id.button2);
        submit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                qnTypeEntered = (EditText) findViewById(R.id.editTextQuestionType);
                newQuestion = (EditText) findViewById(R.id.editTextNewQuestion);

                QB = new QuestionBank(String.valueOf(qnTypeEntered.getText()), String.valueOf(newQuestion.getText()));

                Log.d("new type created", QB.getType());
                Log.d("new qn created", QB.getQn());

                switch (String.valueOf(qnTypeEntered.getText()))
                {
                    // case name is the data passed from old page
                    case "Technical": {
                        QuestionBank.Technical.add(QB);
                        qnTypeEntered.setText("");
                        newQuestion.setText("");

                        break;
                    }


                    case "Hr": {
                        QuestionBank.Hr.add(QB);
                        qnTypeEntered.setText("");
                        newQuestion.setText("");

                        break;


                    }
                    default: {
                        QuestionBank.General.add(QB);
                        qnTypeEntered.setText("");
                        newQuestion.setText("");

                    }
                }
            }
        });

    }
}
