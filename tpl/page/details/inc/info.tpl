[{* Langbeschreibung*}]
[{oxhasrights ident="SHOWLONGDESCRIPTION"}]
    [{assign var="oLongdesc" value=$oDetailsProduct->getArticleLongDesc()}]
    [{if $oLongdesc->value}]
        <div id="description">
            [{oxeval var=$oLongdesc}]
            [{if $oDetailsProduct->oxarticles__oxexturl->value}]
                <a id="productExturl" class="js-external" href="[{$oDetailsProduct->oxarticles__oxexturl->value}]">[{$oDetailsProduct->oxarticles__oxurldesc->value}]</a>
            [{/if}]
        </div>
    [{/if}]
[{/oxhasrights}]

[{* Attribute *}]
[{if $oView->getAttributes()}]
    <div id="attributes">[{include file="page/details/inc/attributes.tpl"}]</div>
[{/if}]

[{* Preisalarm *}]
[{if $oView->isPriceAlarm() && !$oDetailsProduct->isParentNotBuyable()}]
    <div id="pricealarm">[{include file="form/pricealarm.tpl"}]</div>
[{/if}]

[{* Tags, Tagcloud *}]
[{if $oView->showTags() && ( $oView->getTagCloudManager() || ( ( $oView->getTagCloudManager() || $oxcmp_user) && $oDetailsProduct ) )}]
    <div id="tags">[{oxid_include_dynamic file="page/details/inc/tags.tpl"}]</div>
[{/if}]

[{* Media-Dateien *}]
[{if $oView->getMediaFiles() || $oDetailsProduct->oxarticles__oxfile->value}]
    <div id="media">[{include file="page/details/inc/media.tpl"}]</div>
[{/if}]

<div class="relatedFBContainer">
	[{* Facebook Comments *}]
    [{if $oView->isActive('FbComments') && $oViewConf->getFbAppId()}]
        [{assign var='_fbScript' value="http://connect.facebook.net/en_US/all.js#appId="|cat:$oViewConf->getFbAppId()|cat:"&amp;xfbml=1"}]
        <div id="productFbComments">[{include file="widget/facebook/enable.tpl" source="widget/facebook/comments.tpl" ident="#productFbComments" script=$_fbScript type="text"}]</div>
    [{/if}]
	
	[{* Facebook Invite *}]
    [{if $oView->isActive('FbInvite') && $oViewConf->getFbAppId()}]
            <div id="productFbInvite">
                <fb:serverfbml width="560px" id="productFbInviteFbml">
                    [{include file="widget/facebook/enable.tpl" source="widget/facebook/invite.tpl" ident="#productFbInviteFbml" type="text"}]
                </fb:serverfbml>
            </div>
    [{/if}]
	
	[{* Facebook Livestream *}]
    [{if $oView->isActive('FbLiveStream') && $oViewConf->getFbAppId()}]
        <div id="productFbLiveStream">[{include file="widget/facebook/enable.tpl" source="widget/facebook/livestream.tpl" ident="#productFbLiveStream" type="text"}]</div>
    [{/if}]
</div>