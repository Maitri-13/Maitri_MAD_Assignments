package com.example.dell.lab1;


import android.content.Context;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;
public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void hororscope(View view) {
        //spinner
        // its like a picker view for IOS
        Spinner age = (Spinner) findViewById(R.id.ageSelector);
        String ageGroup = String.valueOf(age.getSelectedItem());
        // gives back the item selected. type casting
        // the object returned to string. spinners already have a default vlaue

        RadioGroup gender = (RadioGroup) findViewById(R.id.radioGroup);
        int genderSelected = gender.getCheckedRadioButtonId(); // geting which radio button i schosen
        // this will return -1 if nothig is checked

        EditText name = (EditText) findViewById(R.id.enterName);
        String nameVal = name.getText().toString();

        String yourHororscope = "";


       if (genderSelected == -1 || nameVal.matches(""))
        {
            Context context = getApplicationContext();
            CharSequence text = "Please make sure name is entered and gender are selected"; // this variable is of type charSeq. not string
            int duration = Toast.LENGTH_SHORT;
            Toast toast = Toast.makeText(context, text, duration); // creating the toast
            toast.show();
        }


        else
       {
            if (genderSelected == R.id.female) {
                yourHororscope = "you will have a wonderfull year ahead and soon become a millionare";
                TextView horor = (TextView) findViewById(R.id.displayHororscope);
                horor.setText(nameVal + " " + yourHororscope);
                ImageView image = (ImageView) findViewById(R.id.imageView);
                image.setImageResource(R.drawable.money);

            } else if (genderSelected == R.id.male) {
                yourHororscope = "you have a successfull year ahead with a big promotion around the corner";
                TextView horor = (TextView) findViewById(R.id.displayHororscope);
                horor.setText(nameVal + " " + yourHororscope);
                ImageView image = (ImageView) findViewById(R.id.imageView);
                image.setImageResource(R.drawable.money);

            } else if (genderSelected == R.id.other) {
                yourHororscope = "you will be america's next top model!!";
                TextView horor = (TextView) findViewById(R.id.displayHororscope);
                horor.setText(nameVal + " " + yourHororscope);
                ImageView image = (ImageView) findViewById(R.id.imageView);
                image.setImageResource(R.drawable.money);

            }
    }


        // setting the hororscope

    }



}
