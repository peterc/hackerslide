function updateItems(e, ui) {
  // a poor man's updating status indicator
  $('#items').css('background-color', '#f6f6ef');
		  
  $.getJSON('/data/' + $('select#slider').val() + '.json',function(json){
    if (json) {
      $('#items').css('background-color', 'inherit');
	  
      var display = '<ol>';
            
      $.each(json,function(i,item){
        // If the item is a local link on HN, prepend the HN URL
		    if (!/^http/.test(item.href)) {
			    item.href = 'http://news.ycombinator.com/' + item.href;
		    }

	      var klasses = '';
        if ((item.hours_ago == 0) || item.is_new) {
	        klasses = 'new';
        };
        
        display += '<li class="item ' + klasses + '"><a href="' + item.href + '">' + item.title + '</a>';
        
		    if (item.site) { 
			    display += ' <span class="site">(' + item.site + ')</span>';
		    }
		    
		    display += '<br /><div class="sub">' + item.score + ' points by <a href="http://news.ycombinator.com/user?id=' + item.user + '">' + item.user + '</a> ' + item.hours_ago + ' hours ago | <a href="http://news.ycombinator.com/item?id=' + item.item_id + '">' + item.comments + ' comments</a></div></li>';
      });
            
      display += '</ol>';
            
      $('#items').html(display);
    };
  });
}
		
