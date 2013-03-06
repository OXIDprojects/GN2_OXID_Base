[{assign var="listType" value=$oView->getListDisplayType()}]
[{assign var="_additionalParams" value=$oView->getAdditionalParams()}]
[{assign var="_artPerPage" value=$oViewConf->getArtPerPageCount()}]
[{if $oView->canSelectDisplayType()}]
    [{gn2_oxscript include="js/widgets/oxdropdown.js" priority=10 }]
    [{gn2_oxscript add="$('div.dropDown p').oxDropDown();"}]
    <div class="dropDown js-fnLink" id="viewOptions">
        <p class="selectorLabel">
            <label>[{oxmultilang ident="view"}]:</label>
            <span class="selected">[{oxmultilang ident=$listType}]</span>
        </p>
        <ul class="drop">
            <li><a href="[{$oView->getLink()|oxaddparams:"ldtype=infogrid&amp;_artperpage=$_artPerPage&amp;pgNr=0&amp;$_additionalParams"}]" [{if $listType eq 'infogrid' }]class="selected" [{/if}]>[{oxmultilang ident="infogrid"}]</a></li>
            <li><a href="[{$oView->getLink()|oxaddparams:"ldtype=grid&amp;_artperpage=$_artPerPage&amp;pgNr=0&amp;$_additionalParams"}]" [{if $listType eq 'grid' }]class="selected" [{/if}]>[{oxmultilang ident="grid"}]</a></li>
            <li><a href="[{$oView->getLink()|oxaddparams:"ldtype=line&amp;_artperpage=$_artPerPage&amp;pgNr=0&amp;$_additionalParams"}]" [{if $listType eq 'line' }]class="selected" [{/if}]>[{oxmultilang ident="line"}]</a></li>
        </ul>
    </div>
[{/if}]