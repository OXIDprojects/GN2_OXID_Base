function initInit(){

	// Allgemeine "first" und "last" klassen, bei allen UL-Elementen
	$("ul li:first-child").addClass('first');
	$("ul li:last-child").addClass('last');

	// Wenn man in das Suchfeld klickt, wird der Text automatisch geloescht
	$('form.search input.textbox').click(function(){
		$(this).attr('value',"");
	});


	///////////////////////////////////////////////////////////
	// 2-COL Dropdown
	///////////////////////////////////////////////////////////

	var listOddMargin = 25; // Abstand zwischen den zwei Columns
	var minListpoints = 3; // Mindestanzahl von Listenpunkten für Zweizeiligkeit

	$('#navigation li ul').each(function(){

		if( $(this).find('li').size() > minListpoints ){

			$(this).addClass('dropdown-col2');

			var dropDownCount = 0;
			var dropDownWidth1 = 0;
			var dropDownWidth2 = 0;

			$(this).find('li').each(function(){

				dropDownCount = (dropDownCount + 1) % 2;

				if(dropDownCount > 0){ // odd

					$(this).addClass('listCol-odd');
					var liWidth = $(this).width() + 1;
					if(liWidth > dropDownWidth1){ dropDownWidth1 = liWidth; }

				} else { // even

					$(this).addClass('listCol-even');
					var liWidth = $(this).width() + 1;
					if(liWidth > dropDownWidth2){ dropDownWidth2 = liWidth; }
				}
			});

			$(this).find('li.listCol-odd').attr('style', 'width:'+dropDownWidth1+'px; margin: 0 '+listOddMargin+'px 0 0;');
			$(this).find('li.listCol-even').attr('style', 'width:'+dropDownWidth2+'px; margin: 0;');

			ulWidth = dropDownWidth1 + dropDownWidth2 + listOddMargin;

			$(this).attr('style', 'width:'+ulWidth+'px; display: none; left: 0;');

		} else {
			$(this).attr('style', 'display: none; left: 0;');
		}
	});


	///////////////////////////////////////
	// NAVIGATION DROPDOWN SLIDE
	///////////////////////////////////////


	$('#navigation li').hoverIntent({

		sensitivity: 3,
		over: function(){ var dropdown = $(this).find('ul'); if(dropdown.size() > 0){ dropdown.slideDown(500); } },
		out: function(){ var dropdown = $(this).parent().find('ul'); if(dropdown.size() > 0){ dropdown.slideUp(500); } }

	});


	///////////////////////////////////////
	// ARTICLEBOX
	///////////////////////////////////////
/*
	$('ul.js-articleBox li').mouseover(function(){

		var box = $(this).parent();
		var img = $(this).find('div.articleBoxImage');

		if(img.is(':hidden')){

			box.find('div.articleBoxImage').slideUp();
			box.find('li.active').removeClass('active');

			$(this).addClass('active');
			img.slideDown();

		}

	});
*/

    var clickBlock = false;

	$('ul.js-articleBox li a.articleTitle').click(function(){

        if(!clickBlock){
            clickBlock = true;

            var duration = 500; // Zeit des Ein- und Ausklappens (in Millisekunden)

            var box = $(this).parent().parent();
            var img = $(this).parent().find('div.articleBoxImage');
            var button = $(this).parent().find('.goToProduct');

            if(img.is(':hidden')){

                box.find('div.articleBoxImage').slideUp(duration);
                box.find('li.active').removeClass('active');
                box.find('.goToProduct').slideUp(duration);

                $(this).parent().addClass('active');
                img.slideDown(duration);
                button.slideDown(duration);

            } else {
                img.slideUp(duration);
                button.slideUp(duration);
                $(this).parent().removeClass('active');
            }

            $(this).trigger('blur');

            clickBlock = false;

            return false;
        }

	});


	///////////////////////////////////////
	// PLAIN POPUPS
	///////////////////////////////////////

	$('.plainPopUp').fancybox({
		'type' : 'iframe',
		'width' : 700,
		'height' : 525,
		'scrolling' : 'auto',
		'overlayShow' : true,
		'centerOnScroll':	true,
		'autoScale' : false,
		'hideOnOverlayClick' : true
	});

}

/*
 * INIT AUSFÜHREN
 * Führe init nur aus, wenn man sich NICHT auf der Detailseite befindet.
 * Die Detail-Seite ruft "initInit()" im Template "details.tpl".
 * Dies ist wichtig, damit die Scripte auch nach einem Ajax-Load (Variantenwahl) funktioniert.
 */
$(document).ready(function(){
    if( $('#details').size() == 0 ){
        initInit();
    }
});