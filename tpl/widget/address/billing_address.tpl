[{capture name="billing_address" assign="billing_address"}][{strip}]

[{if $oxcmp_user->oxuser__oxcompany->value }]
    <li class="billingAddressCompany"> [{$oxcmp_user->oxuser__oxcompany->value}]</li>
[{/if}]

[{if $oxcmp_user->oxuser__oxaddinfo->value }]
    <li>[{$oxcmp_user->oxuser__oxaddinfo->value}]</li>
[{/if}]

[{if $oxcmp_user->oxuser__oxustid->value }]
    <li>[{oxmultilang ident="VAT_ID_NUMBER"}] [{$oxcmp_user->oxuser__oxustid->value}]</li>
[{/if}]

[{if $oxcmp_user->oxuser__oxsal->value || $oxcmp_user->oxuser__oxfname->value || $oxcmp_user->oxuser__oxlname->value}]
    <li class="billingAddressName">[{$oxcmp_user->oxuser__oxsal->value|oxmultilangsal}]&nbsp;[{$oxcmp_user->oxuser__oxfname->value}]&nbsp;[{$oxcmp_user->oxuser__oxlname->value}]</li>
[{/if}]

[{if $oxcmp_user->oxuser__oxstreet->value || $oxcmp_user->oxuser__oxstreetnr->value}]
    <li class="billingAddressStreet">[{$oxcmp_user->oxuser__oxstreet->value}]&nbsp;[{$oxcmp_user->oxuser__oxstreetnr->value}]</li>
[{/if}]

[{if $oxcmp_user->oxuser__oxstateid->value}]
    <li class="billingAddressState">[{$oxcmp_user->oxuser__oxstateid->value}]</li>
[{/if}]

[{if $oxcmp_user->oxuser__oxzip->value || $oxcmp_user->oxuser__oxcity->value}]
    <li class="billingAddressZip">[{$oxcmp_user->oxuser__oxzip->value}]&nbsp;[{$oxcmp_user->oxuser__oxcity->value}]</li>
[{/if}]

[{if $oxcmp_user->oxuser__oxcountry->value }]
    <li class="billingAddressCountry">[{$oxcmp_user->oxuser__oxcountry->value}]</li>
[{/if}]

[{if $oxcmp_user->oxuser__oxfon->value }]
    <li class="billingAddressOrderPhone">[{oxmultilang ident="PHONE_2"}] [{$oxcmp_user->oxuser__oxfon->value}]</li>
[{/if}]

[{if $oxcmp_user->oxuser__oxfax->value }]
    <li>[{oxmultilang ident="FAX"}] [{$oxcmp_user->oxuser__oxfax->value}]</li>
[{/if}]

[{if $oxcmp_user->oxuser__oxmobfon->value }]
    <li>[{oxmultilang ident="CELLUAR_PHONE"}] [{$oxcmp_user->oxuser__oxmobfon->value}]</li>
[{/if}]

[{if $oxcmp_user->oxuser__oxprivfon->value }]
    <li>[{oxmultilang ident="PERSONAL_PHONE"}] [{$oxcmp_user->oxuser__oxprivfon->value}]</li>
[{/if}]

[{if $oxcmp_user->oxuser__oxusername->value}]
    <li class="billingAddressMail">[{oxmultilang ident="EMAIL_2"}]&nbsp;[{$oxcmp_user->oxuser__oxusername->value}]</li>
[{/if}]

[{/strip}][{/capture}]

[{if $billing_address != ""}]
	<ul>[{$billing_address}]</ul>
[{/if}]