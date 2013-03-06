/************************************************************************
** MAGICZOOM
************************************************************************/

/*
function oxDetailGallery(){
	
	// SETTINGS
	var zoomSettings = "zoom-position:inner;";
		
	$('#detail-pic a').addClass('MagicZoom');
	$('#detail-pic a').attr('id','MagicZoomer');
	$('#detail-pic a').attr('rel',zoomSettings);
	
	$('#otherPictures li a').attr('rel','zoom-id:MagicZoomer;'); // Einstellungen zum MagicZoom kommen hier her
	
	initMagicZoom();	
}
*/

/************************************************************************
** FANCYBOX
************************************************************************/

/*
function oxDetailGallery(){		
	
	// SETTINGS
	$('#detail-pic a').fancybox({
		// 'overlayColor'	:	'#ff0000',
		// 'centerOnScroll':	true
	});

    $('#fancy-zoom').fancybox({
        'overlayShow' : true,
        'centerOnScroll':	true,
        'autoScale' : true,
        'hideOnOverlayClick' : true
    });

	jQuery('#otherPictures ul li a').click(function(){
		var fancyzoom = jQuery(this).attr('href');
		var fancyimg = jQuery(this).attr('rev');
		
		jQuery('#detail-pic a img').attr('src',fancyimg);
		if(fancyzoom != ""){ jQuery('#detail-pic a').attr('href',fancyzoom); }
		
		return false;
	});
		
}
*/

/************************************************************************
** MAGICZOOM & FANCYBOX VIA [+]
************************************************************************/

/******
* Code fuer [+]-Button innerhalb von detailpic.tpl: 
* <a id="fancy-zoom" href="[{$oPictureProduct->getMasterZoomPictureUrl(1)}]">+</a>
******/
	
function oxDetailGallery(){
	
	var zoomSettings = "zoom-position:inner;";
		
	$('#detail-pic a').addClass('MagicZoom');
	$('#detail-pic a').attr('id','MagicZoomer');
	$('#detail-pic a').attr('rel',zoomSettings);
	
	$('#otherPictures ul li a').attr('rel','zoom-id:MagicZoomer;'); // Einstellungen zum MagicZoom kommen hier her
	
	
	// FANCYBOX ZOOMBUTTON
	jQuery('#otherPictures ul li a').click(function(){
		var fancyzoom = jQuery(this).attr('href');
		var fancyimg = jQuery(this).attr('rev');
		
		jQuery('#fancy-zoom').attr('src',fancyimg);
		if(fancyzoom != ""){ jQuery('#fancy-zoom').attr('href',fancyzoom); }
			
		return false;
	});
	
	$('#fancy-zoom').fancybox({
		'overlayShow' : true,
		'centerOnScroll':	true,
		'autoScale' : true,
		'hideOnOverlayClick' : true
	});
	
	initMagicZoom();
}	
	
	