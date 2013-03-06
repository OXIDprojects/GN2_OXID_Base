<ul class="list services">
    [{oxifcontent ident="oximpressum" object="_cont"}]
        <li><a href="[{$_cont->getLink() }]">[{$_cont->oxcontents__oxtitle->value}]</a></li>
    [{/oxifcontent}]
    [{oxifcontent ident="oxagb" object="_cont"}]
        <li><a href="[{$_cont->getLink() }]" rel="nofollow">[{$_cont->oxcontents__oxtitle->value}]</a></li>
    [{/oxifcontent}]
    [{oxifcontent ident="oxsecurityinfo" object="oCont"}]
        <li><a href="[{$oCont->getLink() }]" rel="nofollow">[{$oCont->oxcontents__oxtitle->value}]</a></li>
    [{/oxifcontent}]
    [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
        <li><a href="[{$oCont->getLink() }]" rel="nofollow">[{$oCont->oxcontents__oxtitle->value}]</a></li>
    [{/oxifcontent}]
    [{oxifcontent ident="oxrightofwithdrawal" object="oCont"}]
        <li><a href="[{$oCont->getLink() }]" rel="nofollow">[{$oCont->oxcontents__oxtitle->value}]</a></li>
    [{/oxifcontent}]
    [{oxifcontent ident="oxorderinfo" object="oCont"}]
        <li><a href="[{$oCont->getLink() }]" rel="nofollow">[{$oCont->oxcontents__oxtitle->value}]</a></li>
    [{/oxifcontent}]
    [{oxifcontent ident="oxcredits" object="oCont"}]
        <li><a href="[{$oCont->getLink() }]" rel="nofollow">[{$oCont->oxcontents__oxtitle->value}]</a></li>
    [{/oxifcontent}]

    [{if $oxcmp_user }]
    <li><a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_newsletter" }]" rel="nofollow">[{oxmultilang ident="PAGE_ACCOUNT_INC_ACCOUNT_MENU_NEWSLETTERSETTINGS"}]</a></li>
    [{else}]
    <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=newsletter" }]">[{oxmultilang ident="WIDGET_SERVICES_NEWSLETTER"}]</a></li>
    [{/if}]
</ul>