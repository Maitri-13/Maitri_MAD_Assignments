package com.example.maitrichattopadhyay.finals_maitri;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;

public class AddFeature extends Activity {

    EditText qnTypeEntered;
    EditText newQuestion;

    DataClass QB;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_feature);



        Button submit = (Button) findViewById(R.id.button2);
        submit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {


                qnTypeEntered.setText("");
                newQuestion.setText("");

            }
        });
    }
}

