[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="PAGE_ACCOUNT_WISHLIST_TITLE"|oxmultilangassign}]
    [{if !$oView->getWishListUsers() && $oView->getWishListSearchParam() }]
        [{assign var="_statusMessage" value="PAGE_ACCOUNT_WISHLIST_SORRYNOWISHLIST"|oxmultilangassign}]
        [{include file="message/error.tpl" statusMessage=$_statusMessage}]
    [{/if }]
    [{assign var="editval" value=$oView->getEnteredData() }]
    [{if $oView->isWishListEmailSent() }]
        [{assign var="_statusMessage" value="PAGE_ACCOUNT_WISHLIST_SENDSUCCESSFULLY1"|oxmultilangassign|cat:" "|cat:$editval->rec_email|cat:" "}]
        [{assign var="_statusMessageSuffix" value="PAGE_ACCOUNT_WISHLIST_SENDSUCCESSFULLY2"|oxmultilangassign}]
        [{include file="message/notice.tpl" statusMessage=$_statusMessage|cat:$_statusMessageSuffix}]
    [{/if }]
    <h2 class="pageHead accountHead">[{oxmultilang ident="PAGE_ACCOUNT_WISHLIST_TITLE" }]</h2>
    <div class="wishlistView">
        <div class="col left">[{include file="form/wishlist_search.tpl" searchClass="account_wishlist"}]</div>
        [{if $oView->getWishList() }]
            <div class="col right">[{include file="form/wishlist_publish.tpl"}]
            [{include file="form/wishlist_suggest.tpl"}]</div>
        [{/if}]
    </div>
    [{if $oView->getWishList() }]
        [{include file="widget/product/list.tpl" type="line" listId="wishlistProductList" title="" products=$oView->getWishProductList() removeFunction="towishlist" toBasketFunction="tobasket" owishid=$oxcmp_user->oxuser__oxid->value}]
    [{else }]
        <p>[{oxmultilang ident="PAGE_ACCOUNT_WISHLIST_WISHLISTISEMPTY"}]</p>
    [{/if }]
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]
[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl" active_link="wishlist"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]