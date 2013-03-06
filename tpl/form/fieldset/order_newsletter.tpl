[{if $blSubscribeNews}]
    <li class="billingNewsletter">
        [{block name="user_billing_newsletter"}]
        <input type="hidden" name="blnewssubscribed" value="0">
        <input id="subscribeNewsletter" class="checkbox" type="checkbox" name="blnewssubscribed" value="1" [{if $oView->isNewsSubscribed()}]checked[{/if}]>
        <label>[{oxmultilang ident="FORM_FIELDSET_USER_SUBSCRIBENEWSLETTER" }]</label>
        <p class="note">[{oxmultilang ident="FORM_FIELDSET_USER_SUBSCRIBENEWSLETTER_MESSAGE"}]</p>
        [{/block}]
    </li>
[{/if}]

[{if $markedFieldsNotice}]
    <li class="formNote">[{oxmultilang ident="FORM_USER_COMPLETEMARKEDFIELDS" }]</li>
[{/if}]