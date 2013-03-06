[{capture append="oxidBlock_content"}]
	
[{*
	[{assign var="soh_headline" value="SleightofHand Headline Äöüß?!"}]
	<h2 class="pageHead">[{$soh_headline|sleightofhand:"font::Chinese_Ruler.ttf,,color::#452f27,,size::16"}]</h2>
*}]	
	
	[{assign var="soh_headline" value="SleightofHand Headline Äöüß?!"}]
	<h2 class="pageHead">[{sleightofhand text=$soh_headline settings='size:16;color:#452f27;mouseover:#FF0000;rotateX:2;wordwrap:20;font:Chinese_Ruler.ttf;' }]</h2>
	
	[{* Promotion Slider *}]
	[{if $oView->getClassName()=='start' && $oView->getBanners()|@count > 0 }]
	    <div class="oxSlider">
	        [{include file="widget/promoslider.tpl" }]
	    </div>
	[{/if}]
	
	[{* Angebot der Woche *}]
    [{assign var="oFirstArticle" value=$oView->getFirstArticle()}]
    [{if $oView->getCatOfferArticleList()|@count > 0}]
        [{foreach from=$oView->getCatOfferArticleList() item=actionproduct name=CatArt}]
        [{if $smarty.foreach.CatArt.first}]
        [{assign var="oCategory" value=$actionproduct->getCategory()}]
            [{if $oCategory }]
                [{assign var="promoCatTitle" value=$oCategory->oxcategories__oxtitle->value}]
                [{assign var="promoCatImg" value=$oCategory->getPromotionIconUrl()}]
                [{assign var="promoCatLink" value=$oCategory->getLink()}]
            [{/if}]
        [{/if}]
        [{/foreach}]
    [{/if}]

    [{if $oView->getBargainArticleList()|@count > 0 || ($promoCatTitle && $promoCatImg)}]
        <div class="promoBoxes">
            [{if count($oView->getBargainArticleList()) > 0 }]
                <div id="specBox" class="specBox">
                    [{include file="widget/product/bargainitems.tpl"}]
                </div>
            [{/if}]
            [{if $promoCatTitle && $promoCatImg}]
                <div id="specCatBox" class="specCatBox">
                    <h3 class="sectionHead">[{$promoCatTitle}]</h3>
                    <a href="[{$promoCatLink}]" class="viewAllHover">
                    	<img src="[{$promoCatImg}]" alt="[{$promoCatTitle}]">
                    </a>
                </div>
            [{/if}]
        </div>
    [{/if}]
    
    [{* Hersteller Slider *}]
    [{include file="widget/manufacturersslider.tpl" }]
    
    [{*  *}]
    [{if $oView->getNewestArticles() }]
        [{assign var='rsslinks' value=$oView->getRssLinks() }]
        [{include file="widget/product/list.tpl" type=$oViewConf->getViewThemeParam('sStartPageListDisplayType') head="PAGE_SHOP_START_JUSTARRIVED"|oxmultilangassign listId="newItems" products=$oView->getNewestArticles() rsslink=$rsslinks.newestArticles rssId="rssNewestProducts" showMainLink=true}]
    [{/if}]
    
    [{ insert name="oxid_tracker"}]

[{/capture}]
[{include file="layout/page.tpl" sidebar="Right"}]