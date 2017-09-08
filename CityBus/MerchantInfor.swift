//
//  MerchantInfor.swift
//  CityBus
//
//  Created by 小黄star on 2017/9/6.
//  Copyright © 2017年 小黄star. All rights reserved.
//

import UIKit

class MerchantInfor: UIViewController {
    lazy var tableView: UITableView = {
        let table = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style: .grouped)
        table.delegate = self
        table.dataSource = self
        table.register(PayCell.self, forCellReuseIdentifier: "cell")
        table.register(RecordCell.self, forCellReuseIdentifier: "record")
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setAutuoLayout()
    }
    
    func setAutuoLayout()
    {
        self.view.addSubview(tableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension MerchantInfor:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 20
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            var payCell: PayCell? = nil
            payCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? PayCell
            if payCell == nil {
                payCell = UITableViewCell (style: UITableViewCellStyle.default, reuseIdentifier: "cell") as? PayCell
            }
            payCell?.selectionStyle = .none
            payCell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            return payCell!
        }else
        {
            var recordCell: RecordCell? = nil
            recordCell = tableView.dequeueReusableCell(withIdentifier: "record") as? RecordCell
            if recordCell == nil {
                recordCell = UITableViewCell (style: UITableViewCellStyle.default, reuseIdentifier: "cell") as? RecordCell
            }
            recordCell?.selectionStyle = .none
            return recordCell!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 70
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 {
            let footerView = UIView()
            footerView.backgroundColor = UIColor.init(colorLiteralRed: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1.0)
            let titleLabel = UILabel()
            titleLabel.frame = CGRect.init(x: 15, y: 10, width: SCREEN_WIDTH/2, height: 20)
            titleLabel.text = "该账户下充值记录"
            titleLabel.textColor = UIColor.lightGray
            footerView.addSubview(titleLabel)
            return footerView
        }
        return nil
    }
    
}
