//
//  AddressView.swift
//  LarsonApp
//
//  Created by appledev018 on 11/7/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class JobDetailView: UIView, GMSMapViewDelegate, GMSPanoramaViewDelegate {
    
    
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var mapView: UIView!
    
    @IBOutlet weak var customerLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var descriptionTitle: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    
    @IBOutlet weak var contactPerson: TextTitleView!
    @IBOutlet weak var sitePhone: TextTitleView!
    @IBOutlet weak var appointmentStatus: TextTitleView!
    @IBOutlet weak var division: TextTitleView!
    @IBOutlet weak var callStatus: TextTitleView!
    @IBOutlet weak var typeOfCall: TextTitleView!
    @IBOutlet weak var po: TextTitleView!
    
    
    @IBOutlet weak var descriptionHeight: NSLayoutConstraint!
    @IBOutlet weak var middleViewHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var callBtn: MKWhiteBtn!
    @IBOutlet weak var streetViewBtn: MKButton!
    
    
    var mapMovingHandler : ButtonTouchUpBlock?
    var movingHandler : ButtonTouchUpBlock?
    
    let mapViewHeight: CGFloat = 100
    let addressViewHeight: CGFloat = 100
    
    func initUI(model: AppointmentModel){
        
        customerLabel.text = model.customerName
        addressLabel.text = model.customerAddress
        
        callBtn.setTitle("CALL DISPATCH", for: .normal)
        
        
        descriptionTitle.text = "Service Description"
        descriptionText.text = (model.jobDetail as NSString).uppercased
        
        let str = NSMutableAttributedString(string: (model.jobDetail as NSString).uppercased)
        
        str.addAttribute(NSFontAttributeName, value:UIFont.systemFont(ofSize: 15.0), range:NSRange(location:0,length: (model.jobDetail as NSString).uppercased.characters.count ))
        
        descriptionHeight.constant = StringUtil.getAttributeString(str: str, width: LCDW - 40 )
        middleViewHeight.constant =  descriptionHeight.constant + 280
        
        
        contactPerson.initUI(title: "Contact Person", text: "\(model.contactName!)")
        sitePhone.initUI(title: "Site Phone", text: "\(model.contactNumber!)")
        appointmentStatus.initUI(title: "Appointment Status", text: "\(model.currentStatus!)")
        division.initUI(title: "Division", text: "\(model.division!)")
        callStatus.initUI(title: "Call Status", text: "\(model.callStatus!)")
        typeOfCall.initUI(title: "Type of Call", text: "\(model.jobType!)")
        po.initUI(title: "PO#", text: "\(model.purchaseOrder!)")
        
        initMap()
        
        streetViewBtn.cornerRadius = 22.5
        mapView.bringSubview(toFront: streetViewBtn)
        
        
    }
    
    func initMap(){
        
        let panoView = GMSPanoramaView(frame: self.mapView.bounds)
        
        panoView.delegate = self
        panoView.moveNearCoordinate(CLLocationCoordinate2D(latitude: -33.732, longitude: 150.312))
        
        
        self.mapView.addSubview(panoView)
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        //marker.map = mapView1
    
    }
    
   
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        
        if view != nil {
            if mapView.frame.contains(point) {
                if mapMovingHandler != nil {
                    mapMovingHandler!()
                }
            } else {
                if movingHandler != nil {
                    movingHandler!()
                }
            }
        
        }
        return view
    }
    
    @IBAction func streetViewBtnTaped(_ sender: AnyObject) {
        if (UIApplication.shared.canOpenURL(NSURL(string:"comgooglemaps://")! as URL)) {
            UIApplication.shared.openURL(NSURL(string:
                "comgooglemaps://?center=40.765819,-73.975866&zoom=14&views=traffic")! as URL)
        } else {
            print("Can't use comgooglemaps://");
        }
        
    }
    
}
