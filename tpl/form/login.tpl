[{gn2_oxscript include="js/widgets/oxinputvalidator.js" priority=10 }]
[{gn2_oxscript add="$('form.js-oxValidate').oxInputValidator();"}]
<form class="js-oxValidate" name="login" action="[{ $oViewConf->getSslSelfLink() }]" method="post">
[{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
    <ul class="form">
        <li[{if $aErrors}] class="oxInValid"[{/if}]>
            [{$oViewConf->getHiddenSid() }]
            [{$oViewConf->getNavFormParams() }]
            <input type="hidden" name="fnc" value="login_noredirect">
            <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName() }]">
            <label class="short">[{oxmultilang ident="WIDGET_LOGINBOX_EMAIL_ADDRESS" }]</label>
            <input type="text" name="lgn_usr" class="textbox js-oxValidate js-oxValidate_notEmpty js-oxValidate_email" field="pair-xsmall">
            <p class="underInput short oxValidateError"
                <span class="js-oxError_notEmpty">[{oxmultilang ident="EXCEPTION_INPUT_NOTALLFIELDS_EMAIL" }]</span>
                <span class="js-oxError_email">[{oxmultilang ident="EXCEPTION_INPUT_NOVALIDEMAIL" }]</span>
            </p>
        </li>
        <li[{if $aErrors}] class="oxInValid"[{/if}]>
            <label class="short">[{oxmultilang ident="WIDGET_LOGINBOX_PASSWORD" }]</label>
            <input type="password" name="lgn_pwd" class="js-oxValidate js-oxValidate_notEmpty textbox" field="pair-xsmall">
            <p class="underInput short oxValidateError">
                <span class="js-oxError_notEmpty">[{oxmultilang ident="EXCEPTION_INPUT_NOTALLFIELDS" }]</span>
            </p>
        </li>
        <li>
            <a id="forgotPasswordLink" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=forgotpwd" }]" class="textLink" rel="nofollow">[{oxmultilang ident="FORM_LOGIN_ACCOUNT_FORGOTPWD" }]</a>
        </li>
        <li><button type="submit" class="submitButton">[{oxmultilang ident="WIDGET_LOGINBOX_LOGIN" }]</button></li>
    </ul>
</form>