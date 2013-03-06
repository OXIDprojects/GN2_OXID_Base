[{* CONFIG - Artikel pro Reihe für verschiedene Listentypen *}]

[{* Galerie zweispaltig *}]
[{if $listtype == "infogrid"}]
	[{assign var="rowLastValue" value="2"}][{* Hier eintragen, wie viele Artikel nebeneinander angezeigt werden sollen *}]

[{* Galerie *}]
[{elseif $listtype == "grid"}]
	[{assign var="rowLastValue" value="4"}]

[{* Liste *}]
[{elseif $listtype == "line"}]
	[{assign var="rowLastValue" value="1"}]

[{* Sonstige *}]
[{else}]
	[{assign var="rowLastValue" value="4"}]

[{/if}]

[{* Berechnung ob es sich um letztes Produkt der Reihe handelt *}]
[{if $iteration % $rowLastValue == 0 && $iteration > 0 && $rowLastValue > 0}]
	[{assign var="rowLast" value=true}]
[{else}]
	[{assign var="rowLast" value=false}]
[{/if}]

[{block name="widget_product_listitem_infogrid"}]
<li class="productData[{if $rowLast}] productRowLast[{/if}]">
    [{assign var="currency" value=$oView->getActCurrency()}]
    [{if $showMainLink}]
        [{assign var='productLink' value=$product->getMainLink()}]
    [{else}]
        [{assign var='productLink' value=$product->getLink()}]
    [{/if}]
    [{assign var="aVariantSelections" value=$product->getVariantSelections(null,null,1)}]
    [{assign var="blShowToBasket" value=true}] [{* tobasket or more info ? *}]
    [{if $blDisableToCart || $product->isNotBuyable()||($aVariantSelections&&$aVariantSelections.selections)||$product->hasMdVariants()||($oViewConf->showSelectListsInList() && $product->getSelections(1))||$product->getVariants()}]
        [{assign var="blShowToBasket" value=false}]
    [{/if}]

    <form name="tobasket[{$testid}]" [{if $blShowToBasket}]action="[{ $oViewConf->getSelfActionLink() }]" method="post"[{else}]action="[{$productLink}]" method="get"[{/if}]>
        [{$oViewConf->getNavFormParams()}]
        [{$oViewConf->getHiddenSid()}]
        <input type="hidden" name="pgNr" value="[{$oView->getActPage()}]">
        [{if $recommid}]
            <input type="hidden" name="recommid" value="[{$recommid}]">
        [{/if}]
        [{oxhasrights ident="TOBASKET"}]
            [{if $blShowToBasket}]
                <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
                [{if $owishid}]
                    <input type="hidden" name="owishid" value="[{$owishid}]">
                [{/if}]
                [{if $toBasketFunction}]
                    <input type="hidden" name="fnc" value="[{$toBasketFunction}]">
                [{else}]
                  <input type="hidden" name="fnc" value="tobasket">
                [{/if}]
                <input type="hidden" name="aid" value="[{$product->oxarticles__oxid->value}]">
                [{if $altproduct}]
                    <input type="hidden" name="anid" value="[{$altproduct}]">
                [{else}]
                    <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
                [{/if}]
                <input type="hidden" name="am" value="1">
            [{/if}]
        [{/oxhasrights}]

    [{block name="widget_product_listitem_infogrid_gridpicture"}]
        <div class="pictureBox gridPicture">
            <a href="[{$productLink}]" title="[{$product->oxarticles__oxtitle->value}]">
            	<img src="[{$product->getThumbnailUrl()}]" alt="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
        	</a>
        </div>
    [{/block}]

    <div class="listDetails">
        [{block name="widget_product_listitem_infogrid_titlebox"}]
            <div class="titleBox">
                <a id="[{$testid}]" href="[{$productLink}]" class="title" title="[{$product->oxarticles__oxtitle->value}]">
                    [{*Ungekuerzter Titel*}][{* $product->oxarticles__oxtitle->value }] [{$product->oxarticles__oxvarselect->value *}]
                    [{*Gekuerzter Titel ohne Variante*}]	[{ $product->oxarticles__oxtitle->value|truncate:40:" ...":false}]

                    [{* $product->oxarticles__oxvarselect->value *}]
                </a>
            </div>
        [{/block}]

		[{block name="widget_product_listitem_infogrid_shortdescription"}]
			<p class="shortDescription">[{$product->oxarticles__oxshortdesc->value|truncate:50:" ...":false}]</p>
		[{/block}]

        [{block name="widget_product_listitem_infogrid_selections"}]
                <div class="selectorsBox">
                    [{if $aVariantSelections && $aVariantSelections.selections}]
                        <div id="variantselector_[{$testid}]" class="selectorsBox js-fnSubmit">
                            [{foreach from=$aVariantSelections.selections item=oSelectionList key=iKey}]
                                [{include file="widget/product/selectbox.tpl" oSelectionList=$oSelectionList sJsAction="js-fnSubmit"}]
                            [{/foreach}]
                        </div>
                    [{elseif $oViewConf->showSelectListsInList()}]
                        [{assign var="oSelections" value=$product->getSelections(1)}]
                        [{if $oSelections}]
                            <div id="selectlistsselector_[{$testid}]" class="selectorsBox js-fnSubmit">
                                [{foreach from=$oSelections item=oList name=selections}]
                                    [{include file="widget/product/selectbox.tpl" oSelectionList=$oList sFieldName="sel" iKey=$smarty.foreach.selections.index blHideDefault=true sSelType="seldrop" sJsAction="js-fnSubmit"}]
                                [{/foreach}]
                            </div>
                        [{/if}]
                    [{/if }]
                </div>
        [{/block}]

           <div class="priceBox">
                <div class="content">
                    [{if $oViewConf->getShowCompareList()}]
                        [{oxid_include_dynamic file="widget/product/compare_links.tpl" testid="_`$testid`" type="compare" aid=$product->oxarticles__oxid->value anid=$altproduct in_list=$product->isOnComparisonList() page=$oView->getActPage()}]
                    [{/if}]
                    [{block name="widget_product_listitem_infogrid_price"}]
                        [{oxhasrights ident="SHOWARTICLEPRICE"}]

                            [{assign var=tprice value=$product->getTPrice()}]
                            [{assign var=price value=$product->getPrice()}]

                            [{if $tprice && $tprice->getBruttoPrice() > $price->getBruttoPrice()}]
                                <span class="oldPrice">[{oxmultilang ident="WIDGET_PRODUCT_PRODUCT_REDUCEDFROM"}] <del>[{$product->getFTPrice()}] [{$currency->sign}]</del></span>
                            [{/if}]

                            [{block name="widget_product_listitem_infogrid_price_value"}]
                                [{if $product->getFPrice()}]
                                    <span class="price">[{if !($product->hasMdVariants() || ($oViewConf->showSelectListsInList() && $product->getSelections(1)) || $product->getVariantList())}] [{else}][{oxmultilang ident="priceFrom"}] [{/if}] [{$product->getFPrice()}] [{$currency->sign}] *</span>
                                [{/if}]
                            [{/block}]

                            [{if $product->getPricePerUnit()}]
                                <span id="productPricePerUnit_[{$testid}]" class="pricePerUnit">
                                    [{$product->oxarticles__oxunitquantity->value}] [{$product->getUnitName()}] | [{$product->getPricePerUnit()}] [{$currency->sign}]/[{$product->getUnitName()}]
                                </span>
                            [{elseif $product->oxarticles__oxweight->value  }]
                                <span id="productPricePerUnit_[{$testid}]" class="pricePerUnit">
                                    <span title="weight">[{oxmultilang ident="WIDGET_PRODUCT_PRODUCT_ARTWEIGHT"}]</span>
                                    <span class="value">[{$product->oxarticles__oxweight->value}] [{oxmultilang ident="WIDGET_PRODUCT_PRODUCT_ARTWEIGHT2"}]</span>
                                </span>
                            [{/if }]
                        [{/oxhasrights}]
                    [{/block}]
                </div>
            </div>
            [{block name="widget_product_listitem_infogrid_tobasket"}]
                <div class="buttonBox">
                    [{if $blShowToBasket}]
                        [{oxhasrights ident="TOBASKET"}]
                            <button type="submit" class="submitButton largeButton">[{oxmultilang ident="WIDGET_PRODUCT_PRODUCT_ADDTOCART"}]</button>
                        [{/oxhasrights}]
                    [{else}]
                        <a class="submitButton largeButton" href="[{ $productLink }]" >[{oxmultilang ident="WIDGET_PRODUCT_PRODUCT_MOREINFO"}]</a>
                    [{/if}]
                    [{if $removeFunction && (($owishid && ($owishid==$oxcmp_user->oxuser__oxid->value)) || (($wishid==$oxcmp_user->oxuser__oxid->value)) || $recommid) }]
                        <button triggerForm="remove_[{$removeFunction}][{$testid}]" type="submit" class="submitButton largeButton removeButton" title="[{oxmultilang ident="WIDGET_PRODUCT_PRODUCT_REMOVE"}]"><span>[{oxmultilang ident="WIDGET_PRODUCT_PRODUCT_REMOVE"}]</span></button>
                    [{/if}]
                </div>
            [{/block}]
        </div>
    </form>

    [{if $removeFunction && (($owishid && ($owishid==$oxcmp_user->oxuser__oxid->value)) || (($wishid==$oxcmp_user->oxuser__oxid->value)) || $recommid) }]
        [{gn2_oxscript include="js/widgets/oxlistremovebutton.js" priority=10 }]
		[{gn2_oxscript add="$('button.removeButton').oxListRemoveButton();"}]

        <form action="[{$oViewConf->getSelfActionLink()}]" method="post" id="remove_[{$removeFunction}][{$testid}]">
            <div>
                [{ $oViewConf->getHiddenSid() }]
                <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
                <input type="hidden" name="fnc" value="[{$removeFunction}]">
                <input type="hidden" name="aid" value="[{$product->oxarticles__oxid->value}]">
                <input type="hidden" name="am" value="0">
                <input type="hidden" name="itmid" value="[{$product->getItemKey()}]">
                [{if $recommid}]
                    <input type="hidden" name="recommid" value="[{$recommid}]">
                [{/if}]
            </div>
        </form>
    [{/if}]

</li>
[{/block}]