//
//  AnnualVerification.swift
//  CityBus
//
//  Created by 小黄star on 2017/9/6.
//  Copyright © 2017年 小黄star. All rights reserved.
//

import UIKit

class AnnualVerification: UIViewController {
    var tableView = UITableView()
    var payButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAutoLayout()
    }
    func setAutoLayout()
    {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.init(colorLiteralRed: 239/255, green: 239/255, blue: 239/255, alpha: 1.0)
        tableView.register(PayCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        tableView.mas_makeConstraints { (make) in
            make?.right.left().top().bottom().equalTo()(self.view)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension AnnualVerification: UITableViewDelegate, UITableViewDataSource {
    // MARK: 各section值
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    // MARK: 各section的row值
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    // MARK: cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var payCell: PayCell? = nil
        payCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? PayCell
        if payCell == nil {
            payCell = UITableViewCell (style: UITableViewCellStyle.default, reuseIdentifier: "cell") as? PayCell
        }
        if indexPath.section == 1 {
            payCell?.cardImage.isHidden = true
            payCell?.cardName.isHidden = true
            payCell?.tailNumber.isHidden = true
            let money = UILabel()
            money.text = "100.00¥"
            money.textAlignment = .right
            money.textColor = UIColor.init(colorLiteralRed: 236/255.0, green: 100/255.0, blue: 100/255.0, alpha: 1.0)
            payCell?.addSubview(money)
            money.mas_makeConstraints({ (make) in
                make?.right.equalTo()(payCell?.contentView)?.setOffset(-15)
                make?.top.equalTo()(payCell?.contentView)
                make?.bottom.equalTo()(payCell?.contentView)
                make?.width.equalTo()(120)
            })
            payCell?.textLabel?.text = "金额"
            payCell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
            payCell?.selectionStyle = .none
            return payCell!
        }else
        {
            payCell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        }
        
        return payCell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PayRecord()
        self.present(vc, animated: true, completion: nil)
    }
    
    // MARK: cell的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 70
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 10
        }
        return 90
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.init(colorLiteralRed: 239/255, green: 239/255, blue: 239/255, alpha: 1.0)
        payButton.frame = CGRect.init(x: 10, y: 30, width: UIScreen.main.bounds.size.width - 20, height: 60)
        payButton.setTitle("续费", for: .normal)
        payButton.setTitleColor(UIColor.white, for: .normal)
        payButton.backgroundColor = UIColor.init(colorLiteralRed: 20/255, green: 116/255, blue: 238/255, alpha: 1.0)
        payButton.addTarget(self, action:#selector(tapped(_:)), for:.touchUpInside)
        footerView.addSubview(payButton)
        return footerView
    }
    
    func tapped(_ button:UIButton){
        
    }
}
