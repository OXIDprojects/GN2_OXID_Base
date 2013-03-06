[{* Important ! render page head and body to collect scripts and styles *}]
[{capture append="oxidBlock_pageHead"}]

    [{assign var="_sMetaTitlePrefix" value=$oView->getTitlePrefix() }]
    [{assign var="_sMetaTitleSuffix" value=$oView->getTitleSuffix() }]
    [{assign var="_sMetaTitlePageSuffix" value=$oView->getTitlePageSuffix() }]
    [{assign var="_sMetaTitle" value=$oView->getTitle() }]

    <title>[{$_sMetaTitlePrefix }][{if $_sMetaTitlePrefix && $_sMetaTitle }] | [{/if}][{$_sMetaTitle|strip_tags}][{if $_sMetaTitleSuffix && ($_sMetaTitlePrefix || $_sMetaTitle) }] | [{/if}][{$_sMetaTitleSuffix}] [{if $_sMetaTitlePageSuffix }] | [{$_sMetaTitlePageSuffix }] [{/if}]</title>
    <meta http-equiv="Content-Type" content="text/html; charset=[{$oView->getCharSet()}]">
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=9" >
    <![endif]-->
    [{if $oView->noIndex() == 1 }]
        <meta name="ROBOTS" content="NOINDEX, NOFOLLOW">
    [{elseif $oView->noIndex() == 2 }]
        <meta name="ROBOTS" content="NOINDEX, FOLLOW">
    [{/if}]
    [{if $oView->getMetaDescription()}]
        <meta name="description" content="[{$oView->getMetaDescription()}]">
    [{/if}]
    [{if $oView->getMetaKeywords()}]
        <meta name="keywords" content="[{$oView->getMetaKeywords()}]">
    [{/if}]

    [{if $oViewConf->getFbAppId()}]
        <meta property="og:site_name" content="[{$oViewConf->getBaseDir()}]">
        <meta property="fb:app_id" content="[{$oViewConf->getFbAppId()}]">
        <meta property="og:title" content="[{ $_sMetaTitlePrefix }][{if $_sMetaTitlePrefix && $_sMetaTitle }] | [{/if}][{$_sMetaTitle|strip_tags}][{if $_sMetaTitleSuffix && ($_sMetaTitlePrefix || $_sMetaTitle) }] | [{/if}][{$_sMetaTitleSuffix}] [{if $_sMetaTitlePageSuffix }] | [{$_sMetaTitlePageSuffix }] [{/if}]">
        [{if $oViewConf->getActiveClassName() == 'details' }]
            <meta property="og:type" content="product">
            <meta property="og:image" content="[{$oView->getActPicture()}]">
            <meta property="og:url" content="[{$oView->getCanonicalUrl()}]">
        [{ else }]
            <meta property="og:type" content="website">
            <meta property="og:image" content="[{$oViewConf->getImageUrl('basket.png')}]">
            <meta property="og:url" content="[{$oViewConf->getCurrentHomeDir()}]">
        [{/if}]
    [{/if}]


    [{assign var="canonical_url" value=$oView->getCanonicalUrl()}]
    [{if $canonical_url }]
        <link rel="canonical" href="[{$canonical_url }]">
    [{/if}]
    <link rel="shortcut icon" href="[{$oViewConf->getImageUrl('favicon.ico') }]">

    [{block name="base_style"}]
        [{*gn2_oxstyle include="css/__oxid.css"*}]

        [{gn2_oxstyle include="css/global.css"}]
        [{gn2_oxstyle include="css/header.css"}]
        [{gn2_oxstyle include="css/footer.css"}]
        [{gn2_oxstyle include="css/sidebar.css"}]

        [{gn2_oxstyle include="css/start.css"}]
        [{gn2_oxstyle include="css/list.css"}]
        [{gn2_oxstyle include="css/detail.css"}]

        [{gn2_oxstyle include="css/checkout.css"}]
        [{gn2_oxstyle include="css/account.css"}]

        [{gn2_oxstyle include="css/search.css"}]
        [{gn2_oxstyle include="css/meta.css"}]

        [{gn2_oxstyle include="css/cms.css"}]
        [{gn2_oxstyle include="css/toxid.css"}]

        [{gn2_oxstyle include="css/crossbrowser.css"}]


        [{gn2_oxstyle include="js/libs/fancybox/fancybox.css"}]
        [{gn2_oxstyle include="js/libs/magiczoom/magiczoom.css"}]
        [{gn2_oxstyle include="../../../sleightofhand/data/soh.css"}]

        [{gn2_oxstyle include="css/libs/jscrollpane.css"}]
    [{/block}]

    [{assign var='rsslinks' value=$oView->getRssLinks() }]
    [{if $rsslinks}]
        [{foreach from=$rsslinks item='rssentry'}]
            <link rel="alternate" type="application/rss+xml" title="[{$rssentry.title|strip_tags}]" href="[{$rssentry.link}]">
        [{/foreach}]
    [{/if}]

    [{block name="head_css"}]
        [{foreach from=$oxidBlock_head item="_block"}]
            [{$_block}]
        [{/foreach}]
    [{/block}]

[{/capture}]
<!DOCTYPE HTML>
<html lang="[{$oView->getActiveLangAbbr() }]" [{if $oViewConf->getShowFbConnect() }]xmlns:fb="http://www.facebook.com/2008/fbml"[{/if}]>
<head>
    [{foreach from=$oxidBlock_pageHead item="_block"}]
        [{$_block}]
    [{/foreach}]
    [{gn2_oxstyle}]
</head>

<!--[if lt IE 7 ]> <body class="ie6 ie[{if $smarty.get.plain > 0}] plain[{/if}]"> <![endif]-->
<!--[if IE 7 ]>    <body class="ie7 ie[{if $smarty.get.plain > 0}] plain[{/if}]"> <![endif]-->
<!--[if IE 8 ]>    <body class="ie8 ie[{if $smarty.get.plain > 0}] plain[{/if}]"> <![endif]-->
<!--[if IE 9 ]>    <body class="ie9 ie[{if $smarty.get.plain > 0}] plain[{/if}]"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <body [{if $smarty.get.plain > 0}]class="plain"[{/if}]> <!--<![endif]-->

    [{foreach from=$oxidBlock_pageBody item="_block"}]
        [{$_block}]
    [{/foreach}]
    [{foreach from=$oxidBlock_pagePopup item="_block"}]
        [{$_block}]
    [{/foreach}]

	[{* Falls Browser IE ist, setze $ie_browser auf true *}]
	[{browser_is vendor="ie" assign="ie_browser"}]

    [{block name="base_js"}]
        [{gn2_oxscript include="js/libs/jquery.min.js" priority=1}]
        [{gn2_oxscript include="js/libs/jquery-ui.min.js" priority=1}]
        [{gn2_oxscript include="js/libs/jquery.hoverintent.js" priority=5}]

       	[{gn2_oxscript include="js/libs/fancybox/fancybox.js" priority=5}]
       	[{gn2_oxscript include="js/libs/magiczoom/magiczoom.js" priority=5}]
        [{gn2_oxscript include="js/libs/gallery.js" priority=5}]

        [{gn2_oxscript include="js/libs/init.js" priority=10}]

        [{gn2_oxscript include="../../../sleightofhand/data/soh.js" priority=10}]
        [{if $ie_browser}][{gn2_oxscript include="../../../sleightofhand/data/soh-ie.js" priority=10}][{/if}]

 		[{gn2_oxscript add="oxDetailGallery();" priority=10}]

    [{/block}]

    [{if $oViewConf->isTplBlocksDebugMode()}]
        [{gn2_oxscript include="js/widgets/oxblockdebug.js"}]
        [{gn2_oxscript add="$( 'hr.debugBlocksStart' ).oxBlockDebug();"}]
    [{/if}]

    [{gn2_oxscript}]
    [{oxid_include_dynamic file="widget/dynscript.tpl"}]

    [{foreach from=$oxidBlock_pageScript item="_block"}]
        [{$_block}]
    [{/foreach}]

</body>
</html>