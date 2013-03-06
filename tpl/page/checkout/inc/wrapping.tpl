<div class="wrappingPopUp popupBox">

    <img src="[{$oViewConf->getImageUrl('x.png')}]" alt="" class="closePop">

    [{assign var="currency" value=$oView->getActCurrency() }]
    [{*block name="checkout_wrapping_header"}]
        <div class="wrappingIntro">
            <h3>[{oxmultilang ident="PAGE_CHECKOUT_WRAPPING_GIFTOPTION"}]</h3>
            <img src="[{$oViewConf->getImageUrl('gift-wrapping.jpg')}]" alt="[{oxmultilang ident="PAGE_CHECKOUT_WRAPPING_ADDWRAPPING"}]">
            <div class="introtext">
                [{oxmultilang ident="PAGE_CHECKOUT_WRAPPING_PERSONALMESSAGE"}]
            </div>
        </div>
    [{/block*}]

    [{block name="checkout_wrapping_contents"}]
        <h3 class="blockHead">[{oxmultilang ident="PAGE_CHECKOUT_WRAPPING_ADDWRAPPING"}]</h3>

        [{if !$oxcmp_basket->getProductsCount()}]
            <div>[{oxmultilang ident="PAGE_CHECKOUT_WRAPPING_BASKETEMPTY"}]</div>
        [{else}]
            <form name="basket" action="[{$oViewConf->getSelfActionLink() }]" method="post">

                [{$oViewConf->getHiddenSid()}]
                <input type="hidden" name="cl" value="basket">
                <input type="hidden" name="fnc" value="changewrapping">

                [{assign var="oWrapList" value=$oView->getWrappingList()}]
                [{if $oWrapList->count() }]
                    [{*basket items*}]
                    [{assign var="icounter" value="0"}]
                    <table class="wrappingData">

                        <colgroup>
                            <col class="thumbCol">
                            <col class="articleCol">
                            <col class="priceCol">
                        </colgroup>

                        [{assign var="basketitemlist" value=$oView->getBasketArticles()}]
                        [{foreach key=basketindex from=$oxcmp_basket->getContents() item=basketitem name=wrappArt}]
                            [{block name="checkout_wrapping_item"}]
                                [{assign var="basketproduct" value=$basketitemlist.$basketindex }]
                                <tr>
                                    <td>
                                        <a href="[{$basketitem->getLink()}]">
                                            <img src="[{$basketproduct->getIconUrl()}]" alt="[{$basketitem->getTitle()|strip_tags}]">
                                        </a>
                                    </td>

                                    <td>
                                        <a class="wrappingProdTitle" rel="nofollow" href="[{$basketitem->getLink()}]">[{$basketitem->getTitle()}]</a>

                                            <ul id="wrapp_[{$smarty.foreach.wrappArt.iteration}]" class="form wrappingForm">
                                                <li>
                                                    <input class="radiobox" type="radio" name="wrapping[[{$basketindex}]]" id="wrapping_[{$basketindex}]" value="0" [{if !$basketitem->getWrappingId()}]CHECKED[{/if}]>
                                                    <label for="wrapping_[{$basketindex}]">[{oxmultilang ident="PAGE_CHECKOUT_WRAPPING_NONE"}] <span class="wrappingPrice">(0,00 [{$currency->sign}])</span></label>
                                                </li>

                                                [{assign var="ictr" value="1"}]
                                                [{foreach from=$oView->getWrappingList() item=wrapping name=Wraps}]

                                                    [{assign var="basketwrapid" value=$wrapping->oxwrapping__oxid->value|cat:"-"|cat:$basketindex|replace:".":""}]

                                                    <li>
                                                        <input class="radiobox" type="radio" id="wrapping_[{$basketwrapid}]" name="wrapping[[{$basketindex}]]" value="[{$wrapping->oxwrapping__oxid->value}]" [{if $basketitem->getWrappingId() == $wrapping->oxwrapping__oxid->value}]CHECKED[{/if}]>

                                                        <label for="wrapping_[{$basketwrapid}]">
                                                            <span class="wrappingTitle">[{$wrapping->oxwrapping__oxname->value}]</span> <span class="wrappingPrice">([{$wrapping->getFPrice()}] [{$currency->sign}])</span>

                                                            [{if $wrapping->oxwrapping__oxpic->value }]
                                                                <span class="wrappingPic">
                                                                    <img src="[{$wrapping->getPictureUrl()}]" alt="[{$wrapping->oxwrapping__oxname->value}]">
                                                                </span>
                                                            [{/if}]
                                                        </label>
                                                    </li>
                                                    [{assign var="ictr" value="`$ictr+1`"}]
                                                [{/foreach}]

                                                [{gn2_oxscript add="$( '#wrapp_`$smarty.foreach.wrappArt.iteration` img' ).click(function(){ $(this).parent().parent().find('input').click(); });"}]
                                            </ul>

                                     </td>
                                </tr>
                                [{assign var="icounter" value="`$icounter+1`"}]
                            [{/block}]
                        [{/foreach}]
                    </table>
                [{/if}]

                [{assign var="oCardList" value=$oView->getCardList()}]
                [{if $oCardList->count()}]
                    [{block name="checkout_wrapping_cards"}]
                        <h3 class="blockHead">[{oxmultilang ident="PAGE_CHECKOUT_WRAPPING_GREETINGCARD" }]</h3>
                        <ul class="wrappingCard" id="wrappCard">


                            <li>
                                <p>
                                    <input class="radiobox" type="radio" name="chosencard" id="chosencard" value="0" [{if !$oxcmp_basket->getCardId() }]CHECKED[{/if}]>
                                    <label for="chosencard">
                                    [{oxmultilang ident="PAGE_CHECKOUT_WRAPPING_NOGREETINGCARD"}]
                                    </label>
                                </p>
                            </li>


                        [{assign var="icounter" value="0"}]
                        [{counter start=0 print=false}]
                        [{assign var="icounter" value="0"}]

                        [{foreach from=$oCardList item=card name=GreetCards}]
                            [{assign var="chosencardid" value=$card->oxwrapping__oxid->value|replace:'.':''}]

                            <li>
                                <p>
                                    <input class="radiobox" type="radio" name="chosencard" id="chosen_[{$chosencardid}]" value="[{$card->oxwrapping__oxid->value}]" [{ if $oxcmp_basket->getCardId() == $card->oxwrapping__oxid->value}]CHECKED[{/if}]>
                                    <label for="chosen_[{$chosencardid}]">
                                        [{$card->oxwrapping__oxname->value}] <strong>([{$card->getFPrice() }] [{$currency->sign}])</strong>

                                        [{if $card->oxwrapping__oxpic->value}]
                                            <span class="cardPic"><img src="[{$card->getPictureUrl()}]" alt="[{$card->oxwrapping__oxname->value}]"></span>
                                        [{/if}]
                                    </label>
                                </p>
                            </li>
                        [{assign var="icounter" value="`$icounter+1`"}]
                        [{/foreach}]


                        [{gn2_oxscript add="$( '#wrappCard img' ).click(function(){ $(this).parent().find('input').click(); });"}]
                        </ul>
                    [{/block}]

                [{/if}]

                <ul class="form">
                    [{if $oCardList->count()}]
                        [{block name="checkout_wrapping_comment"}]
                            <li class="wrappingComment">
                                <label>[{oxmultilang ident="PAGE_CHECKOUT_WRAPPING_GREETINGMESSAGE"}]</label>
                                <textarea cols="102" rows="5" name="giftmessage" class="areabox">[{$oxcmp_basket->getCardMessage()}]</textarea>
                            </li>
                        [{/block}]
                    [{/if}]

                    [{block name="checkout_wrapping_submit"}]
                        <li class="submitForm">
                            <button type="submit" class="submitButton largeButton nextStep">[{oxmultilang ident="PAGE_CHECKOUT_WRAPPING_BACKTOORDER" }]</button>
                            <button class="submitButton largeButton closePop">[{oxmultilang ident="PAGE_CHECKOUT_WRAPPING_CANCEL" }]</button>
                        </li>
                    [{/block}]
                </ul>

            </form>
        [{/if}]
    [{/block}]
</div>

[{gn2_oxscript include="js/widgets/oxmodalpopup.js" priority=10 }]
[{gn2_oxscript add="$('.wrappingTrigger').oxModalPopup({target:'.wrappingPopUp'});"}]