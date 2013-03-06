[{capture append="oxidBlock_content"}]
	[{assign var="oDetailsProduct" value=$oView->getProduct()}]
	[{assign var="oPictureProduct" value=$oView->getPicturesProduct()}]
	[{assign var="currency" value=$oView->getActCurrency()}]
	[{assign var="actCategory" value=$oView->getActiveCategory()}]

    [{if $oView->getPriceAlarmStatus() == 1}]
        [{assign var="_statusMessage1" value="PAGE_DETAILS_THANKYOUMESSAGE1"|oxmultilangassign|cat:" "|cat:$oxcmp_shop->oxshops__oxname->value}]
        [{assign var="_statusMessage2" value="PAGE_DETAILS_THANKYOUMESSAGE2"|oxmultilangassign|cat:" "}]
        [{assign var="_statusMessage3" value="PAGE_DETAILS_THANKYOUMESSAGE3"|oxmultilangassign|cat:" "|cat:$oView->getBidPrice()|cat:" "|cat:$currency->sign|cat:" "}]
        [{assign var="_statusMessage4" value="PAGE_DETAILS_THANKYOUMESSAGE4"|oxmultilangassign}]
        [{include file="message/success.tpl" statusMessage=`$_statusMessage1``$_statusMessage2``$_statusMessage3``$_statusMessage4`}]
    [{elseif $oView->getPriceAlarmStatus() == 2}]
        [{assign var="_statusMessage" value="PAGE_DETAILS_WRONGVERIFICATIONCODE"|oxmultilangassign}]
        [{include file="message/error.tpl" statusMessage=$_statusMessage}]
    [{elseif $oView->getPriceAlarmStatus() === 0}]
        [{assign var="_statusMessage1" value="PAGE_DETAILS_NOTABLETOSENDEMAIL"|oxmultilangassign|cat:"<br> "}]
        [{assign var="_statusMessage2" value="PAGE_DETAILS_VERIFYYOUREMAIL"|oxmultilangassign}]
        [{include file="message/error.tpl" statusMessage=`$_statusMessage1``$_statusMessage2`}]
    [{/if}]
    
    [{* Pager *}]
    <div id="detailsItemsPager">
        <div class="pager">
        [{if $actCategory->prevProductLink}]<a id="linkPrevArticle" class="prev" href="[{$actCategory->prevProductLink}]">[{oxmultilang ident="DETAILS_LOCATOR_PREVIUOSPRODUCT"}]</a>[{/if}]
        <span class="page">
           [{oxmultilang ident="DETAILS_LOCATOR_PRODUCT"}] [{$actCategory->iProductPos}] [{oxmultilang ident="DETAILS_LOCATOR_FROM"}] [{$actCategory->iCntOfProd}]
        </span>
        [{if $actCategory->nextProductLink}]<a id="linkNextArticle" href="[{$actCategory->nextProductLink}]" class="next">[{oxmultilang ident="DETAILS_LOCATOR_NEXTPRODUCT"}]</a>[{/if}]
    	</div>
    	<a id="overviewLink" href="[{$actCategory->toListLink}]" class="overviewLink">[{oxmultilang ident="WIDGET_BREADCRUMB_OVERVIEW"}]</a>
    </div>
    
    <div id="details">
		    [{include file="page/details/inc/details.tpl"}]
    </div>
    
    [{insert name="oxid_tracker" title="DETAILS_PRODUCTDETAILS"|oxmultilangassign product=$oDetailsProduct cpath=$oView->getCatTreePath() }]
[{/capture}]

[{include file="layout/page.tpl" sidebar="Left"}]