package com.example.maitrichattopadhyay.lab7_b;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.ConditionVariable;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Map;

public class Main2Activity extends AppCompatActivity {
    Map<String, ?> nameArray;
    String namePassed;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);

//        Intent i = getIntent();
//         namePassed = i.getStringExtra("Name");
//        Log.d("passed value" , namePassed);

        TextView te = (TextView) findViewById(R.id.displayName);
        loadData(this, te);

    }

    public  void loadData(Context context , TextView text)
    {
        SharedPreferences shared = context.getSharedPreferences("h", Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = shared.edit();

      nameArray = shared.getAll();
        ArrayList<String> list = new ArrayList<>();

     String temp ="";
        for( Map.Entry<String, ?> entry: nameArray.entrySet())
        {

            Log.d("value " ,String.valueOf(entry.getValue()));
            temp = String.valueOf(entry.getValue());
           // text.append(temp + " ");
            list.add(String.valueOf(entry.getValue()));


        }

//        Log.d("last value " , list.get(list.size()-1));
//        Log.d("first value " , list.get(0));
        text.setText(list.get(0));
        //text.append(te);






    }

}
