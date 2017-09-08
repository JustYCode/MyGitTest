//
//  PayCell.swift
//  CityBus
//
//  Created by 小黄star on 2017/9/6.
//  Copyright © 2017年 小黄star. All rights reserved.
//

import UIKit

class PayCell: UITableViewCell {
    var cardImage = UIImageView()
    var cardName = UILabel()
    var tailNumber = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setAutoLayout()
    }
    
    func setAutoLayout()
    {
        cardImage = UIImageView()
        cardImage.image = UIImage.init(named: "card")
        cardImage.contentMode = .scaleAspectFit
        cardImage.clipsToBounds = true
        self.contentView.addSubview(cardImage)
        cardImage.mas_makeConstraints { (make) in
            make?.left.equalTo()(self.contentView)?.setOffset(10)
            make?.height.equalTo()(40)
            make?.width.equalTo()(40)
            make?.top.equalTo()(self)?.setOffset(20)
        }
        
        cardName = UILabel()
        cardName.text = "市民卡账户"
        self.contentView.addSubview(cardName)
        cardName.font = UIFont.systemFont(ofSize: 20)
        cardName.mas_makeConstraints { (make) in
            make?.left.equalTo()(self.cardImage.mas_right)?.setOffset(15)
            make?.height.equalTo()(20)
            make?.width.equalTo()(200)
            make?.top.equalTo()(self.contentView)?.setOffset(20)
        }
        
        tailNumber = UILabel()
        tailNumber.text = "尾号3555"
        tailNumber.textColor = UIColor.lightGray
        self.contentView.addSubview(tailNumber)
        tailNumber.font = UIFont.systemFont(ofSize: 14)
        tailNumber.mas_makeConstraints { (make) in
            make?.left.equalTo()(self.cardImage.mas_right)?.setOffset(15)
            make?.height.equalTo()(20)
            make?.width.equalTo()(100)
            make?.top.equalTo()(self.cardName.mas_bottom)?.setOffset(5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
