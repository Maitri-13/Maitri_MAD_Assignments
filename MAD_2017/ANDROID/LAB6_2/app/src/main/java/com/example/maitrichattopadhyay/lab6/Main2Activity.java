package com.example.maitrichattopadhyay.lab6;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;

public class Main2Activity extends AppCompatActivity
{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);

        Intent intent2 = getIntent();
        String newText =  intent2.getStringExtra("name");
        TextView textView2 = (TextView) findViewById(R.id.movieName);
        Log.i("text view  value" , newText);
        textView2.setText(newText);


    }
}

