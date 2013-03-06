[{gn2_oxscript add="$( 'a.js-amountPriceSelector' ).oxAmountPriceSelect();"}]
<a class="selector js-amountPriceSelector" href="#priceinfo" id="amountPrice" rel="nofollow"><img src="[{$oViewConf->getImageUrl('selectbutton.png')}]" alt="Select"></a>
[{assign var="currency" value=$oView->getActCurrency()}]
<ul class="pricePopup" id="priceinfo">
<li class="amountPriceHead"><h4>[{oxmultilang ident="DETAILS_MOREYOUBUYMOREYOUSAVE"}]</h4></li>
<li class="amountPriceDesc"><span class="amountValue">[{oxmultilang ident="DETAILS_FROM"}] </span></li>
[{foreach from=$oDetailsProduct->loadAmountPriceInfo() item=priceItem name=amountPrice}]
    <li>
        <span class="amountValue">[{$priceItem->oxprice2article__oxamount->value}] [{oxmultilang ident="DETAILS_PCS"}]</span>
        
        <span class="amountPrice">
            [{if $priceItem->oxprice2article__oxaddperc->value}]
              [{$priceItem->oxprice2article__oxaddperc->value}] [{oxmultilang ident="DETAILS_DISCOUNT"}]
            [{else}]
              <span>[{$priceItem->fbrutprice}]</span> [{$currency->sign}]
            [{/if}]
        </span>
    </li>
[{/foreach}]
</ul>