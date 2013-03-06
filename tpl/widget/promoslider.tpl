[{assign var=oBanners value=$oView->getBanners() }]
[{assign var="currency" value=$oView->getActCurrency()}]
[{if $oBanners|@count}]

    [{* Cycle *}]
    [{* gn2_oxstyle include="js/libs/cycle/cycle.css" *}]
    [{* gn2_oxscript include="js/libs/cycle/cycle.js" *}]

    [{* Nivo *}]
    [{gn2_oxstyle include="js/libs/nivoslider/nivoslider.css"}]
    [{gn2_oxscript include="js/libs/nivoslider/nivoslider.js"}]

    <div class="promotionSlider">
		<div class="promotionInner">
		    [{foreach from=$oBanners item=oBanner }]

                [{assign var=oArticle value=$oBanner->getBannerArticle() }]

                [{* auskommentieren bei Nutzung von NivoSlider *}]
                [{* <div class="promotionItem"> *}]

                    [{assign var=sBannerLink value=$oBanner->getBannerLink() }]
                    [{if $sBannerLink }]<a href="[{ $sBannerLink }]">[{/if}]

                        [{* auskommentieren bei Nutzung von NivoSlider
                        [{if $oArticle }]
                            <span class="promoBox">
                                <strong class="promoPrice">[{$oArticle->getFPrice()}] [{$currency->sign}]</strong>
                                <strong class="promoTitle">[{$oArticle->oxarticles__oxtitle->value}]</strong>
                            </span>
                        [{/if }]
                        *}]

                        [{assign var=sBannerPictureUrl value=$oBanner->getBannerPictureUrl()}]
                        [{if $sBannerPictureUrl}]<img src="[{$sBannerPictureUrl}]" alt="">[{/if}]

                    [{if $sBannerLink }]</a>[{/if}]

                [{* auskommentieren bei Nutzung von NivoSlider *}]
                [{* </div> *}]

            [{/foreach }]
		</div>
    </div>
[{/if }]