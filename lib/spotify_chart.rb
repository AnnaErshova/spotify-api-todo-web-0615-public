require 'json'
require 'open-uri'

class SpotifyChart

  BASE_URL = "http://charts.spotify.com/api/tracks/most_streamed"
  #copied straight from the spec

  def get_url(region)
    # return a string that is the BASE_URL/region/weekly/latest
    "#{BASE_URL}/#{region}/weekly/latest"
  end

  def get_json(url)
    JSON.load(open(url))
    # load json given a url here
    # refer to the references if you have questions about this
    # JSON.load takes a source that is a string or ID of an object
  end

  def get_first_track_info(music_hash)
    string = ""
    music_hash.each do |tracks, track_details| #'details' is going to be an array
      string = "#{track_details.first["track_name"]} by #{track_details.first["artist_name"]} from the album #{track_details.first["album_name"]}"
      # does top one imply it is no. 1 in the chart?
    end
    string
    # or do music_hash.values or refer to tracks key directly -- but I suppose there could be more keys we are not seeing

=begin
example music_hash:
{  
   "tracks" => [  
     {  
       "date"         =>"2014-09-14",
       "track_name"   =>*"All About That Bass"*,
       "artist_name"  =>*"Meghan Trainor"*,
       "album_name"   =>*Title"*
     },
     {  
       "date"         =>"2014-09-14",
       "track_name"   =>"Break Free",
       "artist_name"  =>"Ariana Grande",
       "album_name"   =>"Break Free"
     }
   ]
 }

 given a hash, like the one above, this method should *return* a string like:
 <track name> by <artist name> from the <album name> => when get to the hash, use those as keys to return values
the track name, artist name, and album name should be the first track in the
 tracks array => call.first on the array that 1st returned
=end
  end

  def most_streamed(region)
    # call on #get_url here, where preference is the string *'most_streamed'*
    # and set it equal to a variable
    most_streamed = get_url(region)
    get_first_track_info(get_json(most_streamed))

    # call on #get_json here, using the string that get_url returns
    # finally, call on #get_first_track_info using the 
    # hash that #get_json returns <= nest those
  end
end

