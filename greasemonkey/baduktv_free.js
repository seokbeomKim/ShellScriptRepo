// ==UserScript==
// @name        BadukTV
// @namespace   chaoxifer
// @version     1
// @grant       none
// @include     http://www.tvbaduk.com/tv/*
// ==/UserScript==

start();

function start() {
  var video_entry = document.getElementsByClassName("replay_list");
  
  for (var i = 0; i < video_entry.length; i++) {
    var entry = video_entry[i].getElementsByTagName("a");
    
    // Change the mode in the link value
    var link = entry[0].href;
    var res = link.replace("mode=1", "mode=0");
    entry[0].href = res;
  }
}