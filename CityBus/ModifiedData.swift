//
//  ModifiedData.swift
//  CityBus
//
//  Created by 小黄star on 2017/9/6.
//  Copyright © 2017年 小黄star. All rights reserved.
//

import UIKit

class ModifiedData: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
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


extension ModifiedData:UITableViewDataSource,UITableViewDelegate{
    
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
        payCell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        if indexPath.section == 1 {
            payCell?.cardImage.isHidden = true
            payCell?.cardName.isHidden = true
            payCell?.tailNumber.isHidden = true
            if indexPath.row == 0 {
                payCell?.textLabel?.text = "修改照片"
                let detailText = UILabel()
                detailText.font = UIFont.systemFont(ofSize: 12)
                detailText.textColor = UIColor.lightGray
                detailText.text = "如需修改,图片必须为小于32k的jpg格式"
                detailText.numberOfLines = 0
                payCell?.contentView.addSubview(detailText)
                detailText.mas_makeConstraints({ (make) in
                    make?.left.equalTo()(payCell?.contentView)?.setOffset(100)
                    make?.top.equalTo()(payCell?.contentView)
                    make?.bottom.equalTo()(payCell?.contentView)
                    make?.width.equalTo()(SCREEN_WIDTH/2)
                })
                let icon = UIImageView()
                icon.image = UIImage.init(named: "headerImage")
                icon.contentMode = .scaleAspectFit
                payCell?.contentView.addSubview(icon)
                icon.mas_makeConstraints({ (make) in
                    make?.right.equalTo()(payCell?.contentView)
                    make?.top.equalTo()(payCell?.contentView)
                    make?.bottom.equalTo()(payCell?.contentView)
                    make?.width.equalTo()(40)
                })
            }else{
                payCell?.textLabel?.text = "修改其他"
                let detailText = UILabel()
                detailText.font = UIFont.systemFont(ofSize: 14)
                detailText.textColor = UIColor.lightGray
                detailText.textAlignment = .right
                detailText.text = "其他内容"
                payCell?.contentView.addSubview(detailText)
                detailText.mas_makeConstraints({ (make) in
                    make?.right.equalTo()(payCell?.contentView)
                    make?.top.equalTo()(payCell?.contentView)
                    make?.bottom.equalTo()(payCell?.contentView)
                    make?.width.equalTo()(80)
                })
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
            titleLabel.text = "修改信息"
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
            button.setTitle("提交审核", for: .normal)
            button.setTitleColor(UIColor.white, for: .normal)
            button.backgroundColor = UIColor.init(colorLiteralRed: 0/255.0, green: 116/255.0, blue: 238/255.0, alpha: 1.0)
            contentView.addSubview(button)
            return contentView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == 0 {
            let actionSheet = UIAlertController(title: "上传头像", message: nil, preferredStyle: .actionSheet)
            let cancelBtn = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            
            
            let takePhotos = UIAlertAction(title: "拍照", style: .destructive, handler: {
                (action: UIAlertAction) -> Void in
                
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    let picker = UIImagePickerController()
                    picker.sourceType = .camera
                    picker.delegate = self
                    picker.allowsEditing = true
                    self.present(picker, animated: true, completion: nil)
                    
                }
                else
                {
                    print("模拟其中无法打开照相机,请在真机中使用");
                }
                
                
            })
            let selectPhotos = UIAlertAction(title: "相册选取", style: .default, handler: {
                (action:UIAlertAction)
                -> Void in
                let picker = UIImagePickerController()
                picker.sourceType = .photoLibrary
                picker.delegate = self
                picker.allowsEditing = true
                self.present(picker, animated: true, completion: nil)
                
            })
            actionSheet.addAction(cancelBtn)
            actionSheet.addAction(takePhotos)
            actionSheet.addAction(selectPhotos)
            self.present(actionSheet, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let type: String = (info[UIImagePickerControllerMediaType] as! String)
        
        //当选择的类型是图片
        if type == "public.image"
        {
            
            //修正图片的位置
            let image = self.fixOrientation((info[UIImagePickerControllerOriginalImage] as! UIImage))
            //先把图片转成NSData
            let data = UIImageJPEGRepresentation(image, 0.5)
            
            picker.dismiss(animated: true, completion: {
                () -> Void in
            })
            
        }
    }
    
    func fixOrientation(_ aImage: UIImage) -> UIImage {
        // No-op if the orientation is already correct
        if aImage.imageOrientation == .up {
            return aImage
        }
        // We need to calculate the proper transformation to make the image upright.
        // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
        var transform: CGAffineTransform = CGAffineTransform.identity
        switch aImage.imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: aImage.size.width, y: aImage.size.height)
            transform = transform.rotated(by: CGFloat(M_PI))
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: aImage.size.width, y: 0)
            transform = transform.rotated(by: CGFloat(M_PI_2))
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: aImage.size.height)
            transform = transform.rotated(by: CGFloat(-M_PI_2))
        default:
            break
        }
        
        switch aImage.imageOrientation {
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: aImage.size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: aImage.size.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        default:
            break
        }
        
        // Now we draw the underlying CGImage into a new context, applying the transform
        // calculated above.
        
        
        
        let ctx: CGContext = CGContext(data: nil, width: Int(aImage.size.width), height: Int(aImage.size.height), bitsPerComponent: aImage.cgImage!.bitsPerComponent, bytesPerRow: 0, space: aImage.cgImage!.colorSpace!, bitmapInfo: aImage.cgImage!.bitmapInfo.rawValue)!
        ctx.concatenate(transform)
        switch aImage.imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            // Grr...
            ctx.draw(aImage.cgImage!, in: CGRect(x: 0, y: 0, width: aImage.size.height, height: aImage.size.width))
        default:
            ctx.draw(aImage.cgImage!, in: CGRect(x: 0, y: 0, width: aImage.size.width, height: aImage.size.height))
        }
        
        // And now we just create a new UIImage from the drawing context
        let cgimg: CGImage = ctx.makeImage()!
        let img: UIImage = UIImage(cgImage: cgimg)
        return img
    }

    
}

