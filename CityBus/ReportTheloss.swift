//
//  ReportTheloss.swift
//  CityBus
//
//  Created by 小黄star on 2017/9/6.
//  Copyright © 2017年 小黄star. All rights reserved.
//

import UIKit

class ReportTheloss: UIViewController,UITextFieldDelegate {
    var IDcard = UITextField()
    var passWord = UITextField()
    
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


extension ReportTheloss:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var payCell: PayCell? = nil
        payCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? PayCell
        if payCell == nil {
            payCell = UITableViewCell (style: UITableViewCellStyle.default, reuseIdentifier: "cell") as? PayCell
        }
        payCell?.selectionStyle = .none
        payCell?.textLabel?.font = UIFont.systemFont(ofSize: 18)
        if indexPath.section == 0 {
            payCell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        }else
        {
            payCell?.cardImage.isHidden = true
            payCell?.cardName.isHidden = true
            payCell?.tailNumber.isHidden = true
            if indexPath.row == 0 {
                payCell?.textLabel?.text = "身份证号"
                IDcard = UITextField()
                IDcard.placeholder = "请输入身份证号码"
                payCell?.contentView.addSubview(IDcard)
                IDcard.mas_makeConstraints { (make) in
                    make?.left.equalTo()(100)
                    make?.right.equalTo()(payCell?.contentView)
                    make?.top.equalTo()(payCell?.contentView)
                    make?.height.equalTo()(50)
                }
                
            }else{
                payCell?.textLabel?.text = "密码"
                passWord = UITextField()
                passWord.placeholder = "请输入对应的市民卡密码"
                payCell?.contentView.addSubview(passWord)
                passWord.mas_makeConstraints { (make) in
                    make?.left.equalTo()(100)
                    make?.right.equalTo()(payCell?.contentView)
                    make?.top.equalTo()(payCell?.contentView)
                    make?.height.equalTo()(50)
                }
            }
        }
        return payCell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 70
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor.init(colorLiteralRed: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1.0)
        if section == 0 {
            let titleLabel = UILabel()
            titleLabel.frame = CGRect.init(x: 15, y: 10, width: SCREEN_WIDTH/1.5, height: 20)
            titleLabel.text = "选择需要挂失的市民卡"
            titleLabel.textColor = UIColor.lightGray
            header.addSubview(titleLabel)
        }else{
            let titleLabel = UILabel()
            titleLabel.frame = CGRect.init(x: 15, y: 10, width: SCREEN_WIDTH/2, height: 20)
            titleLabel.text = "输入信息"
            titleLabel.textColor = UIColor.lightGray
            header.addSubview(titleLabel)
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0.1
        }
        return 120
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 1 {
            let contentView = UIView()
            contentView.backgroundColor = UIColor.init(colorLiteralRed: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1.0)
            let button = UIButton()
            button.frame = CGRect.init(x: 15, y: 25, width: SCREEN_WIDTH * CGFloat(0.92), height: 50)
            button.setTitle("立即挂失", for: .normal)
            button.setTitleColor(UIColor.white, for: .normal)
            button.backgroundColor = UIColor.init(colorLiteralRed: 0/255.0, green: 116/255.0, blue: 238/255.0, alpha: 1.0)
            contentView.addSubview(button)
            let warningLabel = UILabel()
            warningLabel.frame = CGRect.init(x: 17, y: button.nb_bottom + 5, width: button.nb_width - 4, height: 50)
            warningLabel.text = "APP仅办理绑定过的市民卡, 未绑定的市民卡挂失请前往服务网点办理"
            warningLabel.numberOfLines = 0
            warningLabel.font = UIFont.systemFont(ofSize: 16)
            warningLabel.textColor = UIColor.lightGray
            contentView.addSubview(warningLabel)
            return contentView
        }
        return nil
    }
    
}
