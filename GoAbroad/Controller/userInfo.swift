//
//  userInfo.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/25.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import Foundation

// BookOne輸入資料
var orderUserCity = ""
var orderUserDist = ""
var orderDetailAddr = ""
var orderUserAirport = ""
var orderGoOrBack = ""   //儲存segment選項傳送至firebase

// BookTwo輸入資料
var orderBoardTime = ""
var orderBoardDate = ""
var orderTerminalNum = ""

//BookThree輸入資料
var orderAdult = "0"
var orderChild = "0"
var orderTotalPessenger = "0"
var orderLuggage = "0"
var orderPrice = "0"

// UserInfo
var userName = "王大明"
var userTel = "0908113111"
var userMail = "xxxxxxx@gmail.com"


//成立訂單
struct UserOrderList {
//    var userName = ""
//    var userTel = ""
//    var userEmail = ""
    var orderBoardTime = ""
    var orderBoardDate = ""
    var orderTerminalNum = ""
}

var userOrederComing = UserOrderList(orderBoardTime: orderBoardTime, orderBoardDate: orderBoardDate, orderTerminalNum: orderTerminalNum)
//let userOrderLatest = UserOrderList(userName: userName, userTel: userTel, userEmail: userMail)
var userOderHistory = [UserOrderList]()

