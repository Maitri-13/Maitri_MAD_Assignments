package com.example.maitrichattopadhyay.finals_maitri;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.ListView;

public class StartPage extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_start_page);

        ImageView img= (ImageView) findViewById(R.id.imageView);
        img.setImageResource(R.drawable.cardio300);

        AdapterView.OnItemClickListener itemClickListener = new AdapterView.OnItemClickListener() {
            public void onItemClick(AdapterView<?> listView, View view, int position, long id) {
                String bulbtype = (String) listView.getItemAtPosition(position);
                Log.d("type" ,  bulbtype);

                // intent to go to the next page : givena s rhe class
                Intent intent = new Intent(StartPage.this, MainActivity.class);
                intent.putExtra("type", bulbtype);

                //start intent
                startActivity(intent);
            }
        };


        ListView listview = (ListView) findViewById(R.id.listView);
        //adding the lister to the list
        listview.setOnItemClickListener(itemClickListener);

    }
    // These two functions are for the menu to inflate
    // this one calls the menu resource you have created
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        //inflate menu to add items to the action bar
        getMenuInflater().inflate(R.menu.menu_mian, menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        //get the ID of the item on the action bar that was clicked
        switch (item.getItemId()) {
            case R.id.add:
                //start order activity
                Intent intent = new Intent(this, AddFeature.class); // this says where to go from this class
                startActivity(intent);
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }


}
