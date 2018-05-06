package com.example.maitrichattopadhyay.finals_maitri;

import android.app.Activity;
import android.app.ListActivity;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.app.AlertDialog;
import android.view.ContextMenu;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import java.net.URL;

public class MainActivity extends ListActivity {

    ArrayAdapter<DataClass> listAdapter;

    FirebaseDatabase database = FirebaseDatabase.getInstance();
    //Firebase database reference
    DatabaseReference ref = database.getReference();
    //Firebase database recipe node reference
    final DatabaseReference qnref = database.getReference("Lab");  // this is the name of my node in the firebase


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);


        // For readjing
        ValueEventListener firebaseListner = new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                DataClass.Technical.clear(); // clearing the araylist to re-enter all the new data

                for(DataSnapshot snapshot : dataSnapshot.getChildren()) /// looping through the snapshots
                {

                    DataClass dataClassObject = snapshot.getValue(DataClass.class); // create object
                    DataClass.Technical.add(dataClassObject); // store in AL

                }
                //update adapter
                listAdapter.notifyDataSetChanged();

            }

            @Override
            public void onCancelled(DatabaseError databaseError) {

            }

        };  // the listner
        qnref.addValueEventListener(firebaseListner);



        //the instance of the listView controller
        ListView listBulbs = getListView();

        // this is for drawing out the rows
        listAdapter = new ArrayAdapter<DataClass>(this, android.R.layout.simple_list_item_1, DataClass.Technical);



        listBulbs.setAdapter(listAdapter);//set the array adapter on the list view

     //   registerForContextMenu(listBulbs);  // listView // this is for the delete feature on long press


    } // on create



    // this function is outside the oncreate
    // this is for the ListActivity to do somehting when something is clicked
    @Override
    public void onListItemClick(ListView listView, View view, int position, long id)
    {


//        //create new intent
//        Intent intent = new Intent(Intent.ACTION_VIEW);
//        //add url to intent
//        intent.setData(Uri.parse("http://google.com"));
//        //start intent
//        startActivity(intent);

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
