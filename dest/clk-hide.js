(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
var isCursorIn, regEles;

isCursorIn = require('./is-cursor-in.coffee');

regEles = require('./register-clk-hide.coffee');

(function() {
  var $;
  if ((typeof window) === 'undefined') {
    return console.error("clk-hide only run in browser.");
  }
  if ((typeof jQuery) === 'undefined') {
    return console.error("clk-hide require jQuery.");
  }
  $ = jQuery;
  return $(document).click(function(e) {
    return $.each(regEles(), function(originSelector, arg) {
      var base, hideSelector, name, options;
      hideSelector = arg[0], options = arg[1];
      if (options.findAsChild) {
        return $(originSelector).each(function(index) {
          var base, name;
          if (isCursorIn(this) || isCursorIn(hideSelector)) {
            return;
          }
          return typeof (base = $(hideSelector, this))[name = options.handle] === "function" ? base[name]() : void 0;
        });
      } else {
        if (isCursorIn(originSelector) || isCursorIn(hideSelector)) {
          return;
        }
        return typeof (base = $(hideSelector))[name = options.handle] === "function" ? base[name]() : void 0;
      }
    });
  });
})();


},{"./is-cursor-in.coffee":2,"./register-clk-hide.coffee":3}],2:[function(require,module,exports){

/*
这个函数会保存当前鼠标所在的元素，然后通过这个元素判断鼠标是否在指定的元素里
@param ele jQuery对象
 */
module.exports = (function() {
  var currentEle;
  currentEle = null;
  $(document).mouseover(function(e) {
    return currentEle = e.target;
  });
  return function(ele) {
    var currentEleJquery;
    currentEleJquery = $(currentEle);
    return currentEleJquery.is(ele) || currentEleJquery.parents().is(ele);
  };
})();


},{}],3:[function(require,module,exports){
var optionsDefault, regEles;

optionsDefault = {
  handle: "hide",
  findAsChild: true
};

regEles = {};

window.registerClkHide = function(originSelector, hideSelector, options) {
  return regEles[originSelector] = [hideSelector, $.extend({}, optionsDefault, options)];
};

module.exports = function() {
  return regEles;
};


},{}]},{},[1,2,3]);
