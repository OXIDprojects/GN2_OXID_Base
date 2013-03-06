[{if $oView->getWishList() }]
    <form name="wishlist_wishlist_status" action="[{ $oViewConf->getSelfActionLink() }]" method="post">
        <div class="wishlistPublish">
            [{$oViewConf->getHiddenSid() }]
            <input type="hidden" name="fnc" value="togglepublic">
            <input type="hidden" name="cl" value="account_wishlist">
            <h4>[{oxmultilang ident="FORM_WISHLIST_PUBLISH_PUBLISH"}]</h4>
            <ul class="form">
                <li>
                    <label>[{oxmultilang ident="FORM_WISHLIST_PUBLISH_MAKEWISHLISTPUBLISH"}]</label>
                    <select name="blpublic">
                        <option value="0">[{oxmultilang ident="FORM_WISHLIST_PUBLISH_NO"}]</option>
                        [{assign var="wishlist" value=$oView->getWishList() }]
                        <option value="1"  [{if $wishlist->oxuserbaskets__oxpublic->value }]selected [{/if }] >[{oxmultilang ident="FORM_WISHLIST_PUBLISH_YES"}]</option>
                    </select>
                </li>
                <li class="formSubmit">
                    <button class="submitButton" type="submit">[{oxmultilang ident="FORM_WISHLIST_PUBLISH_SAVE"}]</button>
                </li>
            </ul>
            <p><a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist" params="blshowsuggest=1" }]">
                [{oxmultilang ident="PAGE_ACCOUNT_WISHLIST_CLICKHERETOSENDWISHLIST"}]
            </a></p>
        </div>
    </form>
[{/if}]