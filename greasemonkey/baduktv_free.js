// ==UserScript==
// @name        BadukTV
// @namespace   chaoxifer
// @version     1
// @grant       none
// @include     http://www.tvbaduk.com/tv/*
// @include     http://www.tvbaduk.com/*
// @include     http://www.tvbaduk.com/common/*
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
  
  
  // 이후 모든 링크에 대해 주소 변경
  var all_link = document.getElementsByTagName("a");
  
  for (var i = 0; i < all_link.length; i++) {
    var link = all_link[i];
    var orig = link.href;
    var res = orig.replace("mode=1", "mode=0");
    link.href = res;
  }
}