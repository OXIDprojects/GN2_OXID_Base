<div id="header">

  	<ul id="topMenu">
  		
        [{include file="widget/header/loginbox.tpl"}]
        
        [{*if !$oxcmp_user}]
            <li><a id="registerLink" href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=register" }]" title="[{oxmultilang ident="PAGE_ACCOUNT_REGISTER_REGISTER"}]">[{oxmultilang ident="PAGE_ACCOUNT_REGISTER_REGISTER"}]</a></li>
        [{/if*}]
        [{*<li><a href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=register" }]" title="[{oxmultilang ident="PAGE_ACCOUNT_REGISTER_REGISTER"}]">[{oxmultilang ident="PAGE_ACCOUNT_REGISTER_REGISTER"}]</a></li>*}]
        
        [{oxid_include_dynamic file="widget/header/servicebox.tpl"}]
        [{include file="widget/header/languages.tpl"}]
        [{include file="widget/header/currencies.tpl"}]
  	</ul>
  
  	[{assign var="slogoImg" value="logo.png"}]
  	<a id="logo" href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]">
  		<img src="[{$oViewConf->getImageUrl($slogoImg)}]" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]">
  	</a>
    
    <div id="miniBasket"> 
    	[{oxid_include_dynamic file="widget/minibasket/minibasket.tpl"}]
    	[{oxid_include_dynamic file="widget/minibasket/minibasketmodal.tpl"}]
    </div>
    
    [{* alternativ: dauerhaft sichtbare Login-Box *}]
    [{*<div id="header_loginBox">
    	[{include file="widget/header/loginbox.tpl"}]
    </div>*}]
    
    [{include file="widget/header/search.tpl"}]
    
    [{if $checkoutStep}]
        [{include file="page/checkout/inc/steps.tpl" active=$checkoutStep}]
    [{else}]
        [{include file="widget/header/topcategories.tpl"}]
    [{/if}]

</div>