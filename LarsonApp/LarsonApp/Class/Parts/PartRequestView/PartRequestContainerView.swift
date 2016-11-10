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
    @IBOutlet weak var notesContainer: UIView!
    
    var qualityTF : CustomTextField?
    var emergencyView : SelectionView?
    var deliveryView : SelectionView?
    var notesTF : CustomTextField?
    
    var requestHandler : ReturnWithTwoParmsBlock?
    
    var partModel : PartModel?
    var appointmentModel : AppointmentModel?
    
    func initUpper(model : AppointmentModel){
        appointmentModel = model
        legacyIdLabel.text = model.legacyId
        customerNameLbl.text = model.customerName
        addressLbl.text = model.customerAddress
    }

    func initPart(model : PartModel)
    {
        partModel = model
        partNameLbl.text = model.name
        partIdLbl.text = "#\(model.number)"
        partPriceLbl.text = "$\(model.price)/ piece"
        
        qualityTF = Bundle.main.loadNibNamed("CustomTextField", owner: self, options: nil)?[0] as? CustomTextField
        qualityTF?.createCustomField(_title: "Quality *", _bolTextfield: true)
        qualityTF?.frame = partQualityContainer.bounds
        partQualityContainer.addSubview(qualityTF!)
        qualityTF?.finishEditHandler = {(str) -> Void in
            if str != ""
            {
                self.partModel?.qty = Int(str)!
            }
        }
        
        emergencyView = SelectionView(frame: CGRect(x: 10, y: 0, width: questionContainer.width(), height: 40))
        emergencyView?.initUI(title: "Is this an emergency request? *", strY: "Yes", strNo: "No")
        questionContainer.addSubview(emergencyView!)
        
        deliveryView = SelectionView(frame: CGRect(x: 10, y: (emergencyView?.bottom())! + 10, width: questionContainer.width(), height: 40))
        deliveryView?.initUI(title: "Do you need delivery service?*", strY: "Yes", strNo: "No, pick up at the warehouse")
        questionContainer.addSubview(deliveryView!)
        
        notesTF = Bundle.main.loadNibNamed("CustomTextField", owner: self, options: nil)?[0] as? CustomTextField
        notesTF?.createCustomField(_title: "Notes", _bolTextfield: true)
        notesTF?.frame = notesContainer.bounds
        notesContainer.addSubview(notesTF!)
        notesTF?.finishEditHandler = {(str) -> Void in
            self.partModel?.notes = str 
        }
        
    }
    @IBAction func requestTapped(_ sender: AnyObject) {
        let str = checkValue()
        if str.characters.count > 0
        {
            self.showhudForError(str)
            return
        }
        if requestHandler != nil
        {
            requestHandler!(partModel!, (appointmentModel?._id)! as AnyObject)
        }
    }
    
    func checkValue() -> String
    {
        if partModel?.qty == 0
        {
            return "Please enter parts quality"
        }
        return ""
    }
}
