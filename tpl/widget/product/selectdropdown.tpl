[{* OPTIONAL ZU selectbox.tpl KANN AUCH selectdropdown.tpl VERWENDET WERDEN *}]

[{gn2_oxscript include="js/widgets/oxdropdown.js" priority=10}]
[{gn2_oxscript add="$('div.dropDown p').oxDropDown();"}]

[{assign var="oSelections" value=$oSelectionList->getSelections()}]

[{if $oSelections}]
    <div class="dropDown [{$sSelType|default:"vardrop"}] [{$sJsAction}]">
        <p class="varSelect[{if $editable === false}] js-disabled[{/if}]">

            <label rel="[{$oSelectionList->getLabel()}]">[{$oSelectionList->getLabel()}]:</label>

            [{if $editable !== false}]
                [{assign var="oActiveSelection" value=$oSelectionList->getActiveSelection()}]
                <input type="hidden" name="[{$sFieldName|default:"varselid"}][[{$iKey}]]" value="[{if $oActiveSelection }][{$oActiveSelection->getValue()}][{/if}]">

                <select name="select_[{$sFieldName|default:"varselid"}][[{$iKey}]]">

                    [{if !$oActiveSelection && !$blHideDefault}]
                        <option value="" selected="selected">[{ oxmultilang ident="WIDGET_PRODUCT_ATTRIBUTES_PLEASECHOOSE"}]</option>
                    [{/if}]

                    [{foreach from=$oSelections item=oSelection}]
                        [{if !$oSelection->isDisabled()}]
                            <option value="[{$oSelection->getValue()}]" rel="[{$oSelection->getLink()}]" [{if $oSelection->isActive()}]selected="selected"[{/if}]>[{$oSelection->getName()}]</option>
                        [{/if}]
                    [{/foreach}]
                </select>
            [{/if}]
        </p>
    </div>
[{/if}]