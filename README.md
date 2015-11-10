# clk-hide
点击页面的其他位置关闭指定的元素

## 依赖
jquery

# 构建
```
grunt
```

# 使用
```html
<script src="path/to/clk-hide.js"></script>
<script>
  /*
  * 参数1是jquery选择器，一个一直显示的元素，当点击时会显示或隐藏参数2的元素
  * 参数2是jquery选择器，当点击页面时要隐藏或者删除的元素
  * 参数3是配置
  */
  window.registerClkHide("#test-input", "#test-hide", {
    handle: "hide",
    /*
    * 是否在原元素的子元素中找可以关闭的元素
    * 当原元素为class，点击第二个原元素时要关闭的元素会不关闭。这个配置为yes可以避免这种情况
    * 这样就要保证每个要关闭的元素都是一个原元素的子元素
    */
    findAsChild: yes
  });
</script>
```
