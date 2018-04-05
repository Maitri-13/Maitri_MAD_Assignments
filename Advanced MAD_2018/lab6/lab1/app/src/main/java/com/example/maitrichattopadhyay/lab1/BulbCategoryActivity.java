package com.example.maitrichattopadhyay.lab1;

import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class BulbCategoryActivity extends ListActivity {

    private String bulbtype; // Global decleration

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Intent i = getIntent();
        bulbtype = i.getStringExtra("bulbtype");  // geting the data that is passed

        //the instance of the listView controller
        ListView listBulbs = getListView();
        //creating a adapter for this page
        ArrayAdapter<Bulb> listAdapter;

        //initialize the array adapter with the right list of bulbs
        switch (bulbtype) {
            // case name is the data passed from old page
            case "Tulips":
                listAdapter = new ArrayAdapter<Bulb>(this, android.R.layout.simple_list_item_1, Bulb.tulips);
                break;

            case "Daffodils":
                listAdapter = new ArrayAdapter<Bulb>(this, android.R.layout.simple_list_item_1, Bulb.Daffodils);
                break;
            case "Iris":
                listAdapter = new ArrayAdapter<Bulb>(this, android.R.layout.simple_list_item_1, Bulb.Iris);
                break;

            default:
                listAdapter = new ArrayAdapter<Bulb>(this, android.R.layout.simple_list_item_1, Bulb.Iris);
        }

        //set the array adapter on the list view
        listBulbs.setAdapter(listAdapter);
    } // on create


    // this function is outside the oncreate
    // this is teh listener
    @Override
    public void onListItemClick(ListView listView, View view, int position, long id) {
        Intent intent = new Intent(BulbCategoryActivity.this, BulbActivity.class);
        intent.putExtra("bulbid", (int) id);
        startActivity(intent);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        //inflate menu to add items to the action bar
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        //get the ID of the item on the action bar that was clicked
        switch (item.getItemId()) {
            case R.id.create_order:
                //start order activity
                Intent intent = new Intent(this, OrderActivity.class);
                startActivity(intent);
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
}
