[{gn2_oxscript add="$('a.js-external').attr('target', '_blank');"}]
[{assign var="currency" value=$oView->getActCurrency()}]
[{foreach from=$oView->getBargainArticleList() item=product name=bargainList}]
[{if $smarty.foreach.bargainList.first}]
    [{assign var="sBargainArtTitle" value="`$product->oxarticles__oxtitle->value` `$product->oxarticles__oxvarselect->value`"}]
    [{capture name="bargainTitle"}]
        <a id="titleBargain_[{$smarty.foreach.bargainList.iteration}]" href="[{$product->getMainLink()}]" class="title">[{$sBargainArtTitle|strip_tags}]</a>
    [{/capture}]
    [{capture name="bargainPic"}]
        <a class="picture" href="[{$product->getMainLink()}]"><img src="[{$product->getThumbnailUrl()}]" alt="[{$sBargainArtTitle|strip_tags}]" class="picture"></a>
    [{/capture}]
    [{capture name="bargainPrice"}]
        [{block name="widgetproduct_bargainitem_price"}]
            <div class="price_tocart [{if $product->getPricePerUnit()}]tight[{/if}]" id="priceBargain_[{$smarty.foreach.bargainList.iteration}]">
                <div>
                [{oxhasrights ident="SHOWARTICLEPRICE"}]

                    [{assign var=tprice value=$product->getTPrice()}]
                    [{assign var=price value=$product->getPrice()}]

                    [{if $tprice && $tprice->getBruttoPrice() > $price->getBruttoPrice()}]
                    <span class="oldPrice">
                        [{oxmultilang ident="WIDGET_PRODUCT_PRODUCT_REDUCEDFROM"}] <del>[{$product->getFTPrice()}] [{$currency->sign}]</del>
                    </span>
                    [{/if}]

                    [{if $product->getFPrice()}]
                        [{assign var="currency" value=$oView->getActCurrency()}]
                         <span class="price">[{$product->getFPrice()}] [{$currency->sign}] [{if !($product->hasMdVariants() || ($oViewConf->showSelectListsInList()&&$product->getSelections(1)) || $product->getVariantList())}]*[{/if}]</span>
                    [{/if}]

                    [{if $product->getPricePerUnit()}]
                    <span class="pricePerUnit">
                        [{$product->oxarticles__oxunitquantity->value}] [{$product->getUnitName()}] | [{$product->getPricePerUnit()}] [{$currency->sign}]/[{$product->getUnitName()}]
                    </span>
                    [{/if}]

                  </div>

                    [{block name="widgetproduct_bargainitem_tobasket"}]
                        [{if !($product->hasMdVariants() || ($oViewConf->showSelectListsInList() && $product->getSelections(1)) || $product->getVariantList())}]
                            <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=start" params="fnc=tobasket&amp;aid=`$product->oxarticles__oxid->value`&amp;am=1"}]" class="toCart submitButton" title="[{oxmultilang ident="WIDGET_BARGAIN_ITEMS_PRODUCT_ADDTOCART"}]">[{oxmultilang ident="WIDGET_BARGAIN_ITEMS_PRODUCT_ADDTOCART"}]</a>
                        [{else}]
                            <a href="[{$product->getMainLink()}]" class="toCart submitButton">[{oxmultilang ident="WIDGET_PRODUCT_PRODUCT_MOREINFO"}]</a>
                        [{/if}]
                    [{/block}]

                [{/oxhasrights}]

            </div>
        [{/block}]
    [{/capture}]
[{/if}]
[{/foreach}]
<div class="specBoxTitles">
    <h3 class="sectionHead">

        [{oxmultilang ident="PAGE_SHOP_START_WEEKSPECIAL"}]

        [{assign var='rsslinks' value=$oView->getRssLinks() }]
        [{if $rsslinks.bargainArticles}]
            <a class="rss js-external" id="rssBargainProducts" href="[{$rsslinks.bargainArticles.link}]" title="[{$rsslinks.bargainArticles.title}]"><img src="[{$oViewConf->getImageUrl('rss.png')}]" alt="[{$rsslinks.bargainArticles.title}]"><span>[{$rsslinks.bargainArticles.title}]</span></a>
        [{/if}]
    </h3>
    [{$smarty.capture.bargainTitle}]
</div>
<div class="specBoxInfo">
    [{$smarty.capture.bargainPrice}]
    [{$smarty.capture.bargainPic}]
</div>