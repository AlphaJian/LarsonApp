//
//  PartRequestContainerView.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/9/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class PartRequestContainerView: UIScrollView {

    @IBOutlet weak var legacyIdLabel: UILabel!
    @IBOutlet weak var customerNameLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    
    @IBOutlet weak var partNameLbl: UILabel!
    @IBOutlet weak var partPriceLbl: UILabel!
    @IBOutlet weak var partIdLbl: UILabel!
    @IBOutlet weak var partQualityContainer: UIView!
    @IBOutlet weak var questionContainer: UIView!
    
    var qualityTF : CustomTextField?
    var emergencyView : SelectionView?
    var deliveryView : SelectionView?
    
    func initUpper(appointmentModel : AppointmentModel){
        legacyIdLabel.text = appointmentModel.legacyId
        customerNameLbl.text = appointmentModel.customerName
        addressLbl.text = appointmentModel.customerAddress
    }

    func initPart(partModel : PartModel)
    {
        partNameLbl.text = partModel.name
        partIdLbl.text = "#\(partModel.number)"
        partPriceLbl.text = "$\(partModel.price)/ piece"
        
        qualityTF = Bundle.main.loadNibNamed("CustomTextField", owner: self, options: nil)?[0] as? CustomTextField
        qualityTF?.createCustomField(_title: "Quality", _bolTextfield: true)
        qualityTF?.frame = partQualityContainer.bounds
        partQualityContainer.addSubview(qualityTF!)
        qualityTF?.finishEditHandler = {(str) -> Void in
        }
        
        emergencyView = SelectionView(frame: CGRect(x: 10, y: 0, width: questionContainer.width(), height: 40))
        emergencyView?.initUI(title: "Is this an emergency request? *", strY: "Yes", strNo: "No")
        questionContainer.addSubview(emergencyView!)
        
        deliveryView = SelectionView(frame: CGRect(x: 10, y: (emergencyView?.bottom())! + 10, width: questionContainer.width(), height: 40))
        deliveryView?.initUI(title: "Do you need delivery service?*", strY: "Yes", strNo: "No, pick up at the warehouse")
        questionContainer.addSubview(deliveryView!)
        
    }
}
