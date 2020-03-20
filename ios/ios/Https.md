# iOS Https 降到 http

iOS 9 以后 apple 要求使用 https，如果存在服务器仍旧使用 http，会无法连接，那么可用下面方案进行降级，以下两个方法等效

### 1.

在 `Info.plist` 中添加 `NSAppTransportSeaurity` 类型 `Dictionary`。

在 `NSAppTransportSecurity` 下添加 `NSAllowsArbitraryLoads` 类型`Boolean`,值设为 `YES`

### 2

直接往 `Info.plist` 文件中添加

```
<key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
    </dict>
```