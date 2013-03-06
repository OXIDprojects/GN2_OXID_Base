[{gn2_oxscript include="js/widgets/oxinputvalidator.js" priority=10 }]
[{gn2_oxscript add="$('form.js-oxValidate').oxInputValidator();"}]
<form class="js-oxValidate formRegister" action="[{ $oViewConf->getSslSelfLink() }]" name="order" method="post">
<div class="formCol registerCol">
[{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
[{$oViewConf->getHiddenSid() }]
[{$oViewConf->getNavFormParams() }]
<input type="hidden" name="fnc" value="registeruser">
<input type="hidden" name="cl" value="register">
<input type="hidden" name="lgn_cook" value="0">
<input type="hidden" id="reloadAddress" name="reloadaddress" value="">
<input type="hidden" name="option" value="3">
	<div class="col left">
    	<h3 class="blockHead">[{oxmultilang ident="FORM_REGISTER_ACCOUNTINFO"}]</h3>
    	<ul class="form">
        [{include file="form/fieldset/user_account.tpl"}]
        [{if $oView->isActive('PsLogin') }]
            <li>
                <label>[{oxmultilang ident="FORM_REGISTER_IAGREETOTERMS2"}]</label>
                <input type="hidden" name="ord_agb" value="0">
                <input id="orderConfirmAgbBottom" type="checkbox" class="checkbox" name="ord_agb" value="1">
                <span class="inputNote agb">
                    [{oxifcontent ident="oxagb" object="oCont"}]
                        [{gn2_oxscript include="js/widgets/oxmodalpopup.js" priority=10 }]
                        [{gn2_oxscript add="$( '#orderOpenAgbBottom' ).oxModalPopup({target: '#popup1'});"}]
                        [{oxmultilang ident="FORM_REGISTER_IAGREETOTERMS1" }]
                        <a id="orderOpenAgbBottom" rel="nofollow" href="#">[{oxmultilang ident="FORM_REGISTER_IAGREETOTERMS2" }]</a>
                        [{oxmultilang ident="FORM_REGISTER_IAGREETOTERMS3"}],&nbsp;
                    [{/oxifcontent}]
                    [{oxifcontent ident="oxrightofwithdrawal" object="oCont"}]
                        [{gn2_oxscript include="js/widgets/oxmodalpopup.js" priority=10 }]
                        [{gn2_oxscript add="$( '#orderOpenWithdrawalBottom' ).oxModalPopup({target: '#popup2'});"}]
                        [{oxmultilang ident="FORM_REGISTER_IAGREETORIGHTOFWITHDRAWAL1" }]
                        <a id="orderOpenWithdrawalBottom" rel="nofollow" href="#">[{$oCont->oxcontents__oxtitle->value }]</a>
                        [{oxmultilang ident="FORM_REGISTER_IAGREETORIGHTOFWITHDRAWAL3"}]
                    [{/oxifcontent}]
                </span>
            </li>
        [{/if}]
    	</ul>
	</div>
	<div class="col right">
    	<h3 class="blockHead">[{oxmultilang ident="FORM_REGISTER_BILLINGADDRESS"}]</h3>
    	<ul class="form">[{include file="form/fieldset/user_billing.tpl"}]</ul>
	</div>
</div>
</form>
[{if $oView->isActive('PsLogin') }]
    <div id="popup1" class="popupBox">
         <img src="[{$oViewConf->getImageUrl('x.png')}]" alt="" class="closePop">
         [{oxifcontent ident="oxagb" object="oContent"}]
            [{$oContent->oxcontents__oxcontent->value}]
         [{/oxifcontent}]
    </div>
    <div id="popup2" class="popupBox">
         <img src="[{$oViewConf->getImageUrl('x.png')}]" alt="" class="closePop">
         [{oxifcontent ident="oxrightofwithdrawal" object="oContent"}]
            [{$oContent->oxcontents__oxcontent->value}]
         [{/oxifcontent}]
    </div>
[{/if}]