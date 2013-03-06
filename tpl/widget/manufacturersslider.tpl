[{capture name="slides"}]
[{foreach from=$oView->getManufacturerForSlider() item=oManufacturer}]
    [{if $oManufacturer->oxmanufacturers__oxicon->value }]
        [{counter assign="slideCount"}]
        <li>
            <a href="[{ $oManufacturer->getLink() }]" class="viewAllHover">
                <span>[{oxmultilang ident="WIDGET_MANUFACTURERS_SLIDER_VIEWALL"}]</span>
            </a>
            <a class="sliderHover" href="[{$oManufacturer->getLink()}]"></a>
            <img src="[{$oManufacturer->getIconUrl()}]" alt="[{$oManufacturer->oxmanufacturers__oxtitle->value}]">
        </li>
        [{/if}]
    [{/foreach}]
[{/capture}]
[{if $slideCount > 6 }]
[{gn2_oxscript include="js/libs/jcarousellite.js"}]
[{gn2_oxscript include="js/widgets/oxmanufacturerslider.js" priority=10}]
[{gn2_oxscript add="$('#manufacturerSlider').oxManufacturerSlider();"}]
<div class="itemSlider">
    <div class="titleBlock"><h3 class="sectionHead">[{oxmultilang ident="WIDGET_MANUFACTURERS_SLIDER_OURBRANDS"}]</h3></div>
    <a class="prevItem slideNav" href="#" rel="nofollow"><span class="slidePointer">prev</span><span class="slideBg"></span></a>
    <a class="nextItem slideNav" href="#" rel="nofollow"><span class="slidePointer">next</span><span class="slideBg"></span></a>
    <div id="manufacturerSlider">
        <ul>
            [{$smarty.capture.slides}]
        </ul>
    </div>
</div>
[{/if}]