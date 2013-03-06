[{include file="page/details/inc/tabs.tpl"}]

[{*include file="page/details/inc/info.tpl"*}]

[{if $oView->isReviewActive() }]
    <div id="reviews">
    	<h4>[{oxmultilang ident="DETAILS_PRODUCTREVIEW"}]</h4>
    	[{include file="widget/reviews/reviews.tpl"}]
    </div>
[{/if}]