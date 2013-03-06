[{block name="widget_header_search_form"}]
[{if $oView->showSearch() }]    
        <form class="search" action="[{$oViewConf->getSelfActionLink() }]" method="get" name="search">
            <div class="searchBox">
                [{$oViewConf->getHiddenSid() }]
                <input type="hidden" name="cl" value="search">
                [{block name="header_search_field"}]
                    <label for="searchParam">[{oxmultilang ident="SEARCH_TITLE" }]</label>
                    <input class="textbox" type="text" id="searchParam" name="searchparam" value="[{if $oView->getSearchParamForHtml() ne ""}][{$oView->getSearchParamForHtml()}][{else}][{oxmultilang ident="SEARCH_TITLE" }][{/if}]">
                [{/block}]
                <input class="searchSubmit" title="[{oxmultilang ident="SEARCH_TITLE" }]" type="submit" value="">
            </div>
        </form>
[{/if}]
[{/block}]