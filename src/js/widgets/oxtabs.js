function oxTabs(){
	
	var duration = 500; // Dauer des "Wechsel"-Effekts
	
	jQuery('#detailTabs li a').click(function(){
		
		var a = $(this);
		var li = a.parent();
		var id = a.attr('href');
		
		if( !(li.hasClass('active')) ){
			
			jQuery('#detailTabs li').removeClass('active');
			li.addClass('active');
			
			jQuery('#detailTabContents .tabinfo').slideUp(duration);
			jQuery('#detailTabContents '+id).slideDown(duration);
			
		}
		
		return false;
	});

}