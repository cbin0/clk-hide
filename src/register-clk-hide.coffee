# 默认配置
optionsDefault = {
  # 处理方式
  # [hide, remove]
  handle: "hide"
  # 是否在原元素的子元素中找可以关闭的元素
  # 当原元素为class，点击第二个原元素时要关闭的元素会不关闭。这个配置为yes可以避免这种情况
  # 这样就要保证每个要关闭的元素都是一个原元素的子元素
  findAsChild: yes
}
# 保存注册的元素
regEles = {}

# 注册函数，把一个原元素、可以关闭的元素和配置注册到一起
window.registerClkHide = (originSelector, hideSelector, options) ->
  regEles[originSelector] = [hideSelector, $.extend({}, optionsDefault, options)]

module.exports = () -> regEles
