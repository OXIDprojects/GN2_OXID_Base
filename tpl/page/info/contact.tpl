[{capture append="oxidBlock_content"}]
    <h2 class="pageHead">[{oxmultilang ident="PAGE_INFO_CONTACT"}]</h2>
    
    [{if $oView->getContactSendStatus() }]
        [{assign var="_statusMessage" value="PAGE_INFO_CONTACT_THANKYOU1"|oxmultilangassign|cat:" "|cat:$oxcmp_shop->oxshops__oxname->value}]
        [{assign var="_statusMessageSuffix" value="PAGE_INFO_CONTACT_THANKYOU2"|oxmultilangassign}]
        [{include file="message/success.tpl" statusMessage=$_statusMessage|cat:$_statusMessageSuffix}]
    [{/if }]
    
    <div id="contactShopInfo">
    
    	<h4 class="contactCompany">[{$oxcmp_shop->oxshops__oxcompany->value}]</h4>
    	
    	<div class="column">
        <p>
        [{$oxcmp_shop->oxshops__oxstreet->value}]<br>
        [{$oxcmp_shop->oxshops__oxzip->value}]&nbsp;[{$oxcmp_shop->oxshops__oxcity->value}]<br>
        [{$oxcmp_shop->oxshops__oxcountry->value}]
        </p>
      </div>
      
      <div class="column">
        <p>
        [{if $oxcmp_shop->oxshops__oxtelefon->value}]
            [{oxmultilang ident="PAGE_INFO_CONTACT_PHONE"}] [{$oxcmp_shop->oxshops__oxtelefon->value}]<br>
        [{/if}]
        [{if $oxcmp_shop->oxshops__oxtelefax->value}]
            [{oxmultilang ident="PAGE_INFO_CONTACT_FAX"}] [{$oxcmp_shop->oxshops__oxtelefax->value}]<br>
        [{/if}]
        [{if $oxcmp_shop->oxshops__oxinfoemail->value}]
            [{oxmultilang ident="PAGE_INFO_CONTACT_EMAIL"}] [{oxmailto address=$oxcmp_shop->oxshops__oxinfoemail->value encode="javascript"}]<br>
        [{/if}]
        </p>
      </div>
      
    </div>
    [{include file="form/contact.tpl"}]
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{include file="layout/page.tpl" sidebar="Left"}]
