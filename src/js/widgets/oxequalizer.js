/**
 *    This file is part of OXID eShop Community Edition.
 *
 *    OXID eShop Community Edition is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    OXID eShop Community Edition is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with OXID eShop Community Edition.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @link      http://www.oxid-esales.com
 * @package   out
 * @copyright (C) OXID eSales AG 2003-2012
 * @version OXID eShop CE
 * @version   SVN: $Id: oxequalizer.js 35529 2011-05-23 07:31:20Z vilma $
 */
( function ( $ ) {

    /**
     * Equalize columns
     */
    oxEqualizer = {

        /**
         * Gets tallest element value - height
         *
         * @return integer
         */
        equalHeight: function(group, target)
        {
            var self    = this,
                newh    = 0,
                tallest = 0,
                spacings = 0;

            if ( target ) {

                tallest = self.getTallestHeight( group );

                if (tallest < target.outerHeight(false)){
                    tallest = target.outerHeight(false);
                }

            } else {
                tallest = self.getTallestHeight( group );
            }

            if( tallest ) {
                group.each(function(){
                    if($(this).hasClass('oxEqualized')) {
                        $(this).css('height','');
                        $(this).removeClass('oxEqualized');
                    }
                    spacings = $(this).outerHeight(false) - $(this).height();
                    newh = tallest - spacings;

                    if ($(this).outerHeight(false) < tallest) {
                        $(this).height(newh).addClass('oxEqualized');
                    }

                });
            }
        },

        /**
         * Gets tallest element value - height
         *
         * @return integer
         */
        getTallestHeight: function(el)
        {
            var tallest = 0;
            el.each(function(){
                var thisHeight = $(this).outerHeight(false);
                if (!$(this).hasClass('oxEqualized') && thisHeight > tallest) {
                    tallest = thisHeight;
                }
            });
            return tallest;
        },


        /**
         * Gets tallest element value - width
         *
         * @return integer
         */
        equalWidth: function(group, target)
        {
            var self    = this,
                neww    = 0,
                tallest = 0,
                spacings = 0;

            if ( target ) {

                tallest = self.getTallestWidth( group );

                if (tallest < target.outerWidth(false)){
                    tallest = target.outerWidth(false);
                }

            } else {
                tallest = self.getTallestWidth( group );
            }

            if( tallest ) {
                group.each(function(){
                    if($(this).hasClass('oxEqualized')) {
                        $(this).css('height','');
                        $(this).removeClass('oxEqualized');
                    }
                    spacings = $(this).outerWidth(false) - $(this).width();
                    neww = tallest - spacings;

                    if ($(this).outerWidth(false) < tallest) {
                        $(this).height(neww).addClass('oxEqualized');
                    }

                });
            }
        },

        /**
         * Gets tallest element value - width
         *
         * @return integer
         */
        getTallestWidth: function(el)
        {
            var tallest = 0;
            el.each(function(){
                var thisWidth = $(this).outerWidth(false);
                if (!$(this).hasClass('oxEqualized') && thisWidth > tallest) {
                    tallest = thisWidth;
                }
            });
            return tallest;
        }

    };

    /**
     * Equalizer widget
     */
    $.widget("ui.oxEqualizer", oxEqualizer );

})( jQuery );
