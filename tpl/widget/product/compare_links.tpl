[{if $_compare_in_list}]
  <a class="compare" id="removeCmp[{$_compare_testid}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getActiveClassName() params="am=1&amp;removecompare=1&amp;fnc=tocomparelist&amp;aid=`$_compare_aid`&amp;anid=`$_compare_anid`&amp;pgNr=`$_compare_page`"|cat:$oViewConf->getNavUrlParams()}]" rel="nofollow">[{oxmultilang ident="WIDGET_PRODUCT_REMOVEFROMCOMPARELIST"}]</a>
[{else}]
  <a class="compare" id="toCmp[{$_compare_testid}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getActiveClassName() params="am=1&amp;addcompare=1&amp;fnc=tocomparelist&aid=`$_compare_aid`&amp;anid=`$_compare_anid`&amp;pgNr=`$_compare_page`"|cat:$oViewConf->getNavUrlParams() }]" rel="nofollow">[{oxmultilang ident="WIDGET_PRODUCT_COMPARE"}]</a>
[{/if}]