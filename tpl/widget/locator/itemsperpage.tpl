[{assign var="_additionalParams" value=$oView->getAdditionalParams()}]
[{gn2_oxscript include="js/widgets/oxdropdown.js" priority=10 }]
[{gn2_oxscript add="$('div.dropDown p').oxDropDown();"}]
<div class="dropDown js-fnLink" id="itemsPerPage">
    <p class="selectorLabel">
        <label>[{oxmultilang ident="WIDGET_PRODUCT_LOCATOR_ARTICLE_PER_PAGE"}]</label>
        <span class="selected">
            [{if $oViewConf->getArtPerPageCount()}]
                [{$oViewConf->getArtPerPageCount()}]
            [{else}]
                [{oxmultilang ident="WIDGET_LOCATOR_CHOOSE"}]
            [{/if}]
        </span>
    </p>
    <ul class="drop">
        [{foreach from=$oViewConf->getNrOfCatArticles() item=iItemsPerPage}]
            <li><a href="[{$oView->getLink()|oxaddparams:"ldtype=$listType&amp;_artperpage=$iItemsPerPage&amp;pgNr=0&amp;$_additionalParams"}]" rel="nofollow" [{if $oViewConf->getArtPerPageCount() == $iItemsPerPage }] class="selected"[{/if}]>[{$iItemsPerPage}]</a></li>
        [{/foreach}]
    </ul>
</div>