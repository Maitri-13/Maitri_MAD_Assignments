package com.example.maitrichattopadhyay.lab7_b;

import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.provider.Telephony;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class MainActivity extends AppCompatActivity {
    String name = " ";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final Context presentContext = this;

        Button save = (Button) findViewById(R.id.button);

        save.setOnClickListener(new View.OnClickListener()
        {
            public void onClick(View v)
            {
                EditText nameBox = (EditText) findViewById(R.id.editText);
                name = String.valueOf(nameBox.getText());

                // shared preferences

                saveData(presentContext);

                nameBox.setText("");  // making the name again empty




            }
        });





        Button contact = (Button) findViewById(R.id.button2);
        contact.setOnClickListener(new View.OnClickListener()
        {
            public void onClick(View v)
            {
                Intent intent = new Intent(MainActivity.this, Main2Activity.class);
                // adding the data : key value pair
                intent.putExtra("Name", name);
                //start intent
                startActivity(intent);



            }
        });



    } // on click



    public void saveData (Context context)
    {
        SharedPreferences shared = context.getSharedPreferences("h", Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = shared.edit();
        String value = "The name is you entered is "+name;

        if (name != " ")
            editor.putString(name, value);

        editor.commit();






    }
}
