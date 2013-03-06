[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="PAGE_GUESTBOOK_LIST_GUESTBOOK"|oxmultilangassign}]
    <h2 class="pageHead">[{oxmultilang ident="PAGE_GUESTBOOK_LIST_GUESTBOOK"}]</h2>
    <div class="listRefine bottomRound">
        [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigation() sort=true}]
    </div>
    <div class="reviews">
        [{include file="form/guestbook.tpl"}]
        <dl>
            [{if $oView->getEntries()}]
                [{foreach from=$oView->getEntries() item=entry}]
                    <dt class="item">
                        <span>[{$entry->oxuser__oxfname->value }] [{oxmultilang ident="PAGE_GUESTBOOK_LIST_WRITES"}] <span>[{$entry->oxgbentries__oxcreate->value|date_format:"%d.%m.%Y"}] [{$entry->oxgbentries__oxcreate->value|date_format:"%H:%M" }]</span>
                    </dt>
                    <dd>
                        <div class="description">[{$entry->oxgbentries__oxcontent->value|nl2br }]</div>
                    </dd>
                [{/foreach}]
            [{else}]
                <dt>
                    [{oxmultilang ident="PAGE_GUESTBOOK_LIST_NOENTRYAVAILABLE"}]
                </dt>
                <dd></dd>
            [{/if}]
        </dl>
        [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigation() place="bottom"}]
    </div>
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
