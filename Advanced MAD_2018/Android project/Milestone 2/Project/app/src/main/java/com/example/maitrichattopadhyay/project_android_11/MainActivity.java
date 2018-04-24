package com.example.maitrichattopadhyay.project_android_11;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // when i click anythig on this astivity, it will send the value in the intent. this value will be same as in the
        // string.xml file.
        // In the next intent This value will be matched and the matching array will be pulled out of the
        // QnBank class



        // creating an action listner for the list view
        AdapterView.OnItemClickListener itemClickListener = new AdapterView.OnItemClickListener()
        {
            public void onItemClick(AdapterView<?> listView, View view, int position, long id)
            {
                String questionType = (String) listView.getItemAtPosition(position); // gets which row is selected

                // intent to go to the next page
                Intent intent = new Intent(MainActivity.this, QuestionList.class);
                // adding the data : key value pair
                intent.putExtra("Type", questionType); // sends that question to the next page
                //start intent
                startActivity(intent);

            }
        };
        // Now linked the action listner to the listView
        ListView listview = (ListView) findViewById(R.id.listView3);
        //adding the lister to the list
        listview.setOnItemClickListener(itemClickListener);
    }



    // Inflating menu
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        //inflate menu to add items to the action bar
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return super.onCreateOptionsMenu(menu);
    }

    // Also for the menu
    @Override
    public boolean onOptionsItemSelected(MenuItem item)
    {
        //get the ID of the item on the action bar that was clicked
        switch (item.getItemId())
        {
            case R.id.new_question:
                //start order activity
                Intent intent = new Intent(this, AddQuestions.class);
                startActivity(intent);
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }


    }
}

