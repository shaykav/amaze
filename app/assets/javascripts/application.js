// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require turbolinks
//= require rails-ujs
//= require jquery
//= require_tree .



$(document).on('turbolinks:load', function() {

  // alert('hello')

  setTimeout(function(){
    document.querySelector('.close').click()
  }, 2250);

  // var wow = new WOW();
  
  // if (wow._live) {
  //   wow.init()
  // }else{
  //   wow = undefined
  // }
 
});


