# 默认配置
optionsDefault = {
  # 处理方式
  # [hide, remove]
  handle: "hide"
}
# 保存注册的元素
regEles = {}

# 注册函数，把一个原元素、可以关闭的元素和配置注册到一起
window.registerClkHide = (originSelector, hideSelector, options) ->
  regEles[originSelector] = [hideSelector, $.extend(optionsDefault, options)]

module.exports = () -> regEles
