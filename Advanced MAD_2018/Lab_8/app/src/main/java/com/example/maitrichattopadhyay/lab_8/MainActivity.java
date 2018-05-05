package com.example.maitrichattopadhyay.lab_8;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class MainActivity extends Activity {
    private EditText emailText;
    private TextView responseView;
    private TextView nameView;
    private ProgressBar progressBar;
    private ImageView photoImageView;

     private static final String API_KEY = "YMKjwyqwokMIBiAJriOQfP7hyAT2ANDm";
    private static final String API_URL = "https://api.fullcontact.com/v2/person.json?";

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // setting the lables
        responseView = (TextView) findViewById(R.id.responseView);
        nameView = (TextView) findViewById(R.id.nameView);
        emailText = (EditText) findViewById(R.id.emailText);
        progressBar = (ProgressBar) findViewById(R.id.progressBar);
        photoImageView = (ImageView) findViewById(R.id.imageView);


        Button queryButton = (Button) findViewById(R.id.queryButton);
        queryButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String email = emailText.getText().toString();  // getting the text from the text field
                new FeedTask().execute(email);  // creating instance of the new class agd giving it the email
            }
        });
    } //  on create

    class FeedTask extends AsyncTask<String, Void, String>  // inner class
    {

        private Exception exception;

        //invoked on the UI thread before the task is executed
        protected void onPreExecute()  // function used for any setup
        {
            progressBar.setVisibility(View.VISIBLE);  // only progress bar is visible after hiting the search
            responseView.setText(""); // sets the text filds as empty as soon as you hit search
            nameView.setText("");
            photoImageView.setImageResource(android.R.color.transparent);  // clearing out an image // invisible
        }

        //invoked on the background thread immediately after onPreExecute() finishes executing
        protected String doInBackground(String... args)
        {
            String email = args[0]; //email address being searched
            try
            {
                //create full URL for search
                URL url = new URL(API_URL + "email=" + email + "&apiKey=" + API_KEY);  // puting the url in the browzer

                //create open connection to URL
                HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
                try
                {
                    //create an InputStreamReader with the JSON stream
                    InputStreamReader is = new InputStreamReader(urlConnection.getInputStream());
                    //convert the byte stream to a character stream using BufferedReader
                    BufferedReader bufferedReader = new BufferedReader(is);
                    StringBuilder stringBuilder = new StringBuilder();
                    String line;
                    //loop through the character stream and build a sequence of characters using StringBuilder
                    while ((line = bufferedReader.readLine()) != null)  // read the buffered reader line by line
                    {
                        stringBuilder.append(line).append("\n");
                    }
                    bufferedReader.close();
                    //convert character sequence to a String
                    return stringBuilder.toString();
                }
                finally
                {
                    //disconnect the http connection
                    urlConnection.disconnect();
                }
            }
            catch (Exception e)
            {
                Log.e("ERROR", e.getMessage(), e);
                return null;
            }
        }

        //invoked on the UI thread after the background computation finishes
        //response is the result of doInBackground
        protected void onPostExecute(String response)   // the JSON is oarced here
        {
            //response should be a String with JSON objects
            // try putting this inside a try catch to prevent the app from crashing when null
            if (response == null) {
                response = "THERE WAS AN ERROR";
            }
            progressBar.setVisibility(View.GONE);
            Log.i("INFO", response);

            //parse JSON object
            try {
                JSONObject object = (JSONObject) new JSONTokener(response).nextValue();
                JSONObject contact = object.getJSONObject("contactInfo");
                String name = contact.getString("fullName");
                nameView.setText(name);

                JSONArray photoarray = object.getJSONArray("photos");
                JSONObject photos = photoarray.getJSONObject(0);
                String photo = photos.getString("url");
                new DownloadImageTask(photoImageView).execute(photo);   // this is am=nother class which downloads the image

                JSONArray socialprofiles = object.getJSONArray("socialProfiles");
                for (int i = 0; i < socialprofiles.length(); i++) // loop through all the profiles
                {
                    JSONObject socialprofile = socialprofiles.getJSONObject(i);
                    // geting the tyoe and the url
                    String social = socialprofile.getString("type");
                    String url = socialprofile.getString("url");
                    responseView.append(social + " \t" + url + "\n");  // keep appending. Not over writing
                }
            } catch (JSONException e)
            {
                e.printStackTrace();
            }
        }
    }// class Feedtask

    private class DownloadImageTask extends AsyncTask<String, Void, Bitmap> {
        ImageView bmImage;

        public DownloadImageTask(ImageView bmImage) {
            this.bmImage = bmImage;
        }
        protected Bitmap doInBackground(String... urls) {
            String urldisplay = urls[0];

            Bitmap mIcon = null;
            try {
                InputStream in = new java.net.URL(urldisplay).openStream();
                //creates a bitmap from the input stream
                mIcon = BitmapFactory.decodeStream(in);
            } catch (Exception e) {
                Log.e("Error", e.getMessage());
                e.printStackTrace();
            }
            return mIcon;
        }

        protected void onPostExecute(Bitmap result)
        {
            bmImage.setImageBitmap(result);  // this updates rthe image and now we can see it!! yay
        }
    }
}