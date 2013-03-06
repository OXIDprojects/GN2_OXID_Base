[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="PAGE_ACCOUNT_NOTICELIST_MYWISHLIST"|oxmultilangassign}]
     <h2 class="pageHead accountHead">[{oxmultilang ident="PAGE_ACCOUNT_NOTICELIST_MYWISHLIST"}]</h2>
    [{if $oView->getNoticeProductList() }]
        [{include file="widget/product/list.tpl" type="line" listId="noticelistProductList" title="" products=$oView->getNoticeProductList() removeFunction="tonoticelist" owishid=$oxcmp_user->oxuser__oxid->value}]
    [{else}]
        <p>[{oxmultilang ident="PAGE_ACCOUNT_NOTICELIST_EMPTYWISHLIST"}]</p>
    [{/if}]
    [{insert name="oxid_tracker" title=$template_title }]
[{/capture}]
[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl" active_link="noticelist"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]