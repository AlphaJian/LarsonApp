//
//  WorkOrderScrollView.swift
//  LarsonApp
//
//  Created by Perry Z Chen on 11/10/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class WorkOrderScrollView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var callNumberContainer: UIView!
    @IBOutlet weak var callNumberContraint: NSLayoutConstraint!
    
    @IBOutlet weak var stationNumberContainer: UIView!
    @IBOutlet weak var stationNumberConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var siteAddressContainer: UIView!
    @IBOutlet weak var siteAddressConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var zipCodeContainer: UIView!
    @IBOutlet weak var zipCodeConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var phoneNumberContainer: UIView!
    @IBOutlet weak var phoneNumberConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var TechNumberContainer: UIView!
    @IBOutlet weak var techNumberConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var stationTitleLable: UILabel!
    @IBOutlet weak var stationContentLabel: UILabel!
    
    @IBOutlet weak var siteAddressLabel: UILabel!
    @IBOutlet weak var siteContentLabel: UILabel!
    @IBOutlet weak var zipContentLabel: UILabel!
    @IBOutlet weak var zipTitleLabel: UILabel!
    
    @IBOutlet weak var phoneNumTitleLabel: UILabel!
    @IBOutlet weak var phoneNumContentLabel: UILabel!
    
    @IBOutlet weak var techTitleLabel: UILabel!
    @IBOutlet weak var techContentLabel: UILabel!
    
    func initUI(model: AppointmentModel) {
//        let callNumberView = Bundle.main.loadNibNamed("WorkOrderStaticView", owner: self, options: nil)?[0] as? WorkOrderStaticView
//
//        callNumberView?.initUI(parameter: ("Call Number", model.telephoneNumber), labelWidth: LCDW)
//        let height = callNumberView?.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
//        print("---> \(height), \(LCDW)")
//        callNumberView?.frame = CGRect(x: 0, y: 0, width: LCDW, height: height!)
//        self.callNumberContraint.constant = height!
//        
//        self.callNumberContainer.addSubview(callNumberView!)
        self.titleLabel.text = "Call Number"
        self.stationTitleLable.text = "Station Number"
        self.siteAddressLabel.text = "Site Address"
        self.zipTitleLabel.text = "Zip Code"
        self.phoneNumTitleLabel.text = "Phone Number"
        self.techTitleLabel.text = "Phone Number"
        //\(model.telephoneNumber)\(model.telephoneNumber)\(model.telephoneNumber)\(model.telephoneNumber)
        let callNumStr = "\(model.telephoneNumber)" as NSString
        let stationStr = model.stationNumber
        let siteAddressStr = model.customerAddress
        let zipStr = model.zipCode
        let phoneNumStr = model.telephoneNumber
        let techNumStr = model.techNumber
        
        
        
        let str = NSMutableAttributedString(string: (callNumStr).uppercased)
        str.addAttribute(NSFontAttributeName, value:UIFont.systemFont(ofSize: 15.0), range:NSRange(location:0,length: (callNumStr).uppercased.characters.count ))
        self.callNumberContraint.constant = StringUtil.getAttributeString(str: str, width: LCDW - 30 )

        self.contentLabel.text = callNumStr as String
        
        
        self.stationContentLabel.text = stationStr
        self.siteContentLabel.text = siteAddressStr
        self.zipContentLabel.text = zipStr
        self.phoneNumContentLabel.text = phoneNumStr
        self.techContentLabel.text = techNumStr
        
//        let stationNumberView = Bundle.main.loadNibNamed("WorkOrderStaticView", owner: self, options: nil)?[0] as? WorkOrderStaticView
//        stationNumberView?.initUI(parameter: ("Station Number", ""), labelWidth: LCDW)
//        self.stationNumberContainer.addSubview(stationNumberView!)
//        
//        let siteAddressView = Bundle.main.loadNibNamed("WorkOrderStaticView", owner: self, options: nil)?[0] as? WorkOrderStaticView
//        siteAddressView?.initUI(parameter: ("Site Address", ""), labelWidth: LCDW)
//        self.siteAddressContainer.addSubview(siteAddressView!)
//        
//        let zipCodeView = Bundle.main.loadNibNamed("WorkOrderStaticView", owner: self, options: nil)?[0] as? WorkOrderStaticView
//        zipCodeView?.initUI(parameter: ("Zip Code", ""), labelWidth: LCDW)
//        self.zipCodeContainer.addSubview(zipCodeView!)
//        
//        let phoneNumberView = Bundle.main.loadNibNamed("WorkOrderStaticView", owner: self, options: nil)?[0] as? WorkOrderStaticView
//        phoneNumberView?.initUI(parameter: ("Phone Number", ""), labelWidth: LCDW)
//        self.phoneNumberContainer.addSubview(phoneNumberView!)
//        
//        let techNumberView = Bundle.main.loadNibNamed("WorkOrderStaticView", owner: self, options: nil)?[0] as? WorkOrderStaticView
//        techNumberView?.initUI(parameter: ("Tech Number", ""), labelWidth: LCDW)
//        self.TechNumberContainer.addSubview(techNumberView!)
        
        self.layoutIfNeeded()
        self.setNeedsLayout()
        
//        self.contentSize = CGSize(width: (callNumberView?.frame.size.width)!, height: height)
        
        
    }

}
