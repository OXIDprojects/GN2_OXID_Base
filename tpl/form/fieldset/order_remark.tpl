[{if $blOrderRemark}]
    <li class="orderRemark">
        <label>[{oxmultilang ident="FORM_FIELDSET_USER_YOURMESSAGE" }]</label>
        [{*<label for="orderRemark">[{oxmultilang ident="FORM_FIELDSET_USER_MESSAGEHERE" }]</label>*}]
        <textarea id="orderRemark" cols="60" rows="7" name="order_remark" class="areabox" >[{$oView->getOrderRemark()}]</textarea>
    </li>
[{/if}]

[{if $markedFieldsNotice}]
    <li class="formNote">[{oxmultilang ident="FORM_USER_COMPLETEMARKEDFIELDS" }]</li>
[{/if}]