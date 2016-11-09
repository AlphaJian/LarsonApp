//
//  TabViewController.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/7/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    var newAppointment = AppointmentModel()
    
    var first : AppointmentViewController!
    var second : JobDetailViewController!
    var third : PartSearchViewController!
    var four : ChatViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
    }

    func initUI() {
        first = AppointmentViewController()
        self.addChildVC(childVC: first)
        first.sideBarTappedHandler = {(inex) -> Void in
            self.selectedIndex = NSInteger(inex as! NSNumber)
            
        }
        first.listBlock = { (obj) in
            self.newAppointment = obj as! AppointmentModel
            self.second.model = self.newAppointment
        }
        
        second = JobDetailViewController()
        second.model = self.newAppointment
        self.addChildVC(childVC: second)
        second.sideBarTappedHandler = {(inex) -> Void in
            self.selectedIndex = NSInteger(inex as! NSNumber)
            
        }
        
        third = PartSearchViewController()
        self.addChildVC(childVC: third)
        third.sideBarTappedHandler = {(inex) -> Void in
            self.selectedIndex = NSInteger(inex as! NSNumber)
            
        }
        
        four = ChatViewController()
        self.addChildVC(childVC: four)
        four.sideBarTappedHandler = {(inex) -> Void in
            self.selectedIndex = NSInteger(inex as! NSNumber)
            
        }
    }
    
    func addChildVC(childVC : UIViewController){
        let nav = NavViewController(rootViewController: childVC)
        self.addChildViewController(nav)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
