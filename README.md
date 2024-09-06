# react-native-duoduojinbao

[![npm version](https://badge.fury.io/js/react-native-duoduojinbao.svg)](https://badge.fury.io/js/react-native-duoduojinbao)

## 开始

`$ npm install react-native-duoduojinbao --save`

### iOS

```sh
cd ios
pod install
```

> 由于本模块不含安全图片`（已删除DuoduoJinbaoSDK.framework/Resources/DuoduoJinbaoSDK.bundle）`，需要下载官方 SDK 后，将 `DuoduoJinbaoSDK.framework/Resources/DuoduoJinbaoSDK.bundle` 资源文件包添加到工程中，  bundle 内部有一张安全图片，如果你的项目有压缩资源图片的操作，注意不要对这张图片进行压缩。（Xcode添加framework并不会自动添加framework下的bundle，需要手动添加）

### Android

> 由于本模块不含安全图片，需要下载官方 SDK 后将 duoduojinbao.jpg `放入assets` 目录下

## 使用

```javascript
import DuoduoJinbao from 'react-native-duoduojinbao';

// 初始化 SDK
let ret = await DuoduoJinbao.init();

// APP 每次启动都需要调用这个接口，否则可能被限频率
// 初次安装可能要过一会才会生成，
// 获取 Pati 字段，risk_token
let ret = await DuoduoJinbao.getPati();

// 唤起拼多多，并跳转到落地页
let ret = await DuoduoJinbao.openPDDWithURL({
    url: '', // 商品落地页
    backURL: '', // 回跳 URL Scheme，可选字段
});
```
