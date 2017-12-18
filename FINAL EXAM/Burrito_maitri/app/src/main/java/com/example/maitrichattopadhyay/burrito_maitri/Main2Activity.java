package com.example.maitrichattopadhyay.burrito_maitri;

import android.content.Intent;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class Main2Activity extends AppCompatActivity {
String url ="";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);

        Intent intent2 = getIntent();
        String newText =  intent2.getStringExtra("name");
        TextView text = (TextView) findViewById(R.id.textView);
        Button browseExternal = (Button) findViewById(R.id.button);

        Log.i("spinner name ", newText);
//         <item> The Hill </item>
//        <item> 29th Street</item>
//        <item> Pearl Street </item>
        if (newText.equals("The Hill")) {
            text.setText("You should check out Illegal Petes");
                url = "http://illegalpetes.com/";
        }
        else if (newText.equals("29th Street")) {
            text.setText("You should check out Chipotle");
            url = "https://www.chipotle.com/";

        }
        else if(newText.equals("Pearl Street")) {
            text.setText(" You should check out Bartaco");
            url = "https://bartaco.com/";

        }


        browseExternal.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                Intent intent2 = new Intent(Intent.ACTION_VIEW); // implicit intent. Action View determines which app to handle the intent

                intent2.setData(Uri.parse(url)); // set data for implicit intent
                startActivity(intent2);
            }
        });


    }

}
