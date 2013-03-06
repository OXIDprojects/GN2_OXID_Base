[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="PAGE_ACCOUNT_REGISTER_OPENACCOUNT"|oxmultilangassign }]
    [{if $oView->isActive('PsLogin') }]
        [{include file="message/errors.tpl" }]
    [{/if}]
    
    <h2 class="pageHead accountHead">[{oxmultilang ident="PAGE_ACCOUNT_REGISTER_OPENACCOUNT"}]</h2>
    [{include file="form/register.tpl"}]
    
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]
[{if $oView->isActive('PsLogin') }]
    [{include file="layout/popup.tpl"}]
[{else}]
    [{include file="layout/page.tpl" sidebar="Left"}]
[{/if}]