package com.example.maitrichattopadhyay.finals_maitri;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;

public class AddNewWorkout extends Activity {

    String workoutType;

    EditText act ;
    EditText url;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_new_workout);

        Button submit = (Button) findViewById(R.id.button);
        submit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {


//                act.setText("");
//                url.setText("");


                Intent intent = new Intent(AddNewWorkout.this, MainActivity.class);


                //start intent
                startActivity(intent);

            }
        });



            }


}
