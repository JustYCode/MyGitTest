//
//  Pay.swift
//  CityBus
//
//  Created by 小黄star on 2017/9/6.
//  Copyright © 2017年 小黄star. All rights reserved.
//

import UIKit

class Pay: UIViewController,UITextFieldDelegate {
    var tableView = UITableView()
    var payButton = UIButton()
    var money = UITextField()
    
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
extension Pay: UITableViewDelegate, UITableViewDataSource {
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
                money.delegate = self
                money.frame = CGRect.init(x: 80, y: 0, width: 200, height: 50)
                money.placeholder = "请输入充值金额"
                money.textColor = UIColor.lightGray
                money.font = UIFont.systemFont(ofSize: 16)
                money.backgroundColor = UIColor.white
                payCell?.contentView.addSubview(money)
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
        payButton.setTitle("付款", for: .normal)
        payButton.setTitleColor(UIColor.lightGray, for: .normal)
        payButton.backgroundColor = UIColor.init(colorLiteralRed: 213/255, green: 213/255, blue: 213/255, alpha: 1.0)
        payButton.addTarget(self, action:#selector(tapped(_:)), for:.touchUpInside)
        footerView.addSubview(payButton)
     return footerView
    }

    func tapped(_ button:UIButton){

    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
        return true
    }
}
