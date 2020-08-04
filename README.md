# GoAbroad（尚未完成，持續進行中）
這是一個職訓結業專題，  
目標功能為預約機場接送服務的叫車APP，目的在於熟悉Xcode及Swift，  
製作時的思路著重於APP功能開發，以及APP操作流程規劃，  
UI畫面較為簡單。  

# 功能介紹
* 預約專車接送（主功能）
* 意見回饋
* 撥打電話給客服
* 訂單查詢
* 個人資料維護
* 常見問題查看

# 開發環境
* Xcode 11.6
* iPhone 11
* Swift 5

# 使用技術
## 儲存
* Firebase : 模擬後台功能，可收集用戶訂單資料。
* UserDefaults : 儲存用戶姓名、電話資料，毋須重複填寫。
* SQLite FMDB : 使用SQLite + FMDB套件，將訂單儲存在本地端

## 客製化UI元件紀錄
* alert controller actionsheet模式，結合date picker
* 點擊後可展開的table view
* custom table view cell
* auto layout設定
