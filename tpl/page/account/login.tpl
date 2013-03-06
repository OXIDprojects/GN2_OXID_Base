[{gn2_oxscript add="$(function(){oxEqualizer.equalHeight($( '.column' ));});"}]
[{assign var="template_title" value="PAGE_ACCOUNT_INC_LOGIN_LOGIN"|oxmultilangassign }]
[{capture append="oxidBlock_content"}]

<div class="accountLoginView" xmlns="http://www.w3.org/1999/html">
    <h2 class="pageHead accountHead">[{oxmultilang ident="PAGE_ACCOUNT_INC_LOGIN_LOGIN"}]</h2>

    <div class="column left">
        <p>[{oxmultilang ident="PAGE_ACCOUNT_INC_LOGIN_ALREADYCUSTOMER"}]</p>
        [{include file="form/login_account.tpl"}]
    </div>


    <div class="column right">
        <div class="accountRegisterAdvantages">
            <div>[{oxmultilang ident="PAGE_CHECKOUT_USER_OPTION_REGISTRATION_DESCRIPTION"}]</div>
            <a id="openAccountLink" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=register"}]" class="submitButton largeButton" rel="nofollow">
            [{oxmultilang ident="FORM_LOGIN_ACCOUNT_OPENACCOUNT"}]
            </a>
        </div>
    </div>

</div>

[{insert name="oxid_tracker" title=$template_title }]
[{/capture}]

[{include file="layout/page.tpl"}]



