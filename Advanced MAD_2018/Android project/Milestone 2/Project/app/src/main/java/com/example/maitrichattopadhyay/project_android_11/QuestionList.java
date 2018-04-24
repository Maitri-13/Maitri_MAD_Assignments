package com.example.maitrichattopadhyay.project_android_11;

import android.app.Activity;
import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class QuestionList extends ListActivity {
    int typeDetector;
    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);


        Intent i = getIntent();
        String qnType = i.getStringExtra("Type");  // geting the data that is passed

        //the instance of the listView controller
        ListView listBulbs = getListView();
        //ListAdapter of the type of Objects tht we aill be holding
        ArrayAdapter<QuestionBank> listAdapter;



        switch (qnType) {
            // case name is the data passed from old page
            case "Technical": {

                listAdapter = new ArrayAdapter<QuestionBank>(this, android.R.layout.simple_list_item_1, QuestionBank.Technical);
              //  listAdapter = new ArrayAdapter<QuestionBank>(this, android.R.layout.simple_list_item_1, QuestionBank.Technical);
                typeDetector = 0;
                break;
            }


            case "Hr": {
                listAdapter = new ArrayAdapter<QuestionBank>(this, android.R.layout.simple_list_item_1, QuestionBank.Hr);
                typeDetector = 1;
                break;
            }
            default: {
                listAdapter = new ArrayAdapter<QuestionBank>(this, android.R.layout.simple_list_item_1, QuestionBank.General);
                typeDetector =2;

            }
        }

        listBulbs.setAdapter(listAdapter);//set the array adapter on the list view
    } // on create


    @Override
    public void onListItemClick(ListView listView, View view, int position, long id) {
        Intent intent = new Intent(QuestionList.this, Answer.class);


        // For geting the qn that is clicked so we can fetch respective answer
        String questionClicked = "";
        ArrayAdapter<QuestionBank> listAdapterTemp;
        if (typeDetector ==0)
        {
            listAdapterTemp = new ArrayAdapter<QuestionBank>(this, android.R.layout.simple_list_item_1, QuestionBank.Technical);
            questionClicked = listAdapterTemp.getItem((int)id).getQn();
            Log.d("question clicked ", questionClicked);

        }
        if (typeDetector ==1)
        {
            listAdapterTemp = new ArrayAdapter<QuestionBank>(this, android.R.layout.simple_list_item_1, QuestionBank.Hr);
            questionClicked = listAdapterTemp.getItem((int)id).getQn();
            Log.d("question clicked ", questionClicked);

        }
        if (typeDetector ==2)
        {
            listAdapterTemp = new ArrayAdapter<QuestionBank>(this, android.R.layout.simple_list_item_1, QuestionBank.General);
            questionClicked = listAdapterTemp.getItem((int)id).getQn();
            Log.d("question clicked ", questionClicked);

        }

        intent.putExtra("question", questionClicked); // passed the qn that was clicked
        Log.d("question clicked" , questionClicked);
        startActivity(intent);
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
                Intent intent = new Intent(QuestionList.this, AddQuestions.class);
                startActivity(intent);
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }


    }


}
