[{if $delivadr }]
	[{capture name="shipping_address" assign="shipping_address"}][{strip}]

	    [{if $delivadr->oxaddress__oxcompany->value }]
	    	<li>[{$delivadr->oxaddress__oxcompany->value}]</li>
	    [{/if}]

	    [{if $delivadr->oxaddress__oxaddinfo->value }]
	    	<li>[{$delivadr->oxaddress__oxaddinfo->value}]</li>
	    [{/if}]

	    [{if $delivadr->oxaddress__oxsal->value || $delivadr->oxaddress__oxfname->value || $delivadr->oxaddress__oxfname->value}]
	    	<li>[{$delivadr->oxaddress__oxsal->value|oxmultilangsal}]&nbsp;[{$delivadr->oxaddress__oxfname->value}]&nbsp;[{$delivadr->oxaddress__oxlname->value}]</li>
	    [{/if}]

	    [{if $delivadr->oxaddress__oxstreet->value || $delivadr->oxaddress__oxstreetnr->value}]
	    	<li>[{$delivadr->oxaddress__oxstreet->value}]&nbsp;[{$delivadr->oxaddress__oxstreetnr->value}]</li>
	    [{/if}]

	    [{if $delivadr->oxaddress__oxstateid->value}]
	    	<li>[{$delivadr->oxaddress__oxstateid->value}]</li>
	    [{/if}]

	    [{if $delivadr->oxaddress__oxzip->value || $delivadr->oxaddress__oxcity->value}]
	    	<li>[{$delivadr->oxaddress__oxzip->value}]&nbsp;[{$delivadr->oxaddress__oxcity->value}]</li>
	    [{/if}]

	    [{if $delivadr->oxaddress__oxcountry->value }]
	    	<li>[{$delivadr->oxaddress__oxcountry->value}]</li>
	    [{/if}]

	    [{if $delivadr->oxaddress__oxfon->value }]
	    	<li>[{oxmultilang ident="PHONE2"}] [{$delivadr->oxaddress__oxfon->value}]</li>
	    [{/if}]

      [{if $delivadr->oxaddress__oxfax->value }]
          <li>[{oxmultilang ident="FAX"}] [{$delivadr->oxaddress__oxfax->value}]</li>
      [{/if}]

	[{/capture}]

	[{if $shipping_address}]
		<ul>[{$shipping_address}]</ul>
	[{/if}]

[{/strip}][{/if}]

