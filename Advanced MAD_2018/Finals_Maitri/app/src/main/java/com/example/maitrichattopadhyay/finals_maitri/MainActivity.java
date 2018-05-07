package com.example.maitrichattopadhyay.finals_maitri;

import android.app.Activity;
import android.app.ListActivity;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.app.AlertDialog;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.ContextMenu;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;

import java.util.UUID;

public class MainActivity extends ListActivity {

    ArrayAdapter<DataClass> listAdapter;
    String workoutType = "Cardio";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);



        Intent i = getIntent();
         workoutType = i.getStringExtra("type");  // geting the data that is passed
        Log.d("came here",workoutType);

        DataClass QB = new DataClass("push ups", "http//google.com");
        DataClass.Cardio.add(QB);



        //the instance of the listView controller
        ListView listBulbs = getListView();
        //ListAdapter of the type of Objects tht we aill be holding


        switch (workoutType) {
            // case name is the data passed from old page
            case "Cardio": {

                listAdapter = new ArrayAdapter<DataClass>(this, android.R.layout.simple_list_item_1, DataClass.Cardio);


                break;
            }


            case "Strength": {
                listAdapter = new ArrayAdapter<DataClass>(this, android.R.layout.simple_list_item_1, DataClass.Strength);

                break;
            }
            default: {
                listAdapter = new ArrayAdapter<DataClass>(this, android.R.layout.simple_list_item_1, DataClass.Flexility);


            }
        }

        listBulbs.setAdapter(listAdapter);//set the array adapter on the list view

        registerForContextMenu(listBulbs);  // listView


    } // on create



    // this function is outside the oncreate
    // this is for the ListActivity to do somehting when something is clicked
    @Override
    public void onListItemClick(ListView listView, View view, int position, long id) {

//create new intent
        Intent intent = new Intent(Intent.ACTION_VIEW);
        //add url to intent
        intent.setData(Uri.parse("http://google.com"));
        //start intent
        startActivity(intent);
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
                Intent intent = new Intent(this, AddNewWorkout.class); // this says where to go from this class

                intent.putExtra("type", workoutType);
                 startActivity(intent);


//

                return true;

            default:
                return super.onOptionsItemSelected(item);

        } // switch
    } // function



    // For edit and delete
    // Shows he list with options
    @Override public void onCreateContextMenu(ContextMenu menu, View view, ContextMenu.ContextMenuInfo menuInfo){
        super.onCreateContextMenu(menu, view, menuInfo);

        //cast ContextMenu.ContextMenuInfo to AdapterView.AdapterContextMenuInfo since we're using an adapter
        AdapterView.AdapterContextMenuInfo adapterContextMenuInfo = (AdapterView.AdapterContextMenuInfo) menuInfo;

        //set the menu title
        menu.setHeaderTitle("Delete " );
        //add the choices to the menu
        menu.add(1, 1, 1, "Yes");
        menu.add(2, 2, 2, "No");
    }


    @Override public boolean onContextItemSelected(MenuItem item){
        //get the id of the item
        int itemId = item.getItemId();
        if (itemId == 1) { //if yes menu item was pressed
            //get the position of the menu item
            AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) item.getMenuInfo();
            //remove the hero
            DataClass.Cardio.remove(info.position);


            listAdapter.notifyDataSetChanged();
        }

        return true;
    }





}



  //  LinearLayout layout = new LinearLayout(MainActivity.this);
//                layout.setOrientation(LinearLayout.VERTICAL);
////create edit texts and add to layout
//                final EditText actName = new EditText(MainActivity.this);
//                actName.setHint("Book name");
//                layout.addView(actName);
//                final EditText url = new EditText(MainActivity.this);
//                url.setHint("Author name");
//                layout.addView(url);
//
//                //create alert dialog
//                AlertDialog.Builder dialog = new AlertDialog.Builder(MainActivity.this);
//                dialog.setTitle("Add workout");
//                dialog.setView(layout);
//                dialog.setPositiveButton("Save", new DialogInterface.OnClickListener() {
//                    @Override
//                    public void onClick(DialogInterface dialog, int which) {
//                        //get book name entered
//                        final String newActName = actName.getText().toString();
//                        final String newUrl = url.getText().toString();
//
//                        if (!newActName.isEmpty()) {
//                            //start realm write transaction
//                            DataClass DQ = new DataClass(newActName, newUrl);
//                            DataClass.Technical.add(DQ);
//                        }
//                    }
//                });
//                dialog.setNegativeButton("Cancel", null);
//                dialog.show();