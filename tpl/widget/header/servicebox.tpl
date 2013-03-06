<li class="topPopList">
    [{if $oxcmp_user}]
        [{assign var="noticeListCount" value=$oxcmp_user->getNoticeListArtCnt()}]
        [{assign var="wishListCount" value=$oxcmp_user->getWishListArtCnt()}]
    [{else}]
        [{assign var="noticeListCount" value="0"}]
        [{assign var="wishListCount" value="0"}]
    [{/if}]
    [{math equation="a+b+c" a=$oView->getCompareItemsCnt() b=$noticeListCount c=$wishListCount assign=notificationsCounter}]
    [{gn2_oxscript include="js/widgets/oxflyoutbox.js" priority=10 }]
    [{gn2_oxscript add="$( '#servicesTrigger' ).oxFlyOutBox();"}]
    [{block name="widget_header_servicebox_flyoutbox"}]
        <span id="servicesTrigger" class="selectedValue [{if $notificationsCounter > 0}]hasNotifications[{/if}]">
            <a href="#" rel="nofollow"><span>[{oxmultilang ident="WIDGET_SERVICES_ACCOUNT"}]</span> [{if $notificationsCounter > 0}]<span class="counter">[{$notificationsCounter}]</span>[{/if}]</a>
        </span>
	    <ul id="services" class="flyoutBox">
	        [{block name="widget_header_servicebox_items"}]
	            <li class="active"><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" }]"><span>[{oxmultilang ident="WIDGET_SERVICES_ACCOUNT"}]</span></a></li>
	            <li><a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account" }]" rel="nofollow"><span>[{oxmultilang ident="LAYOUT_HEADER_ACCOUNT_LINK"}]</span></a></li>
	            [{if $oViewConf->getShowCompareList() }]
	                <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=compare" }]" rel="nofollow"><span>[{oxmultilang ident="LAYOUT_HEADER_COMPARE_LINK"}]</span> [{if $oView->getCompareItemsCnt() }]<span class="counter">[{$oView->getCompareItemsCnt() }]</span>[{/if}]</a></li>
	            [{/if}]
	            <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_noticelist" }]" rel="nofollow"><span>[{oxmultilang ident="LAYOUT_HEADER_NOTICELIST_LINK"}]</span> [{if $oxcmp_user && $oxcmp_user->getNoticeListArtCnt()}]<span class="counter">[{$oxcmp_user->getNoticeListArtCnt() }]</span>[{/if}]</a></li>
	            [{if $oViewConf->getShowWishlist()}]
	                <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist" }]" rel="nofollow"><span>[{oxmultilang ident="LAYOUT_HEADER_WISHLIST_LINK"}]</span> [{if $oxcmp_user && $oxcmp_user->getWishListArtCnt()}]<span class="counter">[{$oxcmp_user->getWishListArtCnt() }]</span>[{/if}]</a></li>
	            [{/if}]
	            [{if $oViewConf->getShowListmania()}]
	                <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_recommlist" }]" rel="nofollow"><span>[{oxmultilang ident="LAYOUT_HEADER_LISTMANIA_LINK"}]</span> [{if $oxcmp_user && $oxcmp_user->getRecommListsCount()}]<span class="counter">[{$oxcmp_user->getRecommListsCount() }]</span>[{/if}]</a></li>
	            [{/if}]
	            [{if $oView->isEnabledDownloadableFiles()}]
                  <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_downloads" }]" rel="nofollow"><span>[{oxmultilang ident="MY_DOWNLOADS"}]</span></a></li>
              [{/if}]
	        [{/block}]
	    </ul>
    [{/block}]
 </li>