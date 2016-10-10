# Framework测试项目
该项目用来测试自己新建的cocoa touch framework 项目：[WXFramework](https://github.com/xsailor511/WXFramework)

1.引用头文件
直接引用这个全局头文件，它包含了所有的头文件，不要引用具体的某个工具类头文件，会有警告：missing submodules

```
#import <WXFramework/WXFramework.h>

```

2.具体运行的时候，可能会报：Library not loaded: 'Image not found'，类似这种错误

* 解决方式1：在Build Phases 里新建一个Copy Files,选择Destination为Framework,然后把点击“+”，将自己新建的Framework放进去，就行了
* 解决方式2：在General ==> Embedded Binaries 里点击“+”，新增WXFramework.framework
* 解决方式3：在framework项目里设置Build Settings==>Mach-O Type 为Static Library（原先为Dynamic Library）,这种方式生成的framework也可以在xcode6以前的版本中使用了，如xcode5

3.判断Framework支持哪些架构的cpu

```
$ lipo -info ./WXFramework.framework/WXFramework 
Architectures in the fat file: ./WXFramework.framework/WXFramework are: i386 x86_64 armv7 arm64 

```

4.framework里的xib文件已经可以使用了，具体查看MyViewController.m  ==> buttonClicked方法

5.从storyboard里获取viewcontroller也可以

6.获取图片也可以使用了，在MyViewController.m里的viewDidLoad方法

7.xcode 8 里可以将图片和xib打包到.framework后缀的包里，也能正常使用（基于bundle id,具体看本项目中的例子），但是在xcode 8 之前，由于不知道可不可以，如果不可能，就需要借助bundle文件

* 访问.framework包里的图片和xib，查看[这里](http://www.jianshu.com/p/3bc8ea7b88ce)
* bundle 文件的新建在WXFramework项目里已经新建好了，xcode 7 类似，使用请看NSBundle+YourFrameworkBundle.h中被注释掉的代码，也是使用的NSBundle:

```
NSString *mainBundlePath = [[NSBundle mainBundle] resourcePath];
frameworkBundle = [NSBundle bundleWithPath:[mainBundlePath stringByAppendingPathComponent:@"WXFramework.bundle"]];
```
