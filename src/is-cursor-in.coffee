###
这个函数会保存当前鼠标所在的元素，然后通过这个元素判断鼠标是否在指定的元素里
@param ele jQuery对象
###
module.exports = do ->
  currentEle = null
  $(document).mouseover (e)->
    currentEle = e.target
  (ele) ->
    currentEleJquery = $(currentEle)
    currentEleJquery.is(ele) or currentEleJquery.parents().is(ele)
