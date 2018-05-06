package com.example.maitrichattopadhyay.finals_maitri;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;

import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

public class AddFeature extends Activity {

    String qnTypeEntered;
    EditText newQuestion;

    DataClass QB;

    @Override
    protected void onCreate(Bundle savedInstanceState) {


        // Firebase database instance
        FirebaseDatabase database = FirebaseDatabase.getInstance();
        //Firebase database reference
        DatabaseReference ref = database.getReference();
        //Firebase database recipe node reference
        final DatabaseReference qnref = database.getReference("Lab");  // this is the name of my node in the firebase


        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_feature);

        Button submit = (Button) findViewById(R.id.button2);

        submit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Spinner spinner = (Spinner) findViewById(R.id.spinner);
                qnTypeEntered =  spinner.getSelectedItem().toString();
                newQuestion = (EditText) findViewById(R.id.editTextNewQuestion);

                // Create a key  and push it.
                String key = qnref.push().getKey(); // generates the key
                QB = new DataClass(String.valueOf(qnTypeEntered), String.valueOf(newQuestion.getText()), key); // create the object
                qnref.child(key).setValue(QB);  // sets the value to that key. Adds to the firebase

                // DataClass.Technical.add(QB); // No need to do this. The data will be fetched from the firebase in the other class
                qnTypeEntered = "";
                newQuestion.setText("");

            }
        });

    }
}

