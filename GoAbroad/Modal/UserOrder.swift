//
//  UserOrder.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/29.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import Foundation

struct UserOrder {
    var fid = 0
    var orderday = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .long)
    var name = userName
    var phone = userTel
    var email = userMail
    var city = orderUserCity
    var district = orderUserDist
    var address = orderDetailAddr
    var date = orderBoardDate
    var time = orderBoardTime
    var goorback = orderGoOrBack
    var airport = orderUserAirport
    var terminal = orderTerminalNum
    var adult = orderAdult
    var child = orderChild
    var totalperson = orderTotalPessenger
    var luggage = orderLuggage
    var totalprice = orderPrice
}


