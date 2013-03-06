[{gn2_oxscript include="js/widgets/oxflyoutbox.js" priority=10 }]
[{gn2_oxscript add="$( '#languageTrigger' ).oxFlyOutBox();"}]
[{if $oView->isLanguageLoaded()}]
<li class="topPopList">
    [{capture name="languageList"}]
        [{foreach from=$oxcmp_lang item=_lng}]
        [{assign var="sLangImg" value="lang/"|cat:$_lng->abbr|cat:".png"}]
        [{if $_lng->selected}]
            [{capture name="languageSelected"}]
                <a class="flag [{$_lng->abbr }]" title="[{$_lng->name}]" href="[{$_lng->link|oxaddparams:$oView->getDynUrlParams()}]" hreflang="[{$_lng->abbr }]"><span class="flagpic" style="background: transparent url('[{$oViewConf->getImageUrl($sLangImg)}]') left center no-repeat"><span>[{$_lng->name}]</span></span></a>
            [{/capture}]
        [{/if}]
            <li><a class="flag [{$_lng->abbr }] [{if $_lng->selected}]selected[{/if}]" title="[{$_lng->name}]" href="[{$_lng->link|oxaddparams:$oView->getDynUrlParams()}]" hreflang="[{$_lng->abbr }]"><span class="flagpic" style="background: transparent url('[{$oViewConf->getImageUrl($sLangImg)}]') left center no-repeat"><span>[{$_lng->name}]</span></span></a></li>
        [{/foreach}]
    [{/capture}]
    <span id="languageTrigger" class="selectedValue">
        [{$smarty.capture.languageSelected}]
    </span>
    <ul id="languages" class="flyoutBox">
        <li class="active">[{$smarty.capture.languageSelected}]</li>
        [{$smarty.capture.languageList}]
    </ul>
</li>
[{/if}]