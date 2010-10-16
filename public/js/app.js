// welcome to the little javascript shop of horrors
// i intend to read one of those awesome tutorials showing how to do "modern" javascript some day..

function updateItems(e, ui) {
  // a poor man's updating status indicator
  // $('#items').css('background-color', '#f6f6ef'); (Idea: Display overlay and fade)
		  
  $.getJSON('/data/' + $('select#slider').val() + '.json',function(json){
    if (json) {
      $('#items').css('background-color', 'inherit');
	  
			var display = "";
            
      $.each(json,function(i,item){
        // If the item is a local link on HN, prepend the HN URL
		    if (!/^http/.test(item.href)) {
			    item.href = 'http://news.ycombinator.com/' + item.href;
		    }

	      var klasses = ' ';
	      // Once enough days have been crawled with the updated crawler, just use is_new.. checking the hour count is a temporary hack
        if ((item.hours_ago < 2) || item.is_new) {
	        klasses = klasses + 'new';
        };

        display += '<li data-id="' + item.item_id + '" class="item' + klasses + '"><div class="container' + klasses + '"><a href="' + item.href + '">' + item.title + '</a>';
        
		    if (item.site) { 
			    display += ' <span class="site">(' + item.site + ')</span>';
		    }
		    
		    display += '<br /><div class="sub">' + item.score + ' points by <a href="http://news.ycombinator.com/user?id=' + item.user + '">' + item.user + '</a> ' + item.hours_ago + ' hours ago | <a href="http://news.ycombinator.com/item?id=' + item.item_id + '">' + item.comments + ' comments</a></div></div></li>';
      });
            
      $('#data').html(display);
      $('#items').quicksand($("#data > li"));
    };
  });
}
		
