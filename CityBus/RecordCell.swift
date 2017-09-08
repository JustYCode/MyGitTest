//
//  RecordCell.swift
//  CityBus
//
//  Created by 小黄star on 2017/9/6.
//  Copyright © 2017年 小黄star. All rights reserved.
//

import UIKit

class RecordCell: UITableViewCell {
    var titleLabel = UILabel()
    var balance = UILabel()
    var timeLabel = UILabel()
    var money = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setAutoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setAutoLayout(){
        titleLabel = UILabel()
        titleLabel.text = "在线支付"
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        self.addSubview(titleLabel)
        titleLabel.mas_makeConstraints { (make) in
        make?.left.equalTo()(self)?.setOffset(15)
        make?.top.equalTo()(self)?.setOffset(10)
        make?.width.equalTo()(120)
        make?.height.equalTo()(10)
        }
        balance = UILabel()
        balance.text = "余额" + "52.00"
        balance.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(balance)
        balance.mas_makeConstraints { (make) in
            make?.left.equalTo()(self)?.setOffset(15)
            make?.top.equalTo()(self.titleLabel.mas_bottom)?.setOffset(10)
            make?.width.equalTo()(200)
            make?.height.equalTo()(10)
        }
        
        timeLabel = UILabel()
        timeLabel.textAlignment = .right
        timeLabel.font = UIFont.systemFont(ofSize: 13)
        timeLabel.textColor = UIColor.lightGray
        timeLabel.text = "2017-08-30"
        self.addSubview(timeLabel)
        timeLabel.mas_makeConstraints { (make) in
            make?.right.equalTo()(self)?.setOffset(-15)
            make?.top.equalTo()(self)?.setOffset(10)
            make?.width.equalTo()(100)
            make?.height.equalTo()(10)
        }
        money = UILabel()
        money.textAlignment = .right
        money.text = "-52.00"
        self.addSubview(money)
        money.mas_makeConstraints { (make) in
            make?.right.equalTo()(self)?.setOffset(-15)
            make?.top.equalTo()(self.timeLabel.mas_bottom)?.setOffset(5)
            make?.width.equalTo()(100)
            make?.height.equalTo()(20)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
