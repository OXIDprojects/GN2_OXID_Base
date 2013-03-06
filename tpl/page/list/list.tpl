[{gn2_oxscript add="$('a.js-external').attr('target', '_blank');"}]
[{gn2_oxscript include="js/widgets/oxarticlebox.js" priority=10 }]
[{gn2_oxscript add="$( '#content' ).oxArticleBox();"}]

[{capture append="oxidBlock_sidebar"}]

    [{assign var="listType" value=$oView->getListType()}]
    
    [{if $listType=='manufacturer' || $listType=='vendor'}]
        [{if $actCategory && $actCategory->getIconUrl()}]
            <div class="box">
                <h3>
                    [{if $listType=='manufacturer'}]
                        [{oxmultilang ident="BRAND"}]
                    [{elseif $listType=='vendor'}]
                        [{oxmultilang ident="VENDOR"}]
                    [{/if}]
                </h3>
                
                <div class="featured icon">
                    <img src="[{$actCategory->getIconUrl()}]" alt="[{$actCategory->getTitle()}]">
                </div>
            </div>
        [{/if}]
    [{/if}]
 
[{/capture}]

[{capture append="oxidBlock_content"}]
        [{assign var="actCategory" value=$oView->getActiveCategory()}]
        
        [{* Headline *}]
        <h2 class="pageHead listHead">
        	[{$actCategory->oxcategories__oxtitle->value}]
        	
        	[{assign var='rsslinks' value=$oView->getRssLinks() }]
            [{if $rsslinks.activeCategory}]
                <a class="rss js-external" id="rssActiveCategory" href="[{$rsslinks.activeCategory.link}]" title="[{$rsslinks.activeCategory.title}]"><img src="[{$oViewConf->getImageUrl('rss.png')}]" alt="[{$rsslinks.activeCategory.title}]"><span>[{$rsslinks.activeCategory.title}]</span></a>
            [{/if }]
        </h2>

        [{* Kategoriebild *}]
        [{if $actCategory->oxcategories__oxthumb->value }]
            [{if $actCategory->getThumbUrl()}]
                <p class="categoryPicture"><img src="[{$actCategory->getThumbUrl()}]" alt="[{$actCategory->oxcategories__oxtitle->value}]"></p>
            [{/if}]
        [{/if}]
        
        [{* Kurzbeschreibung *}]
        [{if $actCategory && $actCategory->oxcategories__oxdesc->value }]
            <div class="categoryTopDescription" id="catDesc">[{$actCategory->oxcategories__oxdesc->value}]</div>
        [{/if}]
        
        [{* Langbeschreibung *}]
        [{if $actCategory->oxcategories__oxlongdesc->value }]
            <div class="categoryTopLongDescription" id="catLongDesc">[{oxeval var=$actCategory->oxcategories__oxlongdesc}]</div>
        [{/if}]
		
		[{* Kategorie-Ausgabe *}]
        [{if $oView->hasVisibleSubCats()}]
            [{assign var="iSubCategoriesCount" value=0}]
            [{gn2_oxscript include="js/widgets/oxequalizer.js" priority=10 }]
            
            <ul class="subcatList">
                
                [{* CONFIG - Kategorien pro Seite *}]
                [{assign var="catperRow" value=4}]
                [{assign var="actRow" value=1}]
                [{gn2_oxscript add="$(function(){oxEqualizer.equalHeight($( '.subcatList li.catRow-`$actRow`' ));});"}]
                                
            	[{foreach from=$oView->getSubCatList() item=category name=MoreSubCat}]
                   	
                   	[{assign var="catIteration" value=$smarty.foreach.MoreSubCat.iteration}]
                   	[{if $catIteration % $catperRow == 0 && $catIteration > 0 && $catperRow > 0}]
						[{assign var="rowLast" value=true}]
					[{else}]
						[{assign var="rowLast" value=false}]
					[{/if}]
                   	
                   	
                    [{ if $category->getContentCats() }]
                       <li class="catRow-[{$actRow}]"><ul>
                        [{foreach from=$category->getContentCats() item=ocont name=MoreCms}]
                            <li>
                            	<a id="moreSubCms_[{$smarty.foreach.MoreSubCat.iteration}]_[{$smarty.foreach.MoreCms.iteration}]" href="[{$ocont->getLink()}]">[{$ocont->oxcontents__oxtitle->value}]</a>
                            </li>
                        [{/foreach}]
                        </ul></li>
                    [{/if }]
                    
                    
                    [{if $category->getIsVisible()}]
                        [{assign var="iSubCategoriesCount" value=$iSubCategoriesCount+1}]
                     	[{assign var="iconUrl" value=$category->getIconUrl()}]
                            
						<li class="catRow-[{$actRow}][{if $rowLast}] catRowLast[{/if}]">      
							[{* Subkategorie - Name *}]                      
		                    <a class="teasertitle" href="[{$category->getLink() }]">
		                        [{$category->oxcategories__oxtitle->value }][{if $oView->showCategoryArticlesCount() && ($category->getNrOfArticles() > 0) }] ([{$category->getNrOfArticles() }])[{/if}]
		                    </a>
							
							[{* Subkategorie - Teaserbild *}]
							[{if $iconUrl}]
                            <a class="teaserpic" href="[{$category->getLink() }]">
                                <img src="[{$category->getIconUrl() }]" alt="[{$category->oxcategories__oxtitle->value }]">
                            </a>
							[{/if}]
							
  							[{* Subkategorie - Unterkategorien *}]
	                        [{if $category->getHasVisibleSubCats()}]
	                            <ul>
	                                [{foreach from=$category->getSubCats() item=subcategory}]
	                                    [{if $subcategory->getIsVisible() }]
	                                        [{foreach from=$subcategory->getContentCats() item=ocont name=MoreCms}]
	                                            <li>
	                                                <a href="[{$ocont->getLink()}]">[{$ocont->oxcontents__oxtitle->value}]</a>
	                                            </li>
	                                        [{/foreach }]
	                                        <li>
	                                            <a href="[{$subcategory->getLink() }]">
	                                                [{$subcategory->oxcategories__oxtitle->value}] [{if $oView->showCategoryArticlesCount() && ($subcategory->getNrOfArticles() > 0) }] ([{$subcategory->getNrOfArticles() }])[{/if}]
	                                            </a>
	                                        </li>
	                                     [{/if}]
	                                [{/foreach}]
	                            </ul>
	                        [{/if}]
	                        
						</li>                                
                    [{/if}]
                    
                    [{if $rowLast}]
						[{assign var="actRow" value=$actRow+1}]
						[{gn2_oxscript add="$(function(){oxEqualizer.equalHeight($( '.subcatList li.catRow-`$actRow`' ));});"}]
					[{/if}]
                    
                [{/foreach}]
            </ul>
        [{/if}]


	[{* Artikelliste *}]
    [{if $oView->getArticleList()|@count > 0}]
        
        <div class="listRefine bottomRound">
            [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedTop() attributes=$oView->getAttributes() listDisplayType=true itemsPerPage=true sort=true }]
        </div>
        
        [{* List types: grid|line|infogrid *}]
        [{include file="widget/product/list.tpl" type=$oView->getListDisplayType() listId="productList" products=$oView->getArticleList()}]

        <div class="listRefine bottomRound">
            [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedBottom()}]
        </div>

    [{/if}]
    
    [{insert name="oxid_tracker"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left" tree_path=$oView->getTreePath()}]