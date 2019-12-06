---
layout: post
title: "Android Apps"
date: 2019-04-01
---
## Pokemon Team Builder

This [project](https://github.com/mwyoung/final-project-team-pikachu) focused on building
an application to use a JSON API to get data and display it to a user. The people involved
in creating this application include Andrew Ekstedt, Trevor Hammock and Miles Young.

In particular, the Android app features that were used include multiple activities (in
building a team, displaying a information about a Pokémon), a 3rd-party API (PokéAPI),
lifecycle methods (ViewModel), SharedPreferences (list sort), SQLite (teams), a polished
UI, and can launch the current Pokémon to have more information from the web.

## Example
<img style="max-width:100; display: block; margin:0 auto;"
src="https://user-images.githubusercontent.com/10273995/54655742-470fd500-4a80-11e9-8f91-93e52ef454ff.gif">

## Weather App

This app was created to be able to work with the OpenWeatherMap API. However, since it was
a school project it is in a private repository so it can not be copied. Below is some code
snippits that were used in creating the project.

### Canceling toasts
This code implements a method when clicking part of a text list to remove the toast
message if displaying, and show a new toast method.
{% highlight java %}
public class MainActivity extends AppCompatActivity implements WeatherAdapter.OnWeatherClickListener {
    private Toast toast;
    ...
    @Override
    public void onClickChange(int position) {
        if(toast!=null){ //if still open
            toast.cancel(); //cancel toast
        }
        toast = Toast.makeText(this, textList.get(position), Toast.LENGTH_LONG);
        toast.show();    //show toast
    }
}

public class adapter ... {
    private clickListner cL;
    ...
    class viewHolder extends RecyclerView.ViewHolder implements View.OnClickListener{
        ...
        @Override
        public void onClick(View v) {
            cL.onClickChange(getAdapterPosition());  //get position
        }
    }
}
{% endhighlight %}

### Network Requests
One easy way to do network requests is to use [okhttp](https://github.com/square/okhttp).
{% highlight java %}
public class NetworkUtils {
    private static final OkHttpClient mHTTPClient = new OkHttpClient();
    public static String doHTTPGet(String url){
        Request request = new Request.Builder().url(url).build();
        Response response = mHTTPClient.newCall(request).execute();
    }
}
{% endhighlight %}

### Json Formatting
Another easy program to use is [gson](https://github.com/google/gson) to deseralize JSON
into Java Objects.
{% highlight java %}
public class JsonUtils {
    //for JSON parsing
    static class overall {
        listItem[] list;
    }
    static class listItem{
        String
        Int foo;
        otherClass[] bar; //collection of items
    }
    public static ArrayList<item> parseJSON(String JSONstr) {
        Gson gson = new Gson();
        overall results = gson.fromJson(JSONstr, overall.class);
        if (results != null && results.list != null) {
            ArrayList<ForecastItem> forecastItems = new ArrayList<>();
            SimpleDateFormat dateParser = new SimpleDateFormat(DATE_FORMAT, Locale.getDefault());
            dateParser.setTimeZone(TimeZone.getTimeZone(TIME_ZONE));
            //loop to get each item
            for (listItem listItem : results.list) {
                Item item = new Item();
                item.barVal = listItem.bar[0];
            }
            return forecastItems;
        } else {
            return null;
        }
    }
}
{% endhighlight %}

### Hidden API Key
For security reasons, it is good to [hide an api
key](https://medium.com/code-better/hiding-api-keys-from-your-android-repository-b23f5598b906)
 from an Android repo. This can be done by setting the key in gradle.properties as
Text\_Api="&lt;key&gt;" and then adding the file to .gitignore.

Then in build.gradle in the buildTypes, add the values buildConfigField('String',
'ApiKey', Text\_Api) and resValue('string', 'api\_key', Text\_Api). Then, this can be
accessed with private final static String TEXT\_APPID = BuildConfig.ApiKey;.
