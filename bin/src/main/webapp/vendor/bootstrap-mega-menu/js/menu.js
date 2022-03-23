"use strict";


// toggle menu for mobile
function mobileDropdown () {
  if($('#mega-menu-wrapper').length) {
    $('#mega-menu-wrapper .nav li.dropdown-holder').append(function () {
      return '<i class="icon flaticon-down-arrow"></i>';
    });
    $('#mega-menu-wrapper .nav li.dropdown-holder .icon').on('click', function () {
      $(this).parent('li').children('ul').slideToggle();
    });
  }
}

// DOM ready function
jQuery(document).on('ready', function() {
  mobileDropdown ();
});