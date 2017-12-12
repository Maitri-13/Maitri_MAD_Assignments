package com.example.maitrichattopadhyay.project1;

import android.app.AutomaticZenRule;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.SystemClock;
import android.preference.PreferenceManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    TextView diffLevel;
    RadioGroup radio;
    Button start;
    TextView text;
    Button done;
    Button submit;
    EditText enterText;
    int diffLevelSelected;
    RadioButton radioButton;
    int flag;

    // for the stop watch
    private  Handler mHandler = new Handler();
    private long startTime;
    private long elapsedTime;
    private final int REFRESH_INTERVAL = 100;
    private String hours,minutes,seconds,milliseconds;
    private long secs,mins,hrs;
    private boolean stopped = false;

    private Runnable startTimer = new Runnable()
    {
        public void run()
        {
            elapsedTime = System.currentTimeMillis() - startTime;
            updateTimer(elapsedTime);
            mHandler.postDelayed(this,REFRESH_INTERVAL);
        }
    };
    // function to represent and calculate the time of the stop watch in desired format
    private void updateTimer (float time){
        secs = (long)(time/1000);
        mins = (long)((time/1000)/60);
        hrs = (long)(((time/1000)/60)/60);

        secs = secs % 60;
        seconds=String.valueOf(secs);
        if(secs == 0)
            seconds = "0";


        mins = mins % 60;
        minutes=String.valueOf(mins);
        if(mins == 0)
            minutes = "0";

        hours=String.valueOf(hrs);
        if(hrs == 0)
            hours = "0";

        milliseconds = String.valueOf((long)time);
        if(milliseconds.length()==2)
            milliseconds = "0"+milliseconds;

        if(milliseconds.length()<=1)
            milliseconds = "0";

        milliseconds = milliseconds.substring(milliseconds.length()-3, milliseconds.length()-2);

    }

    @Override
    protected void onCreate(final Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final Intent intent = new Intent(this, Main2Activity.class);

        diffLevel = (TextView) findViewById(R.id.DifficultyLevel);
        radio = (RadioGroup) findViewById(R.id.radioGroup);
        start = (Button) findViewById(R.id.start);
        text = (TextView) findViewById(R.id.text);
        done = (Button) findViewById(R.id.done);
        submit = (Button) findViewById(R.id.submit);
        enterText = (EditText) findViewById(R.id.enterText);
        diffLevelSelected = radio.getCheckedRadioButtonId() ;
        radioButton = (RadioButton) findViewById(diffLevelSelected);


        if (savedInstanceState == null || savedInstanceState.getInt("radioSelected") == -1)
        {
            submit.setVisibility(View.INVISIBLE);
            enterText.setVisibility(View.INVISIBLE);
            start.setEnabled(false); // Hide sentence button
        }

        // when the user hits the Show sentence button
        done.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View view)
            {   int LevelSelected = radio.getCheckedRadioButtonId() ;
                RadioButton radioBut = (RadioButton) findViewById(LevelSelected);
                flag =0;
                if (LevelSelected == -1) // nothing selected
                {
                    // pop uo a toast
                    Context context = getApplicationContext();
                    CharSequence text = "Please select a difficulty level";
                    int duration = Toast.LENGTH_SHORT;
                    Toast toast = Toast.makeText(context, text, duration);
                    toast.show();
                }
                else
                {   done.setEnabled(false);
                    radio.getChildAt(0).setEnabled(false);
                    radio.getChildAt(1).setEnabled(false);
                    radio.getChildAt(2).setEnabled(false);
                    diffLevel.setText("");
                    radio.setEnabled(false);
                    start.setEnabled(true);

                    if (radioBut.getText().toString().equals("Simple"))

                        text.setText("Nice to see you");

                     else if (radioBut.getText().toString().equals("Medium"))
                        text.setText("Madam curie made a amazing discovery. \nBut it took her life in the end");

                     else if (radioBut.getText().toString().equals("Hard"))

                        text.setText("There are many vices in the world but the most\n immediate one to address in poverty. It kills\n many every  year");
                }
            }
        }); // Show sentence button

        // Function for Hide button functionality
        start.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                enterText.setVisibility(View.VISIBLE);
                submit.setVisibility(View.VISIBLE);
                start.setVisibility(View.INVISIBLE);
                text.setVisibility(View.INVISIBLE);

                flag = 1;
                if(stopped)
                    startTime = System.currentTimeMillis() - elapsedTime;

                else
                    startTime = System.currentTimeMillis();

                mHandler.removeCallbacks(startTimer);
                mHandler.postDelayed(startTimer, 0);

            }
        }); // Hide Sentece Button


        submit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {


                intent.putExtra("text", text.getText().toString());
                intent.putExtra("enteredText", enterText.getText().toString());
                intent.putExtra("hours", hours);
                intent.putExtra("min", minutes);
                intent.putExtra("sec", seconds);
                intent.putExtra("milisec", milliseconds);
                startActivity(intent);
                mHandler.removeCallbacks(startTimer);
                stopped = true;
            }
        });


        if(savedInstanceState != null)
        {

            text.setText(savedInstanceState.getString("text"));
            flag = savedInstanceState.getInt("flag");
            hours = savedInstanceState.getString("hour");
            minutes = savedInstanceState.getString("min");
            milliseconds = savedInstanceState.getString("milisec");
            seconds = savedInstanceState.getString("sec");
            startTime = savedInstanceState.getLong("startTime");
            elapsedTime = savedInstanceState.getLong("elapsed");


            Log.i("flag value", String.valueOf(flag));

             if (text.getText() != ""){
                 radio.getChildAt(0).setEnabled(false);
                 radio.getChildAt(1).setEnabled(false);
                 radio.getChildAt(2).setEnabled(false);
                 done.setEnabled(false);
                 start.setEnabled(true);
             }
            if( flag == 1)
            {
                radio.getChildAt(0).setEnabled(false);
                radio.getChildAt(1).setEnabled(false);
                radio.getChildAt(2).setEnabled(false);
                done.setEnabled(false);
                submit.setVisibility(View.VISIBLE);
                enterText.setVisibility(View.VISIBLE);
                start.setVisibility(View.INVISIBLE);
                text.setVisibility(View.INVISIBLE);

                    mHandler.removeCallbacks(startTimer);
                    mHandler.postDelayed(startTimer, 0);

            }


        }

    } // create

    @Override
    protected void onSaveInstanceState(Bundle outState) {
        outState.putString("text" , text.getText().toString());
        outState.putInt("radioSelected", diffLevelSelected);
        outState.putInt("flag", flag);
        outState.putString("hour", hours);
        outState.putString("min", minutes);
        outState.putString("sec", seconds);
        outState.putString("milisec", milliseconds);
        outState.putLong("startTime", startTime);
        outState.putLong("elapsed", elapsedTime);

        //outState.putString("startTime", startTimer.toString());

        super.onSaveInstanceState(outState);

    } // on State Save Function

} // class
