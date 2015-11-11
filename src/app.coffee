isCursorIn = require './is-cursor-in.coffee'
regEles    = require './register-clk-hide.coffee'

do ->
  return console.error "clk-hide only run in browser." if (typeof window) is 'undefined'
  return console.error "clk-hide require jQuery." if (typeof jQuery) is 'undefined'
  $ = jQuery

  # 全局事件绑定：click
  $(document).click (e) ->
    $.each regEles(), (originSelector, [hideSelector, options]) ->
      if options.findAsChild
        $(originSelector).each (index) ->
          # 如果鼠标在这个元素中或者在要关闭的元素中时return
          return if isCursorIn(@) or isCursorIn(hideSelector)
          # 在这个元素的子元素中找要处理的元素
          $(hideSelector, @)[options.handle]?()
      else
        # 如果鼠标在原元素或者在要关闭的元素中时return
        return if isCursorIn(originSelector) or isCursorIn(hideSelector)
        # 在document中找要处理的元素
        $(hideSelector)[options.handle]?()
