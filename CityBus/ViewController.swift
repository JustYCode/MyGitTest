//
//  ViewController.swift
//  CityBus
//
//  Created by 小黄star on 2017/9/5.
//  Copyright © 2017年 小黄star. All rights reserved.
//

import UIKit
import Masonry
let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height
class ViewController: UIViewController,UITextFieldDelegate {
    var contentView = UIView()
    var lineView = UIView()
    var identitycard = UITextField()
    var citizen = UITextField()
    var confirmBtn = UIButton()
   var arr = NSArray()
//    https://gitee.com/hxd123/ZJSMK_IOS
//    冥冥中
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(colorLiteralRed: 239/255, green: 239/255, blue: 239/255, alpha: 1.0)
         setSnapKitLayout()
      
        
    }
    func  setSnapKitLayout()
    {
        contentView = UIView()
        contentView.backgroundColor = UIColor.white
        self.view.addSubview(contentView)
        contentView.mas_makeConstraints { (make:MASConstraintMaker!)in
            make.left.right().equalTo()(self.view)
            make.height.mas_equalTo()(120)
            make.top.equalTo()(self.view)
        }
        lineView = UIView()
        lineView.backgroundColor = UIColor.init(colorLiteralRed: 239/255, green: 239/255, blue: 239/255, alpha: 1.0)
        contentView.addSubview(lineView)
        lineView.mas_makeConstraints { (make:MASConstraintMaker!) in
            make.left.right().equalTo()(self.contentView)
            make.height.equalTo()(1)
            make.center.equalTo()(self.contentView)
        }
        identitycard = UITextField()
        identitycard.delegate = self
        identitycard.placeholder = "请输入身份证号码"
        identitycard.textColor = UIColor.lightGray
        identitycard.font = UIFont.systemFont(ofSize: 16)
        identitycard.backgroundColor = UIColor.white
        contentView.addSubview(identitycard)
        identitycard.mas_makeConstraints { (make:MASConstraintMaker!) in
            make.left.equalTo()(self.contentView)?.setOffset(105)
            make.right.equalTo()(self.contentView)
            make.top.equalTo()(self.contentView)?.setOffset(7)
            make.height.equalTo()(50)
        }
        citizen = UITextField()
        citizen.delegate = self
        citizen.placeholder = "请输入市民号码"
        citizen.textColor = UIColor.lightGray
        citizen.font = UIFont.systemFont(ofSize: 16)
        citizen.backgroundColor = UIColor.white
        contentView.addSubview(citizen)
        citizen.mas_makeConstraints { (make:MASConstraintMaker!) in
            make.left.equalTo()(self.contentView)?.setOffset(105)
            make.right.equalTo()(self.contentView)
            make.top.equalTo()(self.lineView)?.setOffset(7)
            make.height.equalTo()(50)
        }
        for i in 0 ..< 2 {
            let nameLabel = UILabel()
            nameLabel.frame = CGRect.init(x: 15, y: 15 + i * 60, width: 80, height: 30)
            nameLabel.tag = 100 + i
            nameLabel.font = UIFont.systemFont(ofSize: 18)
            if nameLabel.tag == 100 {
                nameLabel.text = "身份证号"
            }else
            {
                nameLabel.text = "市民卡号"
            }
            contentView.addSubview(nameLabel)
        }
        confirmBtn = UIButton()
        confirmBtn.setTitle("确定", for: .normal)
        confirmBtn.setTitleColor(UIColor.lightGray, for: .normal)
        confirmBtn.addTarget(self, action:#selector(tapped(_:)), for:.touchUpInside)
        self.view.addSubview(confirmBtn)
        confirmBtn.backgroundColor = UIColor.init(colorLiteralRed: 213/255.0, green: 213/255.0, blue: 213/255.0, alpha: 1.0)
        confirmBtn.mas_makeConstraints { (make:MASConstraintMaker!) in
            make.left.equalTo()(self.view)?.setOffset(15)
            make.right.equalTo()(self.view)?.setOffset(-15)
            make.top.equalTo()(self.contentView.mas_bottom)?.setOffset(25)
            make.height.equalTo()(60)
        }
        
        
        
        
        
     
        arr = ["挂失","交易查询","解挂","年审","年审缴费"]
        for i in 0 ..< 5 {
            let button = UIButton()
            button.frame = CGRect.init(x: 40, y: 280 + i * (30 + 20), width: 60, height: 30)
            button.tag = 200 + i
            button.addTarget(self, action:#selector(clicked(_:)), for:.touchUpInside)
            button.setTitle(arr[i] as? String, for: .normal)
            button.backgroundColor = UIColor.lightGray
            self.view.addSubview(button)
        }
        
        
    }
    func clicked(_ button:UIButton){
        if button.tag == 200 {
            let vc = ReportTheloss()
            self.present(vc, animated: true, completion: nil)
        }
        if button.tag == 201 {
            let vc = TransactionQuery()
            self.present(vc, animated: true, completion: nil)
        }
        if button.tag == 202 {
            let vc = RemoveLoss()
            self.present(vc, animated: true, completion: nil)
        }
        if button.tag == 203 {
            let vc = AnnualVerification()
            self.present(vc, animated: true, completion: nil)
        }
        if button.tag == 204 {
            let vc = ModifiedData()
            self.present(vc, animated: true, completion: nil)
        }
    }

    func tapped(_ button:UIButton){
        let vc = Pay()
        self.present(vc, animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}










