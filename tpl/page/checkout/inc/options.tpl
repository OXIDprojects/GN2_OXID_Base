[{block name="checkout_user_options"}]
    [{gn2_oxscript include="js/widgets/oxequalizer.js" priority=10 }]
    [{gn2_oxscript add="$(function(){oxEqualizer.equalHeight($( '.checkoutOptions .option' ));});"}]
    
    [{if $oView->getShowNoRegOption() }]
   		[{assign var="checkoutOptionsClass" value="col3"}]
   	[{else}]
   		[{assign var="checkoutOptionsClass" value="col2"}]
   	[{/if}]
    
    <div class="checkoutOptions [{$checkoutOptionsClass}]">
    
        [{block name="checkout_options_noreg"}]
            [{if $oView->getShowNoRegOption() }]
            <div class="option" id="optionNoRegistration">
                <h3>[{oxmultilang ident="PAGE_CHECKOUT_USER_OPTION_NOREGISTRATION"}]</h3>
                [{block name="checkout_options_noreg_text"}]
                    <p>[{oxmultilang ident="PAGE_CHECKOUT_USER_OPTION_NOREGISTRATION_DESCRIPTION"}]</p>
                
                    [{if $oView->isDownloadableProductWarning() }]
                        <p class="errorMsg">[{oxmultilang ident="MESSAGE_DOWNLOADABLE_PRODUCT"}]</p>
                    [{/if}]
                [{/block}]
                <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                    <p>
                        [{$oViewConf->getHiddenSid()}]
                        [{$oViewConf->getNavFormParams()}]
                        <input type="hidden" name="cl" value="user">
                        <input type="hidden" name="fnc" value="">
                        <input type="hidden" name="option" value="1">
                        <button class="submitButton" type="submit">[{oxmultilang ident="PAGE_CHECKOUT_USER_OPTION_NEXT"}]</button>
                    </p>
                </form>
            </div>
            [{/if}]
        [{/block}]

        [{block name="checkout_options_reg"}]
            <div class="option" id="optionRegistration">
                <h3>[{oxmultilang ident="PAGE_CHECKOUT_USER_OPTION_REGISTRATION"}]</h3>
                [{block name="checkout_options_reg_text"}]
                    <div>[{oxmultilang ident="PAGE_CHECKOUT_USER_OPTION_REGISTRATION_DESCRIPTION"}]</div>
                [{/block}]
                <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                    <p>
                        [{$oViewConf->getHiddenSid()}]
                        [{$oViewConf->getNavFormParams()}]
                        <input type="hidden" name="cl" value="user">
                        <input type="hidden" name="fnc" value="">
                        <input type="hidden" name="option" value="3">
                        <button class="submitButton" type="submit">[{oxmultilang ident="FORM_LOGIN_ACCOUNT_OPENACCOUNT"}]</button>
                    </p>
                </form>
            </div>
        [{/block}]

        [{block name="checkout_options_login"}]
            <div class="option last" id="optionLogin">
                <h3>[{oxmultilang ident="PAGE_CHECKOUT_USER_OPTION_LOGIN"}]</h3>
                [{block name="checkout_options_login_text"}]
                    <p>[{oxmultilang ident="PAGE_CHECKOUT_USER_OPTION_LOGIN_DESCRIPTION"}]</p>
                [{/block}]
                [{include file="form/login.tpl"}]
            </div>
        [{/block}]
        
    </div>
[{/block}]