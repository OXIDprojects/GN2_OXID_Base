[{capture append="oxidBlock_content"}]
[{assign var="product" value=$oView->getProduct()}]
[{assign var="template_title" value=$product->oxarticles__oxtitle->value|cat:" "|cat:$product->oxarticles__oxvarselect->value}]

<h2 class="pageHead accountHead">[{$template_title}]</h2>

[{oxid_include_dynamic file="form/recommendation_add.tpl" testid=""}]
[{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{include file="layout/page.tpl" sidebar="Left"}]

