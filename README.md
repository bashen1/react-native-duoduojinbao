# react-native-duoduojinbao

[![npm version](https://badge.fury.io/js/react-native-duoduojinbao.svg)](https://badge.fury.io/js/react-native-duoduojinbao)

## 开始

`$ npm install react-native-duoduojinbao --save`

### iOS

```sh
cd ios
pod install
```

### Android

在 `android/app/proguard-rules.pro` 文件中，主工程一定要keep住这个类，添加以下内容：

```js
-keep class com.xunmeng.pinduoduo.secure.EU {*;}
```

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
