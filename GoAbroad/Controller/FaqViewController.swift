//
//  FaqViewController.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/28.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import UIKit



class FaqViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var faqTable: UITableView!
    
    struct faqData {
        var isOpen: Bool
        var sectionTitle: String
        var sectionData: [String]
    }

    var tableViewData = [faqData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        faqTable.delegate = self
        faqTable.dataSource = self
    }
    
    func initData() {
        tableViewData = [
            faqData(isOpen: false, sectionTitle: "＊如何預約機場接送？", sectionData:[ "請點選「預約接送」，填寫相關資料後送出即完成預定。"]),
            faqData(isOpen: false, sectionTitle: "＊需要提前多久預約 ?", sectionData:[ "因機場接送採預約制，需要提前為您安排合適車輛與駕駛。最短搭車日72小時前 皆可預約。"]),
            faqData(isOpen: false, sectionTitle: "＊如何付款", sectionData:[ "目前僅提供現場付款方式，後續將會開放信用卡付款。"]),
            faqData(isOpen: false, sectionTitle: "＊可以接送的地區？", sectionData:[ "目前僅提供北北基地區叫車。"]),
            faqData(isOpen: false, sectionTitle: "＊有兒童安全座椅嗎？", sectionData:[ "有的。"])]
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].isOpen == true {
            return tableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "title", for: indexPath)
            cell.textLabel?.text = tableViewData[indexPath.section].sectionTitle
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping // label內文字自動換行
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row - 1]
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableViewData[indexPath.section].isOpen == true {
            tableViewData[indexPath.section].isOpen = false
            let indexes = IndexSet(integer: indexPath.section)
            tableView.reloadSections(indexes, with: .automatic)
        } else {
            tableViewData[indexPath.section].isOpen = true
            let indexes = IndexSet(integer: indexPath.section)
            tableView.reloadSections(indexes, with: .automatic)
        }
    }
}
