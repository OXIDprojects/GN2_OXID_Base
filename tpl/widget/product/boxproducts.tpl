[{gn2_oxscript add="$('a.js-external').attr('target', '_blank');"}]
[{gn2_oxscript include="js/widgets/oxarticlebox.js" priority=10 }]
<div class="box" [{if $listId}]id="[{$listId}]"[{/if}]>
    [{if $_sHeaderIdent}]
        <h3[{if $header}] class="[{$header}]"[{/if}]>
            [{$head}]
            [{assign var='rsslinks' value=$oView->getRssLinks() }]
            [{if $rsslinks.topArticles}]
                <a class="rss js-external" id="rssTopProducts" href="[{$rsslinks.topArticles.link}]" title="[{$rsslinks.topArticles.title}]"><img src="[{$oViewConf->getImageUrl('rss.png')}]" alt="[{$rsslinks.topArticles.title}]"><span>[{$rsslinks.topArticles.title}]</span></a>
            [{/if }]
        </h3>
    [{/if}]
    <ul class="js-articleBox featuredList">
	[{foreach from=$products item=_oBoxProduct name=_sProdList}]
			[{assign var="currency" value=$oView->getActCurrency()}]
			[{assign var="_sTitle" value="`$_oBoxProduct->oxarticles__oxtitle->value` `$_oBoxProduct->oxarticles__oxvarselect->value`"|strip_tags}]
			<li[{if $smarty.foreach._sProdList.first}] class="first active"[{/if}]>
				
				<div class="articleBoxImage">
					<a href="[{ $_oBoxProduct->getMainLink() }]">
						<img src="[{$_oBoxProduct->getIconUrl()}]" alt="[{$_sTitle}]">
					</a>
				</div>
				
				<a class="articleTitle" href="[{ $_oBoxProduct->getMainLink() }]">
                    [{$_sTitle}]<br>
                    [{oxhasrights ident="SHOWARTICLEPRICE"}]
                        [{if $_oBoxProduct->getFPrice()}]
                            <span class="price">[{$_oBoxProduct->getFPrice()}] [{$currency->sign}] *</span>
                        [{/if}]
                    [{/oxhasrights}]
				</a>
				<div class="goToProduct"><a href="[{$_oBoxProduct->getMainLink()}]">[{oxmultilang ident="BOXPRODUCTS_GO_TO_PRODUCT"}]</a></div>
			</li>
    [{/foreach}]
	</ul>
    
</div>