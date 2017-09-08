//
//  PersonInformation.swift
//  CityBus
//
//  Created by 小黄star on 2017/9/6.
//  Copyright © 2017年 小黄star. All rights reserved.
//

import UIKit

class PersonInformation: UIViewController {
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


extension PersonInformation:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var payCell: PayCell? = nil
        payCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? PayCell
        if payCell == nil {
            payCell = UITableViewCell (style: UITableViewCellStyle.default, reuseIdentifier: "cell") as? PayCell
        }
        payCell?.selectionStyle = .none
        payCell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
       return payCell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 20
        }
        return 70
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 {
            let contentView = UIView()
            contentView.backgroundColor = UIColor.init(colorLiteralRed: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1.0)
            let titleLabel = UILabel()
            titleLabel.frame = CGRect.init(x: 15, y: 10, width: SCREEN_WIDTH/2, height: 20)
            titleLabel.text = "该账户下充值记录查询"
            titleLabel.textColor = UIColor.lightGray
            contentView.addSubview(titleLabel)
            return contentView
        }else{
            let contentView = UIView()
            contentView.backgroundColor = UIColor.init(colorLiteralRed: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1.0)
            let begin = UIButton()
            begin.backgroundColor = UIColor.white
            begin.setTitleColor(UIColor.black, for: .normal)
            begin.setTitle("开始时间", for: .normal)
            contentView.addSubview(begin)
            begin.mas_makeConstraints({ (make) in
                make?.left.equalTo()(20)
                make?.top.equalTo()(contentView)
                make?.bottom.equalTo()(contentView)
                make?.width.equalTo()(120)
            })
            return contentView
        }
       
    }
}
