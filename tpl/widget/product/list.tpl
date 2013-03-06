[{ if $type=="line" || $type=="infogrid" }]
    [{gn2_oxscript include="js/widgets/oxcenterelementonhover.js" priority=10 }]
    [{gn2_oxscript add="$( '.pictureBox' ).oxCenterElementOnHover();" }]
[{/if}]

[{gn2_oxscript add="$('a.js-external').attr('target', '_blank');"}]
[{if $head}]
    [{if $header eq "light"}]
        <h3 class="sectionHead">[{$head}]</h3>
    [{else}]
        <h3 class="sectionHead">
            <span>[{$head}]</span>
            [{if $rsslink}]
                    <a class="rss js-external" id="[{$rssId}]" href="[{$rsslink.link}]" title="[{$rsslink.title}]"><img src="[{$oViewConf->getImageUrl('rss.png')}]" alt="[{$rsslink.title}]"><span>[{$rsslink.title}]</span></a>
            [{/if}]
        </h3>
    [{/if}]
[{/if}]
[{if $products|@count gt 0}]
    <ul class="[{$type}]View" id="[{$listId}]">
        [{foreach from=$products item=product name=productlist}]

           [{include file="widget/product/listitem.tpl" iteration=$smarty.foreach.productlist.iteration listtype=$type product=$product testid=$listId|cat:"_"|cat:$smarty.foreach.productlist.iteration blDisableToCart=$blDisableToCart}]

            [{*if ($type eq "infogrid" AND ($smarty.foreach.productlist.last) AND ($smarty.foreach.productlist.iteration % 2 != 0 )) }]
                <li class="productData"></li>
            [{/if*}]

        [{/foreach}]
    </ul>
[{/if}]