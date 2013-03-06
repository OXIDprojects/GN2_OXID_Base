[{*
*** ACHTUNG!
*** Veraenderungen in diesem Template, koennen dazu fuehren,
*** dass fuer die Galerie zustaendige Scripte nicht mehr korrekt funktionieren!
*}]

<a id="fancy-zoom" href="[{$oPictureProduct->getMasterZoomPictureUrl(1)}]">+</a>

[{* article picture with zoom *}]
<div id="detail-pic">
    
    [{if $oPictureProduct->getMasterZoomPictureUrl(1) != ""}]<a href="[{$oPictureProduct->getMasterZoomPictureUrl(1)}]">
      [{elseif $oPictureProduct->getMasterZoomPictureUrl(2) != ""}]<a href="[{$oPictureProduct->getMasterZoomPictureUrl(2)}]">
      [{elseif $oPictureProduct->getMasterZoomPictureUrl(3) != ""}]<a href="[{$oPictureProduct->getMasterZoomPictureUrl(3)}]">
      [{elseif $oPictureProduct->getMasterZoomPictureUrl(4) != ""}]<a href="[{$oPictureProduct->getMasterZoomPictureUrl(4)}]">
      [{elseif $oPictureProduct->getMasterZoomPictureUrl(5) != ""}]<a href="[{$oPictureProduct->getMasterZoomPictureUrl(5)}]">
      [{elseif $oPictureProduct->getMasterZoomPictureUrl(6) != ""}]<a href="[{$oPictureProduct->getMasterZoomPictureUrl(6)}]">
      [{elseif $oPictureProduct->getMasterZoomPictureUrl(7) != ""}]<a href="[{$oPictureProduct->getMasterZoomPictureUrl(7)}]">
      [{else}] [{* do nothing *}]
    [{/if}]
    
        <img src="[{$oView->getActPicture()}]"  alt="[{$oPictureProduct->oxarticles__oxtitle->value|strip_tags}] [{$oPictureProduct->oxarticles__oxvarselect->value|strip_tags}]">
   
    [{if $oPictureProduct->getMasterZoomPictureUrl(1) != "" || $oPictureProduct->getMasterZoomPictureUrl(2) != "" || $oPictureProduct->getMasterZoomPictureUrl(3) != "" || $oPictureProduct->getMasterZoomPictureUrl(4) != "" || $oPictureProduct->getMasterZoomPictureUrl(5) != "" || $oPictureProduct->getMasterZoomPictureUrl(6) != "" || $oPictureProduct->getMasterZoomPictureUrl(7) != ""}]
        </a>
    [{/if}]
   
</div>

[{*if $oView->showZoomPics()}]
        [{gn2_oxscript include="js/widgets/oxmodalpopup.js" priority=10 }]
        [{gn2_oxscript add="$('#zoomTrigger').oxModalPopup({target:'#zoomModal'});"}]
        <a id="zoomTrigger" rel="nofollow" href="#">Zoom</a>
        [{gn2_oxscript include="js/libs/cloudzoom.js" priority=10}]
        [{gn2_oxscript add="$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();"}]
        <div class="picture">
            <a href="[{$oPictureProduct->getMasterZoomPictureUrl(1)}]" class="cloud-zoom" id="zoom1" rel="adjustY:-2, zoomWidth:'354', fixZoomWindow:'390', trImg:'[{$oViewConf->getImageUrl('dot.png')}]', loadingText:'[{oxmultilang ident="PAGE_DETAILS_ZOOM_LOADING"}]'">
                <img itemprop="image" src="[{$oView->getActPicture()}]" alt="[{$oPictureProduct->oxarticles__oxtitle->value|strip_tags}] [{$oPictureProduct->oxarticles__oxvarselect->value|strip_tags}]">
            </a>
        </div>
    [{else}]
        <div class="picture">
            <img itemprop="image" src="[{$oView->getActPicture()}]" alt="[{$oPictureProduct->oxarticles__oxtitle->value|strip_tags}] [{$oPictureProduct->oxarticles__oxvarselect->value|strip_tags}]">
        </div>
    [{/if*}]