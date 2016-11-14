//
//  SiteHistoryTableViewCell.swift
//  LarsonApp
//
//  Created by appledev018 on 11/10/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class SiteHistoryTableViewCell: UITableViewCell {
    
    var shadowView: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    func initSiteUI(model: SiteHistoryModel, index : IndexPath){
       
        initShadowView(height: model.cellHeight)
    let dateLabel = UILabel(frame: CGRect(x: 10, y: 5, width: 300, height: 30))
        
      let date = StringUtil.getDateFromString(date: model.dateOfServiceCall, format: "yyyy-MM-dd HH:mm:ss.s")
        
        let timeString = StringUtil.getStringFromDate(date: date, format: "MMM dd, yyyy")
        
        dateLabel.text = timeString
        dateLabel.font = UIFont.boldSystemFont(ofSize: 13)
        
        
        self.shadowView?.addSubview(dateLabel)
        
    let serviceCallView = TextTitleView(frame: CGRect(x: 20, y: 50, width: 300, height: 50))
        serviceCallView.initUI(title: "Service Call ID", text: model._id)
        let typeOfCallView = TextTitleView(frame: CGRect(x: 20, y: 50 + 60, width: 300, height: 50))
        typeOfCallView.initUI(title: "Type of Call", text: model.typeOfCall )
        let typeOfProblemView = TextTitleView(frame: CGRect(x: 20, y: 50 + 60 * 2, width: 300, height: 50))
        typeOfProblemView.initUI(title: "Type of Problem", text: model.typeOfProblem )
        let statusOfCallView = TextTitleView(frame: CGRect(x: 20, y: 50  + 60 * 3, width: 300, height: 50))
        statusOfCallView.initUI(title: "Status of Call", text: model.statusOfCall )
        let decriptionView = TextTitleView(frame: CGRect(x: 20, y: 50 + 60 * 4, width: 300, height: 50))
        decriptionView.initUI(title: "Service Description *", text: model.serviceDescription )

        self.shadowView?.addSubview(serviceCallView)
        self.shadowView?.addSubview(typeOfCallView)
        self.shadowView?.addSubview(typeOfProblemView)
        self.shadowView?.addSubview(statusOfCallView)
        self.shadowView?.addSubview(decriptionView)
        
        self.clipsToBounds = true
       
    }
    
    func initEquipUI(model: SiteHistoryEquipModel, index : IndexPath){
        
          self.clipsToBounds = true
    }
    
    func initNotesUI(model: SiteHistoryNotesModel, index : IndexPath){
       
       initShadowView(height: model.cellHeight)

        let dateLabel = UILabel(frame: CGRect(x: 10, y: 5, width: 300, height: 30))
        dateLabel.font = UIFont.boldSystemFont(ofSize: 13)
        dateLabel.text = StringUtil.getTime(timeStamp: model.date)
        
        let contentLabel = UILabel(frame: CGRect(x: 20, y: 50, width: LCDW - 80 , height: model.contentLabelHeight!))
        contentLabel.numberOfLines = 0
        contentLabel.text = model.content
        contentLabel.font = UIFont.systemFont(ofSize: 13)
        
        self.shadowView?.addSubview(contentLabel)
        self.shadowView?.addSubview(dateLabel)
          self.clipsToBounds = true
    }
    
    func initShadowView(height: CGFloat){
        
        shadowView = UIView(frame: CGRect(x: 20, y: 10, width: self.width() - 40, height: height - 20))
        shadowView?.backgroundColor = UIColor.white
        shadowView?.layer.shadowOpacity = 0.3
        shadowView?.layer.shadowRadius = 2.0
        shadowView?.layer.shadowColor = UIColor.black.cgColor
        shadowView?.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.contentView.addSubview(shadowView!)
    
    }
    

    func clearCell(){
        for subView : UIView in self.contentView.subviews
        {
            subView.removeFromSuperview()
        }
    }
    
}
