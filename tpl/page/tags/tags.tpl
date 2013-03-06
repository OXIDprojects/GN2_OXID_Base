[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="TAGS"|oxmultilangassign }]
    [{if $oView->getTagCloudManager() }]
        <h2 class="pageHead">[{oxmultilang ident="TAGS"}]</h2>
        <div >
            <p class="tagCloud" id="tagsCloud">
                [{assign var="oCloudManager" value=$oView->getTagCloudManager() }]
                [{foreach from=$oCloudManager->getCloudArray() item=iCount key=sTagTitle}]
                    <a class="tagitem_[{$oCloudManager->getTagSize($sTagTitle)}]" href="[{$oCloudManager->getTagLink($sTagTitle)}]">[{$oCloudManager->getTagTitle($sTagTitle)}]</a>
                [{/foreach}]
            </p>
        </div>
    [{/if}]
    [{insert name="oxid_tracker" title=$template_title }]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]