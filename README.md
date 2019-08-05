# MarqueeLabel(此项目已经不维护，新的请看[GCMarqueeView](https://github.com/loveway/GCMarqueeView))

swift实现的一种跑马灯效果,如图：

![跑马灯](https://github.com/Loveway/MarqueeLabel/blob/master/MarqueeLab.gif)

简单的使用方法

```
let string = "弃我去者，昨日之日不可留；乱我心者，今日之日多烦忧。"

let  marquee = CHWMarqueeView(frame: CGRectMake(10, 64, self.view.bounds.size.width-20, 44), title: string)

self.view.addSubview(marquee)
```

欢迎关注[我的博客](http://blog.csdn.net/loveway_)，有问题，请多多指正！
