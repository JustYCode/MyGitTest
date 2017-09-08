//
//  SVC.swift
//  CityBus
//
//  Created by 小黄star on 2017/9/6.
//  Copyright © 2017年 小黄star. All rights reserved.
//

import UIKit
import Masonry
class SVC: UIViewController {
    var contentView = UIView()
    var warning = UIImageView()
    var goBack = UIButton()
    var service = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(colorLiteralRed: 239/255, green: 239/255, blue: 239/255, alpha: 1.0)
         seAutoLayout()
    }
    
    func seAutoLayout()
    {
        contentView = UIView()
        contentView.backgroundColor = UIColor.white
        self.view.addSubview(contentView)
        contentView.mas_makeConstraints { (make:MASConstraintMaker!) in
            make.left.right().top().equalTo()(self.view)
            make.height.equalTo()(320)
        }
        warning = UIImageView()
        warning.image = UIImage.init(named: "warning")
        warning.contentMode = .scaleAspectFit
        warning.clipsToBounds = true
        contentView.addSubview(warning)
        warning.mas_makeConstraints { (make:MASConstraintMaker!) in
            make.center.equalTo()(self.contentView)
            make.height.with().equalTo()(120)
        }
      
        for i in 0 ..< 2{
              let warnLabel = UILabel()
            warnLabel.frame = CGRect.init(x: 0, y: 230 + CGFloat(i * (20 + 10)), width: SCREEN_WIDTH, height: 20)
            warnLabel.textAlignment = .center
            warnLabel.font = UIFont.systemFont(ofSize: 19)
            warnLabel.tag = 100 + i
            if warnLabel.tag == 100 {
                warnLabel.text = "对不起,APP暂时不支持补卡功能!"
            }else
            {
                warnLabel.text = "请至附近服务网点进行处理"
            }
            contentView.addSubview(warnLabel)
        }
        goBack = UIButton()
        goBack.setTitle("返回", for: .normal)
        goBack.setTitleColor(UIColor.init(colorLiteralRed: 44/255.0, green: 135/255.0, blue: 239/255.0, alpha: 1.0), for: .normal)
        goBack.layer.borderWidth = 2
        goBack.layer.borderColor = UIColor.init(colorLiteralRed: 44/255.0, green: 135/255.0, blue: 239/255.0, alpha: 1.0).cgColor
        goBack.addTarget(self, action:#selector(tapped(_:)), for:.touchUpInside)
        self.view.addSubview(goBack)
        goBack.mas_makeConstraints { (make:MASConstraintMaker!) in
            make.left.equalTo()(self.view)?.setOffset(15)
            make.width.equalTo()((SCREEN_WIDTH - 45)/2)
            make.height.equalTo()(60)
            make.top.equalTo()(self.contentView.mas_bottom)?.setOffset(20)
        }
        service = UIButton()
        service.setTitleColor(UIColor.white, for: .normal)
        service.setTitle("服务网点", for: .normal)
        service.backgroundColor = UIColor.init(colorLiteralRed: 44/255.0, green: 135/255.0, blue: 239/255.0, alpha: 1.0)
        self.view.addSubview(service)
        service.mas_makeConstraints { (make:MASConstraintMaker!) in
            make.left.equalTo()(self.goBack.mas_right)?.setOffset(15)
            make.width.equalTo()(self.goBack)
            make.height.equalTo()(60)
            make.top.equalTo()(self.contentView.mas_bottom)?.setOffset(20)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
