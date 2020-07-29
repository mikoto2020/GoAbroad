//
//  UserOrder.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/29.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import Foundation

struct userOrder {
    var fid = 0
    var odrName = ""  //姓名
    var odrTel = ""  //電話
    var odrMail = ""  //信箱
    var odrCity = ""  //縣市
    var odrDist = ""  //鄉鎮市區
    var odrDetailAddr = ""  //詳細地址
    var odrBoardDate = "" //乘車日期
    var odrBoardTime = "" //乘車時間
    var odrGoOrBack = ""  //接機或送機
    var odrAirport = ""  //機場
    var odrTerminal = "" //航廈
    var odrAdult = 0
    var odrChild = 0
    var totalPerson = 0  //總人數
    var odrLuggage = 0 //行李數
    var totalPrice = 0  //總金額
}


