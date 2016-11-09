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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
    }

    func initUI() {
        let first = AppointmentViewController()
        self.addChildVC(childVC: first)
        first.sideBarTappedHandler = {(inex) -> Void in
            self.selectedIndex = NSInteger(inex as! NSNumber)
            
        }
        first.listBlock = { (obj) in
            self.newAppointment = obj as! AppointmentModel
            print("newAppointment =>=> \(self.newAppointment)")
        }
        
        let second = JobDetailViewController()
        second.model = AppointmentModel()
        self.addChildVC(childVC: second)
        second.sideBarTappedHandler = {(inex) -> Void in
            self.selectedIndex = NSInteger(inex as! NSNumber)
            
        }
        
        let third = PartSearchViewController()
        self.addChildVC(childVC: third)
        third.sideBarTappedHandler = {(inex) -> Void in
            self.selectedIndex = NSInteger(inex as! NSNumber)
            
        }
        
        let four = ChatViewController()
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
