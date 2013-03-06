[{gn2_oxscript include="js/widgets/oxtabs.js" priority=10 }]
[{gn2_oxscript add="oxTabs();"}]

<div id="detailTabContainer">

	<ul id="detailTabs">
		
		[{oxhasrights ident="SHOWLONGDESCRIPTION"}][{assign var="oLongdesc" value=$oDetailsProduct->getLongDescription()}]
			[{if $oLongdesc->value || $oDetailsProduct->oxarticles__oxexturl->value}]
					<li class="active"><a href="#description">[{oxmultilang ident="TAB_LABEL_DESCRIPTION"}]</a></li>
			[{/if}]
		[{/oxhasrights}]
		
		[{if $oView->getAttributes()}]
			<li><a href="#attributes">[{oxmultilang ident="TAB_LABEL_ATTRIBUTES"}]</a></li>
		[{/if}]
			
		[{if $oView->isPriceAlarm() && !$oDetailsProduct->isParentNotBuyable()}]
			<li><a href="#pricealarm">[{oxmultilang ident="TAB_LABEL_PRICEALARM"}]</a></li>
		[{/if}]	
			
		[{if $oView->showTags() && ( $oView->getTagCloudManager() || ( ( $oView->getTagCloudManager() || $oxcmp_user) && $oDetailsProduct ) )}]
			<li><a href="#tags">[{oxmultilang ident="TAB_LABEL_TAGS"}]</a></li>
		[{/if}]
		
		[{if $oView->getMediaFiles() || $oDetailsProduct->oxarticles__oxfile->value}]
			<li><a href="#media">[{oxmultilang ident="TAB_LABEL_MEDIA"}]</a></li>
		[{/if}]
		
		[{if $oView->isActive('FbComments') && $oViewConf->getFbAppId()}]
			<li><a href="#productFbComments">[{oxmultilang ident="TAB_LABEL_FB_COMMENTS"}]</a></li>
		[{/if}]
		
		[{if $oView->isActive('FbInvite') && $oViewConf->getFbAppId()}]
			<li><a href="#productFbInvite">[{oxmultilang ident="TAB_LABEL_FB_INVITE"}]</a></li>
		[{/if}]
		
	</ul>
	
	<div id="detailTabContents">
		
		[{* Langbeschreibung *}]
		[{oxhasrights ident="SHOWLONGDESCRIPTION"}]
		    [{assign var="oLongdesc" value=$oDetailsProduct->getArticleLongDesc()}]
		    [{if $oLongdesc->value}]
		        <div id="description" class="tabinfo">
		            [{oxeval var=$oLongdesc}]
		            [{if $oDetailsProduct->oxarticles__oxexturl->value}]
		                <a id="productExturl" class="js-external" href="http://[{$oDetailsProduct->oxarticles__oxexturl->value}]">
                        [{if $oDetailsProduct->oxarticles__oxurldesc->value }]
                            [{$oDetailsProduct->oxarticles__oxurldesc->value }]
                        [{else}]
                            [{$oDetailsProduct->oxarticles__oxexturl->value }]
                        [{/if}]
                    </a>
		            [{/if}]
		        </div>
		    [{/if}]
		[{/oxhasrights}]
		
		[{* Attribute *}]
		[{if $oView->getAttributes()}]
		    <div id="attributes" class="tabinfo">[{include file="page/details/inc/attributes.tpl"}]</div>
		[{/if}]
		
		[{* Preisalarm *}]
		[{if $oView->isPriceAlarm() && !$oDetailsProduct->isParentNotBuyable()}]
		    <div id="pricealarm" class="tabinfo">[{include file="form/pricealarm.tpl"}]</div>
		[{/if}]
		
		[{* Tags, Tagcloud *}]
		[{if $oView->showTags() && ( $oView->getTagCloudManager() || ( ( $oView->getTagCloudManager() || $oxcmp_user) && $oDetailsProduct ) )}]
		    <div id="tags" class="tabinfo">[{oxid_include_dynamic file="page/details/inc/tags.tpl"}]</div>
		[{/if}]
		
		[{* Media-Dateien *}]
		[{if $oView->getMediaFiles() || $oDetailsProduct->oxarticles__oxfile->value}]
		    <div id="media" class="tabinfo">[{include file="page/details/inc/media.tpl"}]</div>
		[{/if}]
	
		[{* Facebook Comments *}]
	    [{if $oView->isActive('FbComments') && $oViewConf->getFbAppId()}]
	        [{assign var='_fbScript' value="http://connect.facebook.net/en_US/all.js#appId="|cat:$oViewConf->getFbAppId()|cat:"&amp;xfbml=1"}]
	        <div id="productFbComments" class="tabinfo">[{include file="widget/facebook/enable.tpl" source="widget/facebook/comments.tpl" ident="#productFbComments" script=$_fbScript type="text"}]</div>
	    [{/if}]
		
		[{* Facebook Invite *}]
	    [{if $oView->isActive('FbInvite') && $oViewConf->getFbAppId()}]
	            <div id="productFbInvite" class="tabinfo">
	                <fb:serverfbml width="560px" id="productFbInviteFbml">
	                    [{include file="widget/facebook/enable.tpl" source="widget/facebook/invite.tpl" ident="#productFbInviteFbml" type="text"}]
	                </fb:serverfbml>
	            </div>
	    [{/if}]
		
	</div>
	
</div>