package com.example.maitrichattopadhyay.burrito_maitri;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.ToggleButton;

public class MainActivity extends AppCompatActivity {

    EditText burritoName;
    ToggleButton meat ;
    CheckBox salsa;
    CheckBox guac;
    CheckBox sour;
    CheckBox cheese;
    Spinner location;
    Button build;
    TextView textGenerate;
    ImageView image;
    String extra = "";
    String name = "";
    String spinnerValue = "";
    String arr[];
    Intent intent ;
    String toggleStateString = ""; String radioSelectedText = "";
    Button browse;
    int radioSelected;

    RadioButton burrito;
    RadioButton taco;
    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        intent = new Intent(this, Main2Activity.class);

        burritoName = (EditText) findViewById(R.id.burName);
        meat = (ToggleButton) findViewById(R.id.meat);
        location = (Spinner) findViewById(R.id.spinner);
        build = (Button) findViewById(R.id.build);
        textGenerate = (TextView) findViewById(R.id.textView3);
        image = (ImageView) findViewById(R.id.imageView);
        arr = getResources().getStringArray(R.array.spinner);
        browse  = (Button) findViewById(R.id.button2);

        burrito = (RadioButton) findViewById(R.id.burritoRadio);
        taco = (RadioButton) findViewById(R.id.tacoRadio);


        //spinnerValue = (arr[0]);
        location.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                spinnerValue = (arr[i]);

            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {

            }
        });



        if (taco.isChecked())
            radioSelectedText = "taco ";
        else if (burrito.isChecked())
            radioSelectedText = " Burrito ";

        Log.i("radio ", radioSelectedText);
        build.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                extra = ""; // reset the exta
                name = ""; // reset
                salsa = (CheckBox) findViewById(R.id.checkBox);
                Boolean salsaTrue = salsa.isChecked();
                cheese = (CheckBox) findViewById(R.id.checkBox2);
                Boolean cheeseTrue = cheese.isChecked();
                sour = (CheckBox) findViewById(R.id.checkBox3);
                Boolean sourTrue = sour.isChecked();
                guac = (CheckBox) findViewById(R.id.checkBox4);
                Boolean guacTrue = guac.isChecked();

                if (salsaTrue)
                    extra += "salsa ";
                if (cheeseTrue)
                    extra += "cheese ";
                if (sourTrue)
                    extra += "sour cheam ";
                if (guacTrue)
                    extra += "guacamoli ";


                boolean toggleState = meat.isChecked();
                if (toggleState) {
                    toggleStateString = "meat ";
                   image.setImageResource(R.drawable.newm);
                }
                else {

                    toggleStateString = "veggie ";
                    image.setImageResource(R.drawable.veg);

                }

                // FIX ME RADIO BUTTON NOT CHANGING


                if (taco.isChecked())
                    radioSelectedText = "taco ";
                else if (burrito.isChecked())
                    radioSelectedText = " Burrito ";

                Log.i("radio ", radioSelectedText);

                location.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
                    @Override
                    public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                        spinnerValue = (arr[i]);

                    }

                    @Override
                    public void onNothingSelected(AdapterView<?> adapterView) {

                    }
                });



               String finalDisplay = "The " + burritoName.getText().toString() + " is a " + radioSelectedText + " with " + toggleStateString + " with " + extra + " you'd like to eat on the " + spinnerValue;


                 textGenerate.setText(finalDisplay);

            }
        });


        browse.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                intent.putExtra("name", spinnerValue); // put extra for explicit intent
                startActivity(intent); //starting the intent

            }
        });


    }// create

}
