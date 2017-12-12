package com.example.maitrichattopadhyay.project1;

import android.content.Intent;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

public class Main2Activity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);

        final Intent intent2 = new Intent(this, MainActivity.class); // create intent

        TextView result = (TextView) findViewById(R.id.textView);
        ImageView image = (ImageView) findViewById(R.id.image);
        Button startOver = (Button) findViewById(R.id.startOver);
        final TextView url = (TextView) findViewById(R.id.url);
        TextView displaytime = (TextView) findViewById(R.id.textView23);


        Intent intent = getIntent();
        String newText = intent.getStringExtra("text");
        String newEnteredText = intent.getStringExtra("enteredText");
        String hours = intent.getStringExtra("hours");
        String min = intent.getStringExtra("min");
        String sec = intent.getStringExtra("sec");
        String miliSec = intent.getStringExtra("milisec");


        displaytime.setText("you took " + hours + " hours " + min + " mins " + sec + " sec " + miliSec + " millisecs to complete the task");

        if (newText.equals(newEnteredText)) // this is string variable not textField. Hence no need to toString() or anything.
        {
            result.setText("Congrats! that was correct. Reset and play again");
            image.setImageResource(R.drawable.happy);
        }
        else
        {
            result.setText("Not correct. Reset the game and play again");
            image.setImageResource(R.drawable.sad);
        }

        // Reset functionality
        startOver.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(intent2); // calls the Main Activity || Resets the whole application

            }
        });

        url.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent urlIntent =  new Intent(Intent.ACTION_VIEW);
                urlIntent.setData(Uri.parse(url.getText().toString()));
                startActivity(urlIntent);
            }
        });
    } // create over


} // class
