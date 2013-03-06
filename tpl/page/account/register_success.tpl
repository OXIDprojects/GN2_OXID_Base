[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="PAGE_ACCOUNT_REGISTER_SUCCESS_WELCOME"|oxmultilangassign }]
    <h2 class="pageHead accountHead">[{oxmultilang ident="PAGE_ACCOUNT_REGISTER_SUCCESS_WELCOME"}]</h2>

    [{if $oView->getRegistrationStatus() == 1}]
        <p>[{oxmultilang ident="PAGE_ACCOUNT_REGISTER_SUCCESS_EMAILCONFIRMATION"}]</p>
    [{elseif $oView->getRegistrationStatus() == 2}]
        <p>[{oxmultilang ident="PAGE_ACCOUNT_REGISTER_SUCCESS_ACTIVATIONEMAIL"}]</p>
    [{/if}]

    [{if $oView->getRegistrationError() == 4}]
        <div class="status error">
            <p>[{oxmultilang ident="PAGE_ACCOUNT_REGISTER_SUCCESS_NOTABLETOSENDEMAIL"}]</p>
        </div>
    [{/if}]

    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{if $oView->isActive('PsLogin') }]
    [{include file="layout/popup.tpl"}]
[{else}]
    [{include file="layout/page.tpl" sidebar="Right"}]
[{/if}]