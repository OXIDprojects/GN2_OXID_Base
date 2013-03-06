[{capture append="oxidBlock_content"}]

[{if $oView->showUpdateScreen() }]
  [{assign var="template_title" value="PAGE_ACCOUNT_FORGOTPWD_UPDATETITLE"|oxmultilangassign}]
[{elseif $oView->updateSuccess() }]
  [{assign var="template_title" value="PAGE_ACCOUNT_FORGOTPWD_UPDATESUCCESSTITLE"|oxmultilangassign}]
[{else}]
  [{assign var="template_title" value="PAGE_ACCOUNT_FORGOTPWD_TITLE"|oxmultilangassign}]
[{/if}]


<h2 class="pageHead accountHead">[{$template_title}]</h2>

[{if $oView->isExpiredLink() }]
    [{* LINK EXPIRED *}]

    <div class="status error">
        <p>[{oxmultilang ident="FORGOTPWD_ERRLINKEXPIRED"}]</p>
    </div>

[{elseif $oView->showUpdateScreen() }]
    [{*CHANGE PASSWORD*}]

   [{include file="form/forgotpwd_change_pwd.tpl"}]

[{elseif $oView->updateSuccess() }]
    [{*UPDATE SUCCESS*}]

    <div class="status success">
        <p>[{oxmultilang ident="PAGE_ACCOUNT_FORGOTPWD_UPDATE_SUCCESS"}]</p>
    </div>

[{else}]

    [{if $oView->getForgotEmail()}]

        <div class="status success">
            <p>[{oxmultilang ident="PAGE_ACCOUNT_FORGOTPWD_PWDWASSEND"}] [{$oView->getForgotEmail()}]</p>
        </div>

        <div class="note">
            [{oxifcontent ident="oxforgotpwd" object="oCont"}]
                [{$oCont->oxcontents__oxcontent->value}]
            [{/oxifcontent}]
        </div>

    [{else}]
        [{*STANDARD FORMULAR*}]

        <div>
            <p>[{oxmultilang ident="PAGE_ACCOUNT_FORGOTPWD_FORGOTPWD"}] [{oxmultilang ident="PAGE_ACCOUNT_FORGOTPWD_WEWILLSENDITTOYOU"}]</p>

            [{include file="form/forgotpwd_email.tpl"}]

            <p>[{oxmultilang ident="PAGE_ACCOUNT_FORGOTPWD_AFTERCLICK"}]</p>
        </div>

        <div class="note">
            [{oxifcontent ident="oxforgotpwd" object="oCont"}]
                [{$oCont->oxcontents__oxcontent->value}]
            [{/oxifcontent}]
        </div>

    [{/if}]

[{/if}]

[{if !$oView->isActive('PsLogin') }]
    [{insert name="oxid_tracker" title=$template_title }]
[{/if}]

[{/capture}]

[{if $oView->isActive('PsLogin') }]
    [{include file="layout/popup.tpl"}]
[{else}]
    [{include file="layout/page.tpl" sidebar="Right"}]
[{/if}]