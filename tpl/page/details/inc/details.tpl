[{gn2_oxscript add="initInit();"}]

[{* Produkt Headline > in productmain.tpl
[{assign var="sPageHeadTitle" value=$oDetailsProduct->oxarticles__oxtitle->value|cat:' '|cat:$oDetailsProduct->oxarticles__oxvarselect->value}]
<h2 class="pageHead detailsHead">[{$sPageHeadTitle}]</h2>
*}]

[{* Produktinformationen *}]
<div id="detailsMain">
    [{include file="page/details/inc/productmain.tpl"}]
</div>

[{* Zusatzinformationen *}]
<div id="detailsRelated" class="relatedInfo">
	[{include file="page/details/inc/productrelated.tpl"}]
	[{include file="page/details/inc/other_products.tpl" }]
</div>