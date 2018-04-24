package com.example.maitrichattopadhyay.project_android_11;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import java.util.HashMap;
import java.util.Map;

public class Answer extends AppCompatActivity {

    Map<String, String> answers = new HashMap<>();
    EditText answerEntered;
    TextView textField;
    String questionToBeAnswered;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_answer);

        Intent i = getIntent();
        questionToBeAnswered = i.getStringExtra("question");
        Log.d("question sent" , questionToBeAnswered);
        TextView title = (TextView) findViewById(R.id.textView3);
        title.setText(questionToBeAnswered);



        textField = (TextView) findViewById((R.id.textView));
        Button save = (Button) findViewById(R.id.button);


        save.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
               // if (answerEntered != null)
               // {
                    answerEntered = (EditText) findViewById(R.id.editText);
                    Log.d("answer entered" , String.valueOf(answerEntered.getText()));
                    answers.put(questionToBeAnswered, String.valueOf(answerEntered.getText()));
                    textField.setText(String.valueOf(answerEntered.getText()));

                //}
            }
        });

    }

    // Inflating menu
//    @Override
//    public boolean onCreateOptionsMenu(Menu menu) {
//        //inflate menu to add items to the action bar
//        getMenuInflater().inflate(R.menu.menu_main, menu);
//        return super.onCreateOptionsMenu(menu);
//    }
//
//    // Also for the menu
//    @Override
//    public boolean onOptionsItemSelected(MenuItem item)
//    {
//        //get the ID of the item on the action bar that was clicked
//        switch (item.getItemId())
//        {
//            case R.id.new_question:
//                //start order activity
//                Intent intent = new Intent(Answer.this, AddQuestions.class);
//                startActivity(intent);
//                return true;
//            default:
//                return super.onOptionsItemSelected(item);
//        }
//
//
//    }
}
