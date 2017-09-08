//
//  RemoveLoss.swift
//  CityBus
//
//  Created by 小黄star on 2017/9/6.
//  Copyright © 2017年 小黄star. All rights reserved.
//

import UIKit

class RemoveLoss: UIViewController {
    
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


extension RemoveLoss:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor.init(colorLiteralRed: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1.0)
            let titleLabel = UILabel()
            titleLabel.frame = CGRect.init(x: 15, y: 10, width: SCREEN_WIDTH/1.5, height: 20)
            titleLabel.text = "选择需要解除挂失的市民卡"
            titleLabel.textColor = UIColor.lightGray
            header.addSubview(titleLabel)
     
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0.1
        }
        return 120
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            let contentView = UIView()
            contentView.backgroundColor = UIColor.init(colorLiteralRed: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1.0)
            let button = UIButton()
            button.frame = CGRect.init(x: 15, y: 25, width: SCREEN_WIDTH * CGFloat(0.92), height: 50)
            button.setTitle("立即解除挂失", for: .normal)
            button.setTitleColor(UIColor.white, for: .normal)
            button.backgroundColor = UIColor.init(colorLiteralRed: 0/255.0, green: 116/255.0, blue: 238/255.0, alpha: 1.0)
            contentView.addSubview(button)
            return contentView
    }
    
}

