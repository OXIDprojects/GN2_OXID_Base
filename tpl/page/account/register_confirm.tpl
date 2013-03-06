[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="PAGE_ACCOUNT_REGISTER_CONFIRM_WELCOME"|oxmultilangassign}]
    <h2 class="pageHead accountHead">[{oxmultilang ident="PAGE_ACCOUNT_REGISTER_CONFIRM_WELCOME"}]</h2>
    
    <div class="status success">
    	<p>[{oxmultilang ident="PAGE_ACCOUNT_REGISTER_CONFIRM_CONFIRMED"}]</p>
    </div>
    
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]

