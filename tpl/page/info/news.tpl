[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="PAGE_INFO_NEWS_LATESTNEWSBY"|oxmultilangassign}]
    [{assign var="oNews" value=$oView->getNews() }]
    
    <div>
    <h2 class="pageHead">[{oxmultilang ident="PAGE_INFO_NEWS_LATESTNEWSBY"}] [{$oxcmp_shop->oxshops__oxname->value}]</h2>
        [{foreach from=$oView->getNews() item=oNews}]
            [{if !empty($oNews) && is_object($oNews)}]
            
            <div>
                <h3><span>[{$oNews->oxnews__oxdate->value|date_format:"%d.%m.%Y"}] - </span> [{$oNews->oxnews__oxshortdesc->value}]</h3>
                [{$oNews->getLongDesc() force=1}]
            </div>
            
            [{/if}]
        [{/foreach}]
    </div>
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
