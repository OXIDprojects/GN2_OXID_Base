[{assign var="aVariantSelections" value=$oView->getVariantSelections()}]

[{if $aVariantSelections && $aVariantSelections.rawselections}]
    [{assign var="_sSelectionHashCollection" value=""}]
    [{foreach from=$aVariantSelections.rawselections item=oSelectionList key=iKey}]
        [{assign var="_sSelectionHash" value=""}]
        [{foreach from=$oSelectionList item=oListItem key=iPos}]
            [{assign var="_sSelectionHash" value=$_sSelectionHash|cat:$iPos|cat:":"|cat:$oListItem.hash|cat:"|"}]
        [{/foreach}]
        [{if $_sSelectionHash}]
            [{if $_sSelectionHashCollection}][{assign var="_sSelectionHashCollection" value=$_sSelectionHashCollection|cat:","}][{/if}]
            [{assign var="_sSelectionHashCollection" value=$_sSelectionHashCollection|cat:"'`$_sSelectionHash`'"}]
        [{/if}]
    [{/foreach}]
    [{gn2_oxscript add="var oxVariantSelections  = [`$_sSelectionHashCollection`];"}]
[{/if}]

[{oxhasrights ident="TOBASKET"}]
<form class="js-oxProductForm" action="[{$oViewConf->getSelfActionLink()}]" method="post">
    <div>
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
        <input type="hidden" name="aid" value="[{$oDetailsProduct->oxarticles__oxid->value}]">
        <input type="hidden" name="anid" value="[{$oDetailsProduct->oxarticles__oxnid->value}]">
        <input type="hidden" name="parentid" value="[{if !$oDetailsProduct->oxarticles__oxparentid->value}][{$oDetailsProduct->oxarticles__oxid->value}][{else}][{$oDetailsProduct->oxarticles__oxparentid->value}][{/if}]">
        <input type="hidden" name="panid" value="">
        [{if !$oDetailsProduct->isNotBuyable()}]
            <input type="hidden" name="fnc" value="tobasket">
        [{/if}]
    </div>
[{/oxhasrights}]

<div class="detailsInfo">

    <div class="pictures">
    [{* article picture with zoom *}]
    [{block name="details_productmain_zoom"}]
		[{include file="page/details/inc/detailpic.tpl"}]
    [{/block}]
    </div>

    [{* article main info block *}]
    <div class="information">

        [{assign var="oManufacturer" value=$oView->getManufacturer()}]
        [{gn2_oxscript include="js/widgets/oxarticleactionlinksselect.js" priority=10 }]
        [{gn2_oxscript add="$( '#productTitle' ).oxArticleActionLinksSelect();"}]

	  <div class="productMainInfo[{if $oManufacturer->oxmanufacturers__oxicon->value}] hasBrand[{/if}]">
        [{* Product title *}]
        [{block name="details_productmain_title"}]
            [{*<h3 class="sectionHead"></h3>*}]
            <h2 class="pageHead detailsHead">[{$oDetailsProduct->oxarticles__oxtitle->value}] <span>[{$oDetailsProduct->oxarticles__oxvarselect->value}]</span></h2>
        [{/block}]

        [{* article number *}]
        [{block name="details_productmain_artnumber"}]
            <p class="itemCode">[{oxmultilang ident="DETAILS_ARTNUMBER"}] [{$oDetailsProduct->oxarticles__oxartnum->value}]</p>
        [{/block}]

	  </div>

	  	[{* Hersteller Icon *}]
		[{block name="details_productmain_manufacturersicon"}]
            [{if $oManufacturer->oxmanufacturers__oxicon->value}]
                <p class="manufacturer-icon"><img src="[{$oManufacturer->getIconUrl()}]" alt="[{$oManufacturer->oxmanufacturers__oxtitle->value}]"></p>
            [{/if}]
        [{/block}]

        [{* short description *}]
        [{block name="details_productmain_shortdesc"}]
            [{oxhasrights ident="SHOWSHORTDESCRIPTION"}]
                [{if $oDetailsProduct->oxarticles__oxshortdesc->value}]
                    <p class="shortDescription description">[{$oDetailsProduct->oxarticles__oxshortdesc->value}]</p>
                [{/if}]
            [{/oxhasrights}]
        [{/block}]



        [{assign var="blCanBuy" value=true}]
        [{* variants | md variants *}]
        [{block name="details_productmain_variantselections"}]
            [{if $aVariantSelections && $aVariantSelections.selections }]
                [{gn2_oxscript include="js/widgets/oxajax.js" priority=10 }]
                [{gn2_oxscript include="js/widgets/oxarticlevariant.js" priority=10 }]
                [{gn2_oxscript add="$( '#variants' ).oxArticleVariant();"}]
                [{assign var="blCanBuy" value=$aVariantSelections.blPerfectFit}]
                <div id="variants" class="selectorsBox js-fnSubmit">

                    [{assign var="blHasActiveSelections" value=false}]
                    [{foreach from=$aVariantSelections.selections item=oList key=iKey}]
                        [{if $oList->getActiveSelection()}]
                            [{assign var="blHasActiveSelections" value=true}]
                        [{/if}]
                        [{include file="widget/product/selectbox.tpl" oSelectionList=$oList iKey=$iKey blInDetails=true}]
                    [{/foreach}]

                [{if $blHasActiveSelections}]
                    <div class="variantReset">
                        [{* Reset link *}]
                        <a href="" class="reset">[{oxmultilang ident="DETAILS_VARIANTS_RESETSELECTION" }]</a>

                        [{* Active selections *}]
                        <label>[{oxmultilang ident="DETAILS_VARIANTS_SELECTEDCOMBINATION" }]</label>
                        [{assign var="sSelectionSep" value=""}]
                        [{strip}]
                            [{foreach from=$aVariantSelections.selections item=oSelectionList name=variantselections}]
                                [{assign var="oActiveSelection" value=$oSelectionList->getActiveSelection()}]
                                [{if $oActiveSelection }]
                                    [{$sSelectionSep}][{$oActiveSelection->getName()}]
                                    [{assign var="sSelectionSep" value=", "}]
                                [{/if}]
                            [{/foreach}]
                        [{/strip}]
                    </div>
                [{else}]
                    [{if !$blCanBuy && !$oDetailsProduct->isParentNotBuyable()}]
                        [{assign var="blCanBuy" value=true}]
                    [{/if}]
                [{/if}]

                [{if !$blCanBuy }]
                    <div class="variantMessage">[{oxmultilang ident="DETAILS_CHOOSEVARIANT"}]</div>
                [{/if}]

				</div>
            [{/if}]
        [{/block}]

        [{* selection lists *}]
        [{block name="details_productmain_selectlists"}]
            [{if $oViewConf->showSelectLists()}]
                [{assign var="oSelections" value=$oDetailsProduct->getSelections()}]
                [{if $oSelections}]
                    <div class="selectorsBox js-fnSubmit" id="productSelections">
                        [{foreach from=$oSelections item=oList name=selections}]
                            [{include file="widget/product/selectdropdown.tpl" oSelectionList=$oList sFieldName="sel" iKey=$smarty.foreach.selections.index blHideDefault=true sSelType="seldrop"}]
                        [{/foreach}]
                    </div>
                [{/if}]
            [{/if}]
        [{/block}]

		[{* pers params *}]
        [{block name="details_productmain_persparams"}]
            [{if $oView->isPersParam()}]
                <div class="persparamBox">
                    <label for="persistentParam">[{oxmultilang ident="PAGE_DETAILS_PERSPARAM_LABEL" }]</label><input type="text" class="textbox" id="persistentParam" name="persparam[details]" value="[{$oDetailsProduct->aPersistParam.text }]" size="35">
                </div>
            [{/if}]
        [{/block}]

        <div class="tobasket">
            [{block name="details_productmain_tprice"}]
                [{oxhasrights ident="SHOWARTICLEPRICE"}]
                    [{assign var=tprice value=$oDetailsProduct->getTPrice()}]
                    [{assign var=price value=$oDetailsProduct->getPrice()}]

                    [{if $tprice && $tprice->getBruttoPrice() > $price->getBruttoPrice()}]
                        <p class="oldPrice">
                            <strong>[{oxmultilang ident="DETAILS_REDUCEDFROM"}] <del>[{$oDetailsProduct->getFTPrice()}] [{$currency->sign}]</del></strong>
                        </p>
                    [{/if}]
                [{/oxhasrights}]
            [{/block}]

            <div class="tobasketFunction">
                [{block name="details_productmain_price"}]
                    [{oxhasrights ident="SHOWARTICLEPRICE"}]
                        [{if $oDetailsProduct->getFPrice()}]
                            <label id="productPrice" class="price">

                                [{assign var="fPrice" value=$oDetailsProduct->getFPrice()}]
                                [{if !$blCanBuy }]
                                    [{assign var="oParentProduct" value=$oDetailsProduct->getParentArticle()}]
                                    [{if $oParentProduct}]
                                        [{assign var="fPrice" value=$oParentProduct->getFPrice()}]
                                    [{/if}]
                                [{/if}]

                                <strong>
                                    <span>[{$fPrice}]</span>
                                    <span>[{$currency->sign}]</span>
                                    <span>*</span>
                                </strong>
                            </label>
                        [{/if}]

                        [{if $oDetailsProduct->loadAmountPriceInfo()}]
                            [{gn2_oxscript include="js/widgets/oxamountpriceselect.js" priority=10 }]
                            [{include file="page/details/inc/priceinfo.tpl"}]
                        [{/if}]
                    [{/oxhasrights}]
                [{/block}]

                [{block name="details_productmain_tobasket"}]
                    [{oxhasrights ident="TOBASKET"}]
                        [{if !$oDetailsProduct->isNotBuyable()}]
                        	[{if $blCanBuy}]
                            <input id="amountToBasket" type="text" name="am" value="1" size="3" autocomplete="off" class="textbox">
                            <button id="toBasket" type="submit" [{if !$blCanBuy}]disabled="disabled"[{/if}] class="submitButton largeButton" title="[{oxmultilang ident="DETAILS_ADDTOCART"}]">[{oxmultilang ident="DETAILS_ADDTOCART"}]</button>
                            [{else}]
                            	<p class="details_selectvariant">[{oxmultilang ident="DETAILS_SELECTVARIANT"}]</p>
                            [{/if}]
                        [{/if}]
                    [{/oxhasrights}]

                [{/block}]
            </div>
		</div>


		[{* Preis pro Einheit *}]
	    [{block name="details_productmain_priceperunit"}]
	        [{if $oDetailsProduct->getPricePerUnit()}]
	            <p id="productPriceUnit">[{$oDetailsProduct->getPricePerUnit()}] [{$currency->sign}]/[{$oDetailsProduct->getUnitName()}]</p>
	        [{/if}]
	    [{/block}]

	    [{* Warenbestand *}]
	    [{block name="details_productmain_stockstatus"}]
	        [{if $oDetailsProduct->getStockStatus() == -1}]
	            <p class="stockFlag notOnStock">
	                [{if $oDetailsProduct->oxarticles__oxnostocktext->value}]
	                    [{$oDetailsProduct->oxarticles__oxnostocktext->value}]
	                [{elseif $oViewConf->getStockOffDefaultMessage()}]
	                    [{oxmultilang ident="DETAILS_NOTONSTOCK"}]
	                [{/if}]
	                [{if $oDetailsProduct->getDeliveryDate()}]
	                    [{oxmultilang ident="DETAILS_AVAILABLEON"}] [{$oDetailsProduct->getDeliveryDate()}]
	                [{/if}]
	            </p>
	        [{elseif $oDetailsProduct->getStockStatus() == 1}]
	            <p class="stockFlag lowStock">[{oxmultilang ident="DETAILS_LOWSTOCK"}]</p>
	        [{elseif $oDetailsProduct->getStockStatus() == 0}]
	            <p class="stockFlag">
	                [{if $oDetailsProduct->oxarticles__oxstocktext->value}]
	                    [{$oDetailsProduct->oxarticles__oxstocktext->value}]
	                [{elseif $oViewConf->getStockOnDefaultMessage()}]
	                    [{oxmultilang ident="DETAILS_READYFORSHIPPING"}]
	                [{/if}]
	            </p>
	        [{/if}]
	    [{/block}]

		[{* Lieferzeit *}]
	    [{block name="details_productmain_deliverytime"}]
	        [{oxhasrights ident="TOBASKET"}]
	            [{if $oDetailsProduct->isBuyable() }]
	                [{include file="page/details/inc/deliverytime.tpl"}]
	            [{/if}]
	        [{/oxhasrights}]
	    [{/block}]

		[{* Produkt-Gewicht *}]
	    [{block name="details_productmain_weight"}]
	        [{if $oDetailsProduct->oxarticles__oxweight->value}]
	            <p id="productWeight">[{oxmultilang ident="DETAILS_ARTWEIGHT"}] [{$oDetailsProduct->oxarticles__oxweight->value}] [{oxmultilang ident="DETAILS_ARTWEIGHTUNIT"}]</p>
	        [{/if}]
	    [{/block}]

		[{* ratings *}]
        [{block name="details_productmain_ratings"}]
            [{if $oView->ratingIsActive()}]
                <div class="rating">
                    [{include file="widget/reviews/rating.tpl" itemid="anid=`$oDetailsProduct->oxarticles__oxnid->value`" sRateUrl=$oDetailsProduct->getLink() }]
                </div>
            [{/if}]
        [{/block}]


		[{* Produkt-Metalinks *}]
        [{block name="details_productmain_productlinksselector"}]
            <ul class="actionLinks">
                [{block name="details_productmain_productlinks"}]
                    [{if $oViewConf->getShowCompareList() }]
                        <li><span>[{oxid_include_dynamic file="page/details/inc/compare_links.tpl" testid="" type="compare" aid=$oDetailsProduct->oxarticles__oxid->value anid=$oDetailsProduct->oxarticles__oxnid->value in_list=$oDetailsProduct->isOnComparisonList() page=$oView->getActPage() text_to_id="PAGE_DETAILS_COMPARE" text_from_id="PAGE_DETAILS_REMOVEFROMCOMPARELIST"}]</span></li>
                    [{/if}]
                    <li>
                        <span><a id="suggest" rel="nofollow" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=suggest" params="anid=`$oDetailsProduct->oxarticles__oxnid->value`"|cat:$oViewConf->getNavUrlParams() }]">[{oxmultilang ident="PAGE_DETAILS_RECOMMEND"}]</a></span>
                    </li>

                    [{oxhasrights ident="TOBASKET"}]
                        [{if $oView->isPriceAlarm() && $oDetailsProduct->isBuyable()}]
                            <li><a id="priceAlarmLink" rel="nofollow" href="[{$oDetailsProduct->getLink()|cat:'#itemTabs'}]">[{oxmultilang ident="DETAILS_PRICEALARM"}]</a></li>
                        [{/if}]
                    [{/oxhasrights}]

                    <li>
                        <span>[{mailto extra='id="questionMail"' address=$oDetailsProduct->oxarticles__oxquestionemail->value|default:$oxcmp_shop->oxshops__oxinfoemail->value subject='DETAILS_QUESTIONSSUBJECT'|oxmultilangassign|cat:" "|cat:$oDetailsProduct->oxarticles__oxartnum->value text='DETAILS_QUESTIONS'|oxmultilangassign }]</span>
                    </li>

                    [{if $oViewConf->getShowListmania()}]
                        <li>
                            <span>
                                [{if $oxcmp_user }]
                                    <a id="recommList" rel="nofollow" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=recommadd" params="aid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;anid=`$oDetailsProduct->oxarticles__oxnid->value`"|cat:$oViewConf->getNavUrlParams() }]">[{oxmultilang ident="PAGE_DETAILS_ADDTORECOMMLIST"}]</a>
                                [{else}]
                                    <a id="loginToRecommlist" rel="nofollow" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" params="anid=`$oDetailsProduct->oxarticles__oxnid->value`"|cat:"&amp;sourcecl="|cat:$oViewConf->getActiveClassName()|cat:$oViewConf->getNavUrlParams() }]">[{oxmultilang ident="PAGE_DETAILS_LOGGINTOACCESSRECOMMLIST"}]</a>
                                [{/if}]
                            </span>
                        </li>
                    [{ /if}]
                    [{if $oxcmp_user }]
                        <li><span><a id="linkToNoticeList" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getActiveClassName() params="aid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;anid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;fnc=tonoticelist&amp;am=1"|cat:$oViewConf->getNavUrlParams() }]" rel="nofollow">[{oxmultilang ident="PAGE_DETAILS_ADDTONOTICELIST"}]</a></span></li>
                    [{else}]
                        <li><span><a id="loginToNotice" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" params="anid=`$oDetailsProduct->oxarticles__oxnid->value`"|cat:"&amp;sourcecl="|cat:$oViewConf->getActiveClassName()|cat:$oViewConf->getNavUrlParams() }]" rel="nofollow">[{oxmultilang ident="PAGE_DETAILS_LOGGINTOACCESSNOTICELIST"}]</a></span></li>
                    [{/if}]
                    [{if $oViewConf->getShowWishlist()}]
                        [{if $oxcmp_user }]
                            <li><span><a id="linkToWishList" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getActiveClassName() params="aid=`$oDetailsProduct->oxarticles__oxnid->value`&anid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;fnc=towishlist&amp;am=1"|cat:$oViewConf->getNavUrlParams() }]" rel="nofollow">[{oxmultilang ident="PAGE_DETAILS_ADDTOWISHLIST"}]</a></span></li>
                        [{else}]
                            <li><span><a id="loginToWish" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" params="anid=`$oDetailsProduct->oxarticles__oxnid->value`"|cat:"&amp;sourcecl="|cat:$oViewConf->getActiveClassName()|cat:$oViewConf->getNavUrlParams() }]" rel="nofollow">[{oxmultilang ident="PAGE_DETAILS_LOGGINTOACCESSWISHLIST"}]</a></span></li>
                        [{/if}]
                    [{/if}]

                [{/block}]
            </ul>
        [{/block}]


		[{* Social-Media Zeug *}]
        [{block name="details_productmain_social"}]
        <div class="social">
            [{if ( $oView->isActive('FbShare') || $oView->isActive('FbLike') && $oViewConf->getFbAppId() )}]
            [{if $oView->isActive('FacebookConfirm') && !$oView->isFbWidgetVisible()}]
                <div class="socialButton" id="productFbShare">
                    [{include file="widget/facebook/enable.tpl" source="widget/facebook/share.tpl" ident="#productFbShare"}]
                    [{include file=widget/facebook/like.tpl assign="fbfile"}]
                    [{assign var='fbfile' value=$fbfile|strip|escape:'url'}]
                    [{oxscript add="oxFacebook.buttons['#productFbLike']={html:'`$fbfile`',script:''};"}]
                </div>
                <div class="socialButton" id="productFbLike"></div>
                [{else}]
                <div class="socialButton" id="productFbShare">
                    [{include file="widget/facebook/enable.tpl" source="widget/facebook/share.tpl" ident="#productFbShare"}]
                </div>
                <div class="socialButton" id="productFbLike">
                    [{include file="widget/facebook/enable.tpl" source="widget/facebook/like.tpl" ident="#productFbLike"}]
                </div>
                [{/if}]
            [{/if}]
        </div>
        [{/block}]

    </div>

    [{* Teaserbilder *}]
	[{block name="details_productmain_morepics"}]
    	[{include file="page/details/inc/morepics.tpl"}]
	[{/block}]
</div>

[{oxhasrights ident="TOBASKET"}]
    </form>
[{/oxhasrights}]


