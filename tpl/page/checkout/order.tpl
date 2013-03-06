[{gn2_oxscript include="js/widgets/oxagbcheck.js" priority=10 }]
[{gn2_oxscript add="$('#checkAgb').oxAGBCheck();"}]

[{capture append="oxidBlock_content"}]

    [{* ordering steps *}]
    [{* include file="page/checkout/inc/steps.tpl" active=4 *}]

    [{block name="checkout_order_main"}]
    
        <div class="lineBox top">
            <span class="title">[{oxmultilang ident="PAGE_CHECKOUT_ORDER_TITLE2"}]</span>
        </div>
        
        [{block name="checkout_order_errors"}]
            [{if $oView->isConfirmAGBActive() && $oView->isConfirmAGBError() == 1}]
                [{include file="message/error.tpl" statusMessage="PAGE_CHECKOUT_ORDER_READANDCONFIRMTERMS"|oxmultilangassign }]
            [{/if}]
            
            [{assign var="iError" value=$oView->getAddressError() }]
            [{if $iError == 1}]
                [{include file="message/error.tpl" statusMessage="ERROR_DELIVERY_ADDRESS_WAS_CHANGED_DURING_CHECKOUT"|oxmultilangassign }]
            [{/if}]
        [{/block}]
        
        
        [{block name="checkout_order_details"}]
            [{if !$oxcmp_basket->getProductsCount()}]
                <div>[{oxmultilang ident="PAGE_CHECKOUT_ORDER_BASKETEMPTY"}]</div>
            [{else}]
            
                [{assign var="currency" value=$oView->getActCurrency() }]

                [{if $oView->isLowOrderPrice()}]
                    [{block name="checkout_order_loworderprice_top"}]
                        <div>[{oxmultilang ident="MIN_ORDER_PRICE"}] [{$oView->getMinOrderPrice()}] [{$currency->sign}]</div>
                    [{/block}]
                [{/if}]
                
                
                <form action="[{ $oViewConf->getSslSelfLink() }]" method="post" id="orderConfirmAgb">
                    [{$oViewConf->getHiddenSid()}]
                    [{$oViewConf->getNavFormParams()}]
                    <input type="hidden" name="cl" value="order">
                    <input type="hidden" name="fnc" value="[{$oView->getExecuteFnc()}]">
                    <input type="hidden" name="challenge" value="[{$challenge}]">
                    <input type="hidden" name="sDeliveryAddressMD5" value="[{$oView->getDeliveryAddressMD5()}]">
                    
                    
                    [{* AGB BESTAETIGUNG *}]
                    <div class="agb">
                        [{if $oView->isActive('PsLogin') }]
                            <input type="hidden" name="ord_agb" value="1">
                        [{else}]
                            [{if $oView->isConfirmAGBActive()}]
                                [{oxifcontent ident="oxrighttocancellegend" object="oContent"}]
                                    <h3 class="section"><strong>[{$oContent->oxcontents__oxtitle->value}]</strong></h3>
                                    <input type="hidden" name="ord_agb" value="0">
                                    <input id="checkAgb" class="checkbox" type="checkbox" name="ord_agb" value="1">
                                    
                                    [{$oContent->oxcontents__oxcontent->value}]
                                [{/oxifcontent}]
                                
                                 <p class="errorMsg agbError" name="agbError">[{oxmultilang ident="PAGE_CHECKOUT_ORDER_READANDCONFIRMTERMS"}]</p>
                            [{else}]
                                [{oxifcontent ident="oxrighttocancellegend2" object="oContent"}]
                                    <h3 class="section"><strong>[{$oContent->oxcontents__oxtitle->value}]</strong></h3>
                                    <input type="hidden" name="ord_agb" value="1">
                                
                                    [{$oContent->oxcontents__oxcontent->value}]
                                [{/oxifcontent}]
                            [{/if}]
                        [{/if}]
                    </div>
                    
                    
                    [{* ADDRESS *}]
                    [{block name="checkout_order_address"}]
                        <div id="orderAddress">
                            <h3 class="sectionHead checkoutHead">
                                <strong>[{oxmultilang ident="PAGE_CHECKOUT_ORDER_ADDRESSES"}]</strong>
                                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=user"}]" class="submitButton largeButton">[{oxmultilang ident="PAGE_CHECKOUT_ORDER_MODIFYADDRESS"}]</a>
                            </h3>
                            
                            <dl class="orderBillingAddress">
                                <dt>[{oxmultilang ident="PAGE_CHECKOUT_ORDER_BILLINGADDRESS"}]</dt>
                                <dd>
                                    [{include file="widget/address/billing_address.tpl"}]
                                </dd>
                            </dl>
                            
                            [{assign var="oDelAdress" value=$oView->getDelAddress()}]
                            [{if $oDelAdress }]
                            <dl class="orderShippingAddress">
                                <dt>[{oxmultilang ident="PAGE_CHECKOUT_ORDER_SHIPPINGADDRESS"}]</dt>
                                <dd>
                                    [{include file="widget/address/shipping_address.tpl" delivadr=$oDelAdress}]
                                </dd>
                            </dl>
                            [{/if}]
    
                            [{if $oView->getOrderRemark() }]
                                <p class="orderMessage">
                                    <span>[{oxmultilang ident="PAGE_CHECKOUT_ORDER_WHATIWANTEDTOSAY"}]</span> [{$oView->getOrderRemark()}]
                                </p>
                            [{/if}]
                        </div>
                    [{/block}]
    
    
                    [{* PAYMENT *}]
                    [{block name="shippingAndPayment"}]
                    <div id="orderShippingPayment">
                        <div id="orderShipping">
                            <h3 class="sectionHead checkoutHead">
                                <strong>[{oxmultilang ident="PAGE_CHECKOUT_ORDER_SHIPPINGCARRIER"}]</strong>
                             [{*<a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=payment"}]" class="submitButton largeButton">[{oxmultilang ident="PAGE_CHECKOUT_ORDER_MODIFY2"}]</a>*}]
                            </h3>
                                
                            [{assign var="oShipSet" value=$oView->getShipSet() }]
                            [{$oShipSet->oxdeliveryset__oxtitle->value}]
                        </div>
    
                        <div id="orderPayment">
                            <h3 class="sectionHead checkoutHead">
                                <strong>[{oxmultilang ident="PAGE_CHECKOUT_ORDER_PAYMENTMETHOD"}]</strong>
                                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=payment"}]" class="submitButton largeButton">[{oxmultilang ident="PAGE_CHECKOUT_ORDER_MODIFY3"}]</a>
                            </h3>
                            [{assign var="payment" value=$oView->getPayment() }]
                            [{$payment->oxpayments__oxdesc->value}]
                        </div>
                    </div>
                    [{/block}]
    
    
                    [{* BASKET *}]
                    <h3 class="sectionHead checkoutHead">
                        <strong>[{oxmultilang ident="PAGE_CHECKOUT_ORDER_BASKET"}]</strong>
                        <a href="[{oxgetseourl ident=$oViewConf->getBasketLink()}]" class="submitButton largeButton">[{oxmultilang ident="PAGE_CHECKOUT_ORDER_MODIFY4"}]</a>
                    </h3>
    
                    [{block name="order_basket"}]
                        [{include file="page/checkout/inc/basketcontents.tpl" editable=false}]
                    [{/block}]
    
                    [{block name="checkout_order_vouchers"}]
                        [{if $oViewConf->getShowVouchers() && $oxcmp_basket->getVouchers()}]
                            [{oxmultilang ident="PAGE_CHECKOUT_ORDER_USEDCOUPONS"}]
                            <div>
                                [{foreach from=$Errors.basket item=oEr key=key}]
                                    [{if $oEr->getErrorClassType() == 'oxVoucherException'}]
                                        [{oxmultilang ident="PAGE_CHECKOUT_ORDER_COUPONNOTACCEPTED1"}] [{$oEr->getValue('voucherNr')}] [{oxmultilang ident="PAGE_CHECKOUT_ORDER_COUPONNOTACCEPTED2"}]<br>
                                        [{oxmultilang ident="PAGE_CHECKOUT_ORDER_REASON"}]
                                        [{$oEr->getOxMessage() }]<br>
                                    [{/if}]
                                [{/foreach}]
                                [{foreach from=$oxcmp_basket->getVouchers() item=sVoucher key=key name=aVouchers}]
                                    [{$sVoucher->sVoucherNr}]<br>
                                [{/foreach }]
                            </div>
                        [{/if}]
                    [{/block}]
    
                      
                    [{* SUBMIT BUTTON *}]
                    [{if $oView->isLowOrderPrice() }]
                        [{block name="checkout_order_loworderprice_bottom"}]
                            <div class="lineBox clear">
                                <div>[{oxmultilang ident="MIN_ORDER_PRICE"}] [{$oView->getMinOrderPrice() }] [{$currency->sign}]</div>
                            </div>
                        [{/block}]
                    [{else}]
                        [{block name="checkout_order_btn_confirm_bottom"}] 
                            <p class="errorMsg agbError" name="agbError">[{oxmultilang ident="PAGE_CHECKOUT_ORDER_READANDCONFIRMTERMS"}]</p>
                                                       
                            <div class="lineBox bottom">
                                <a href="[{ oxgetseourl ident=$oViewConf->getPaymentLink() }]" class="prevStep submitButton largeButton">[{oxmultilang ident="PAGE_CHECKOUT_ORDER_BACKSTEP"}]</a>
                                <button type="submit" class="submitButton nextStep largeButton">[{oxmultilang ident="PAGE_CHECKOUT_ORDER_SUBMITORDER"}]</button>
                            </div>
                        [{/block}]
                    [{/if}]
                    
                    
                </form>

            [{/if}]
        [{/block}]
    
    [{/block}]
    
    [{insert name="oxid_tracker" title=$template_title }]
[{/capture}]

[{assign var="template_title" value="PAGE_CHECKOUT_ORDER_TITLE"|oxmultilangassign}]
[{include file="layout/page.tpl" title=$template_title location=$template_title sidebar="Left" checkoutStep=4}]