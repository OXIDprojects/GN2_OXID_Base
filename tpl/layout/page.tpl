[{*gn2 Actual Page-Template Name*}]
[{assign value="/"|explode:$oView->render() var="pagePath"}]
[{assign value="" var="actualPage"}]

[{capture assign="actualPage" name="actPageCapture"}][{strip}]
[{foreach from=$pagePath item="actPage" name="actForeach"}]
[{if !$smarty.foreach.actForeach.first}][{$actPage|replace:".tpl":""}][{if !$smarty.foreach.actForeach.last}]-[{/if}][{/if}]
[{/foreach}]
[{/strip}][{/capture}]

[{capture append="oxidBlock_pageBody"}]

    [{if $oView->showRDFa()}]
        [{include file="rdfa/rdfa.tpl"}]
    [{/if}]

    <div id="page" class="[{$actualPage}][{if $sidebar}] sidebar[{$sidebar}][{/if}]">
        
        [{include file="layout/header.tpl" checkoutStep=$checkoutStep}]
        
        [{if $oView->getClassName() ne "start" && !$blHideBreadcrumb}]
           [{include file="widget/breadcrumb.tpl"}]
        [{/if}]
        
        <div id="content">
            [{include file="message/errors.tpl"}]
            [{foreach from=$oxidBlock_content item="_block"}]
                [{$_block}]
            [{/foreach}]
        </div>
        
        [{if $sidebar}]
            <div id="sidebar">
                [{include file="layout/sidebar.tpl"}]
            </div>
        [{/if}]
        
        [{include file="layout/footer.tpl"}]
    </div>
    [{include file="widget/facebook/init.tpl"}]
    
    [{if $oView->isPriceCalculated() }]
        [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
            <div id="incVatMessage">
                [{if $oView->isVatIncluded()}]
                * <span class="deliveryInfo">[{oxmultilang ident="PLUS_SHIPPING"}]<a href="[{$oCont->getLink()}]" rel="nofollow">[{oxmultilang ident="PLUS_SHIPPING2"}]</a></span>
                [{else}]
                * <span class="deliveryInfo">[{oxmultilang ident="PLUS"}]<a href="[{$oCont->getLink()}]" rel="nofollow">[{oxmultilang ident="PLUS_SHIPPING2"}]</a></span>
                [{/if}]
            </div>
        [{/oxifcontent }]
    [{/if}]

[{/capture}]
[{include file="layout/base.tpl"}]