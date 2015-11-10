isCursorIn = require './is-cursor-in.coffee'
regEles    = require './register-clk-hide.coffee'

do ->
  return console.log "only run in browser." if (typeof window) is 'undefined'
  return console.log "require jQuery." if (typeof jQuery) is 'undefined'
  $ = jQuery

  # 全局事件绑定：click
  $(document).click (e) ->
    $.each regEles(), (originSelector, [hideSelector, options]) ->
      return if isCursorIn(originSelector) or isCursorIn(hideSelector)
      # 处理元素
      $(hideSelector)[options.handle]?()
