[{*
*** ACHTUNG!
*** Veraenderungen in diesem Template, koennen dazu fuehren,
*** dass fuer die Galerie zustaendige Scripte nicht mehr korrekt funktionieren!
*}]

[{assign var="rowLastValue" value="4"}]

[{if $oView->morePics()}]
<div id="otherPictures">
    <ul>
    [{foreach from=$oView->getIcons() key=iPicNr item=oArtIcon name=sMorePics}]
		
		[{assign var="iteration" value=$smarty.foreach.sMorePics.iteration}]
		
		[{* Berechnung ob es sich um letztes Produkt der Reihe handelt *}]
		[{if $iteration % $rowLastValue == 0 && $iteration > 0 && $rowLastValue > 0}]
			[{assign var="rowLast" value=true}]
		[{else}]
			[{assign var="rowLast" value=false}]
		[{/if}]

        <li[{if $rowLast}] class="rowLast"[{/if}]>
            <a id="morePics_[{$smarty.foreach.sMorePics.iteration}]" class="morePics" href="[{$oPictureProduct->getMasterZoomPictureUrl($iPicNr)}]" rev="[{$oPictureProduct->getPictureUrl($iPicNr)}]">
                <span class="artIcon"><img src="[{$oPictureProduct->getIconUrl($iPicNr)}]" alt=""></span>
            </a>
        </li>
    [{/foreach}]
    </ul>
</div>
[{/if}]