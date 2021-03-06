// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
// require foundation
// require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require handlebars
//= require turbolinks
//= require_tree .

$(function(){ $(document).foundation();});

window.loadHotPicks3 = function() {
 // AJAX call to get our list of things
 $.ajax({
   type: 'GET',

   url: 'http://stylelust.herokuapp.com/items.json',

   dataType: 'json'
 }).done(function(data) {
 	console.log(data);
   // grabs the template we're going to use
   var source = $("#hotnow-template").html();
   // compiles it with Handlebars (pops content from things into thing-template)
   var template = Handlebars.compile(source);
   // displays compiled template with things in a div called content
   $('#hotnow').html(template(data));
 });
};


window.loadHotPicks20 = function() {
 // AJAX call to get our list of things
 $.ajax({
   type: 'GET',
   url: 'http://stylelust.herokuapp.com/hotPicks.json',
   dataType: 'json'
 }).done(function(data) {
 	console.log(data)
   // grabs the template we're going to use
   var source = $("#hotpicks-template").html();
   // compiles it with Handlebars (pops content from things into thing-template)
   var template = Handlebars.compile(source);
   // displays compiled template with things in a div called content
   $('#hotpicks').html(template(data));
 });
};
