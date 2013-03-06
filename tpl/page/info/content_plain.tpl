[{capture append="oxidBlock_content"}]
    [{assign var="oContent" value=$oView->getContent()}]
    [{assign var="tpl" value=$oViewConf->getActTplName()}]
    [{assign var="template_title" value=$oView->getTitle()}]
    
    <h2 class="pageHead">[{$template_title}]</h2>

    [{$oView->getParsedContent()}]
    
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{include file="layout/popup.tpl"}]