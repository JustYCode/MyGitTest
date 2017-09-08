//
//  TransactionQuery.swift
//  CityBus
//
//  Created by 小黄star on 2017/9/6.
//  Copyright © 2017年 小黄star. All rights reserved.
//

import UIKit

class TransactionQuery: UIViewController {
    var person = UIButton()
    var Merchant = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(colorLiteralRed: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1.0)
        setAutoLayout()
    }
    
    func setAutoLayout()
    {
        person = UIButton()
        person.setTitle("个人查询", for: .normal)
        person.backgroundColor = UIColor.init(colorLiteralRed: 44/255.0, green: 135/255.0, blue: 239/255.0, alpha: 1.0)
        person.addTarget(self, action:#selector(persontapped(_:)), for:.touchUpInside)
        self.view.addSubview(person)
        person.mas_makeConstraints { (make) in
            make?.left.equalTo()(self.view)?.setOffset(15)
            make?.right.equalTo()(self.view)?.setOffset(-15)
            make?.top.equalTo()(self.view)?.setOffset(30)
            make?.height.equalTo()(50)
        }
        
        Merchant = UIButton()
        Merchant.setTitle("商家查询", for: .normal)
        Merchant.backgroundColor = UIColor.init(colorLiteralRed: 242/255.0, green: 156/255.0, blue: 54/255.0, alpha: 1.0)
        Merchant.addTarget(self, action:#selector(Merchanttapped(_:)), for:.touchUpInside)
        self.view.addSubview(Merchant)
        Merchant.mas_makeConstraints { (make) in
            make?.left.equalTo()(self.view)?.setOffset(15)
            make?.right.equalTo()(self.view)?.setOffset(-15)
            make?.top.equalTo()(self.person.mas_bottom)?.setOffset(15)
            make?.height.equalTo()(50)
        }
    }
    func persontapped(_ button:UIButton){
        let person = PersonInformation()
        self.present(person, animated: true, completion: nil)
    }
    
    func Merchanttapped(_ button:UIButton){
        let person = MerchantInfor()
        self.present(person, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
