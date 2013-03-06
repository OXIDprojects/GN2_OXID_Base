[{capture append="oxidBlock_content"}]
    [{if $oView->getNewsletterStatus() == 4 || !$oView->getNewsletterStatus()}]
      <h2 class="pageHead">[{oxmultilang ident="PAGE_INFO_NEWSLETTER_STAYINFORMED"}]</h2>
      
      [{oxifcontent ident="oxnewstlerinfo" object="oCont"}]
          [{$oCont->oxcontents__oxcontent->value}]
      [{/oxifcontent}]
      
      <br>
      [{include file="form/newsletter.tpl"}]
    [{elseif $oView->getNewsletterStatus() == 1}]
      <h2 class="pageHead">[{oxmultilang ident="PAGE_INFO_NEWSLETTER_THANKYOU"}]</h2>
      [{oxmultilang ident="PAGE_INFO_NEWSLETTER_YOUHAVEBEENSENTCONFIRMATION"}]<br><br>
    [{elseif $oView->getNewsletterStatus() == 2}]
      <h2 class="pageHead">[{oxmultilang ident="PAGE_INFO_NEWSLETTER_CONGRATULATIONS"}]</h2>
      [{oxmultilang ident="PAGE_INFO_NEWSLETTER_SUBSCRIPTIONACTIVATED"}]<br><br>
    [{elseif $oView->getNewsletterStatus() == 3}]
      <h2 class="pageHead">[{oxmultilang ident="PAGE_INFO_NEWSLETTER_SUCCESS"}]</h2>
      [{oxmultilang ident="PAGE_INFO_NEWSLETTER_SUBSCRIPTIONCANCELED"}]<br><br>
    [{/if}]
    [{insert name="oxid_tracker"}]
[{/capture}]

[{include file="layout/page.tpl"}]