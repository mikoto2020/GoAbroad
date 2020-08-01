//
//  UserOrderDAO.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/29.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import Foundation

class UserOrderDAO {
    private static var _inst = UserOrderDAO()
    public static var shared: UserOrderDAO {
        return _inst
    }
    var dbPath = ""
    private init() {
        dbPath = "\(NSHomeDirectory())/Documents/database.db"
        let fileMgr = FileManager.default
        if !fileMgr.fileExists(atPath: dbPath),let src = Bundle.main.path(forResource: "GoAbroadDataBase", ofType: "db") {
            try? fileMgr.copyItem(atPath: src, toPath: dbPath)
        }
        print(dbPath)
    }
    
    func generalUpdateFunction(sql: String, params: [String: Any]) {
        let db = FMDatabase(path: dbPath)
        db?.open()
        db?.executeUpdate(sql, withParameterDictionary: params)
        db?.close()
    }

    func insert(data: UserOrder) {
        var dict = [String:Any]()
        dict["orderday"] = data.orderday
        dict["name"] = data.name
        dict["phone"] = data.phone
        dict["email"] = data.email
        dict["city"] = data.city
        dict["dist"] = data.district
        dict["address"] = data.address
        dict["date"] = data.date
        dict["time"] = data.time
        dict["goorback"] = data.goorback
        dict["airport"] = data.airport
        dict["terminal"] = data.terminal
        dict["adult"] = data.adult
        dict["child"] = data.child
        dict["person"] = data.totalperson
        dict["luggage"] = data.luggage
        dict["price"] = data.totalprice
        let sql = "INSERT INTO UserOrder (orderday, name, phone, email, city, district, address, date, time, goorback, airport, terminal, adult, child, totalperson, luggage, totalprice) VALUES(:orderday, :name, :phone, :email, :city, :dist, :address, :date, :time, :goorback, :airport, :terminal, :adult, :child, :person, :luggage, :price)"
        generalUpdateFunction(sql: sql, params: dict)
    }
    
    func update(data: UserOrder) {
        var dict = [String:Any]()
        dict["fid"] = data.fid
        dict["orderday"] = data.orderday
        dict["name"] = data.name
        dict["phone"] = data.phone
        dict["email"] = data.email
        dict["city"] = data.city
        dict["dist"] = data.district
        dict["address"] = data.address
        dict["date"] = data.date
        dict["time"] = data.time
        dict["goorback"] = data.goorback
        dict["airport"] = data.airport
        dict["terminal"] = data.terminal
        dict["adult"] = data.adult
        dict["child"] = data.child
        dict["person"] = data.totalperson
        dict["luggage"] = data.luggage
        dict["price"] = data.totalprice
        let sql = "UPDATE UserOrder SET orderday=:orderday, name=:name, phone=:phone, email=:email, city=:city, district=:dist, address=:address, date=:date, time=:time, goorback=:goorback, airport=:airport, terminal=:terminal, adult=:adult, child=:child, totalperson=:person, luggage=:luggage, totalprice=:price WHERE fid=:fid"
        generalUpdateFunction(sql: sql, params: dict)
    }
    
    func delete(fid: Int){
        var dict = [String:Any]()
        dict["fid"] = fid
        let sql = "DELETE FROM UserOrder WHERE fid = :fid"
        generalUpdateFunction(sql: sql, params: dict)
    }
    
    func getUserOrderByName(text: String) -> [UserOrder] {
        var list = [UserOrder]()
        let db = FMDatabase(path: dbPath)
        db?.open()
        if let result = db?.executeQuery("SELECT * FROM UserOrder WHERE name like ? ", withArgumentsIn: ["%\(text)%"]) {
            while result.next() {
                let fid = result.int(forColumn: "fid")
                if let orderday = result.string(forColumn: "orderday"),
                let name = result.string(forColumn: "name"),
                let phone = result.string(forColumn: "phone"),
                let email = result.string(forColumn: "email"),
                let city = result.string(forColumn: "city"),
                let dist = result.string(forColumn: "district"),
                let addr = result.string(forColumn: "address"),
                let date = result.string(forColumn: "date"),
                let time = result.string(forColumn: "time"),
                let goorback = result.string(forColumn: "goorback"),
                let airport = result.string(forColumn: "airport"),
                let terminal = result.string(forColumn: "terminal"),
                let adult = result.string(forColumn: "adult"),
                let child = result.string(forColumn: "child"),
                let person = result.string(forColumn: "totalperson"),
                let luggage = result.string(forColumn: "luggage"),
                let price = result.string(forColumn: "totalprice") {
                    let data = UserOrder(fid: Int(fid), orderday: orderday, name: name, phone: phone, email: email, city: city, district: dist, address: addr, date: date, time: time, goorback: goorback, airport: airport, terminal: terminal, adult: adult, child: child, totalperson: person, luggage: luggage, totalprice: price)
                    list.append(data) }
            }
            result.close()
        }
        db?.close()
        return list
    }
    
    func getUserOrderByIDArray(fid: Int) -> [UserOrder] {
        var list = [UserOrder]()
        let db = FMDatabase(path: dbPath)
        db?.open()
        if let result = db?.executeQuery("SELECT * FROM UserOrder WHERE name like ? ", withArgumentsIn: [fid]) {
            while result.next() {
                let fid = result.int(forColumn: "fid")
                if let orderday = result.string(forColumn: "orderday"),
                let name = result.string(forColumn: "name"),
                let phone = result.string(forColumn: "phone"),
                let email = result.string(forColumn: "email"),
                let city = result.string(forColumn: "city"),
                let dist = result.string(forColumn: "district"),
                let addr = result.string(forColumn: "address"),
                let date = result.string(forColumn: "date"),
                let time = result.string(forColumn: "time"),
                let goorback = result.string(forColumn: "goorback"),
                let airport = result.string(forColumn: "airport"),
                let terminal = result.string(forColumn: "terminal"),
                let adult = result.string(forColumn: "adult"),
                let child = result.string(forColumn: "child"),
                let person = result.string(forColumn: "totalperson"),
                let luggage = result.string(forColumn: "luggage"),
                let price = result.string(forColumn: "totalprice") {
                    let data = UserOrder(fid: Int(fid), orderday: orderday, name: name, phone: phone, email: email, city: city, district: dist, address: addr, date: date, time: time, goorback: goorback, airport: airport, terminal: terminal, adult: adult, child: child, totalperson: person, luggage: luggage, totalprice: price)
                    list.append(data) }
            }
            result.close()
        }
        db?.close()
        return list
    }
    
    
    func getUserOrderByID(fid: Int) -> UserOrder? {
        var ret: UserOrder?
        let db = FMDatabase(path: dbPath)
        db?.open()
        if let result = db?.executeQuery("SELECT * FROM UserOrder WHERE fid = ?", withArgumentsIn: [fid]) {
            if result.next() {
                let fid = result.int(forColumn: "fid")
                if let orderday = result.string(forColumn: "orderday"),
                let name = result.string(forColumn: "name"),
                let phone = result.string(forColumn: "phone"),
                let email = result.string(forColumn: "email"),
                let city = result.string(forColumn: "city"),
                let dist = result.string(forColumn: "district"),
                let addr = result.string(forColumn: "address"),
                let date = result.string(forColumn: "date"),
                let time = result.string(forColumn: "time"),
                let goorback = result.string(forColumn: "goorback"),
                let airport = result.string(forColumn: "airport"),
                let terminal = result.string(forColumn: "terminal"),
                let adult = result.string(forColumn: "adult"),
                let child = result.string(forColumn: "child"),
                let person = result.string(forColumn: "totalperson"),
                let luggage = result.string(forColumn: "luggage"),
                let price = result.string(forColumn: "totalprice") {
                    ret = UserOrder(fid: Int(fid), orderday: orderday, name: name, phone: phone, email: email, city: city, district: dist, address: addr, date: date, time: time, goorback: goorback, airport: airport, terminal: terminal, adult: adult, child: child, totalperson: person, luggage: luggage, totalprice: price)
                }
            }
            result.close()
        }
        db?.close()
        return ret
    }

    func getAllUserOrder() -> [UserOrder] {
        var list = [UserOrder]()
        let db = FMDatabase(path: dbPath)
        db?.open()
        if let result = db?.executeQuery("SELECT * FROM UserOrder", withArgumentsIn: []) {
            while result.next() {
                let fid = result.int(forColumn: "fid")
                if let orderday = result.string(forColumn: "orderday"),
                    let name = result.string(forColumn: "name"),
                    let phone = result.string(forColumn: "phone"),
                    let email = result.string(forColumn: "email"),
                    let city = result.string(forColumn: "city"),
                    let dist = result.string(forColumn: "district"),
                    let addr = result.string(forColumn: "address"),
                    let date = result.string(forColumn: "date"),
                    let time = result.string(forColumn: "time"),
                    let goorback = result.string(forColumn: "goorback"),
                    let airport = result.string(forColumn: "airport"),
                    let terminal = result.string(forColumn: "terminal"),
                    let adult = result.string(forColumn: "adult"),
                    let child = result.string(forColumn: "child"),
                    let person = result.string(forColumn: "totalperson"),
                    let luggage = result.string(forColumn: "luggage"),
                    let price = result.string(forColumn: "totalprice") {
                        let data = UserOrder(fid: Int(fid), orderday: orderday, name: name, phone: phone, email: email, city: city, district: dist, address: addr, date: date, time: time, goorback: goorback, airport: airport, terminal: terminal, adult: adult, child: child, totalperson: person, luggage: luggage, totalprice: price)
                    list.append(data)}
            }
            result.close()
        }
        db?.close()
        return list
    }
}

