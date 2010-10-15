# Fetch items from Hacker News each hour and store them in JSON files

require 'rubygems'
require 'json'
require 'ruby-hackernews'

# Fetch items from front page of Hacker News
  items = Entry.all

# Turn the items into a nicer array of hashes
  items.map! do |item|
    { :title => item.link.title,
      :site => item.link.site,
      :href => item.link.href,
      :number => item.number, 
      :score => item.voting.score, 
      :user => item.user.name,
      :hours_ago => ((Time.now.to_i - item.time.to_i) / 3600).to_i,
      :comments => item.instance_variable_get(:@comments_info).count,
      :item_id => item.instance_variable_get(:@comments_info).page[/\d+/],
      :is_new => (Time.now.to_i - item.time.to_i) < 3600 }    # eugh!
  end

# Get the current time in GMT and build some filenames
  time = Time.now.gmtime
  filename = File.dirname(__FILE__) + "/public/data/"
  now_filename = filename + "now.json"
  filename += "#{time.year}-#{time.month}-#{time.mday}"
  daily_filename = filename + ".json"
  hourly_filename = filename + "-#{sprintf("%.2d", Time.now.hour)}.json"

# Save the items in JSON format for later recall
  puts "Writing #{now_filename}"
  File.open(now_filename, "w") { |f| f.puts items.to_json }
  
  unless File.exist?(daily_filename)
    puts "Writing #{daily_filename}"
    File.open(daily_filename, "w") { |f| f.puts items.to_json }
  end
  
  unless File.exist?(hourly_filename)
    puts "Writing #{hourly_filename}"
    File.open(hourly_filename, "w") { |f| f.puts items.to_json }
  end