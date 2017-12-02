package com.example.maitrichattopadhyay.lab6;

import android.content.Intent;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    Button btn;
    TextView text;
    Spinner spin;
    String arr[];

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // linking two activities
        final Intent intent = new Intent(this, Main2Activity.class); // create intent
        btn = (Button) findViewById(R.id.button);
        text = (TextView) findViewById(R.id.textField);
        spin = (Spinner) findViewById(R.id.spinner);
        TextView urlVar  = (TextView) findViewById(R.id.url);
        arr = getResources().getStringArray(R.array.spinner); // grabbing the array


        // create the adtion listner
        View.OnClickListener onClickListner = new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                // change(view);
                //text.setText("maitri");
                String temp = "The movie type you selected is ";
                text.setText(spin.getSelectedItem().toString());


                // ading what data to be passed
                String namevar = text.getText().toString();
                String movieTemp = "";
                if (namevar.equals("action")) movieTemp = "Kill Bill";
                else if (namevar.equals("romantic")) movieTemp = "Titanic";
                else if (namevar.equals("horror")) movieTemp = "IT";

                intent.putExtra("name", movieTemp); // adding data to be passed in the form of key value pairs
                startActivity(intent); //starting the intent

            }
        };
        btn.setOnClickListener(onClickListner);


        // spinner actionlistner
        spin.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                text.setText(arr[i]);

            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {

            }
        });


        View.OnClickListener onClickListener2 = new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                opensite(view);
            }
        };
        urlVar.setOnClickListener(onClickListener2);

        if(savedInstanceState != null)
        {
            text.setText(savedInstanceState.getString("text"));
        }


    } // create

    public void opensite(View v)
    {
        Intent intent2 = new Intent(Intent.ACTION_VIEW); // explicit intent. Action View determines which app to handle the intent
        TextView url = (TextView) findViewById(R.id.url);
        intent2.setData(Uri.parse(url.getText().toString())); // addding data to intent

        startActivity(intent2);
    }

    // saving state
    @Override
    protected void onSaveInstanceState(Bundle outState) {
        outState.putString("text" , text.getText().toString());
        super.onSaveInstanceState(outState);

    }




}

