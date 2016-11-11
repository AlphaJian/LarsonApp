//
//  BaseViewController.swift
//  LarsonApp
//
//  Created by Jian Zhang on 10/25/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var navHeaderView : NavHeaderView?
    
    var optionView = OptionView.shareManager
    
    var sideBarTappedHandler : ReturnBlock?
    
    var bolLoaded = false
    var items = DataManager.shareManager.items
    
    var tapGes : UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        listenTapGesture()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
//        self.view.removeGestureRecognizer(tapGes!)
    }
    
    func listenTapGesture(){
        tapGes = UITapGestureRecognizer(target: self, action: #selector(BaseViewController.viewTapped))
        tapGes?.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGes!)
    }
    
    func viewTapped(){
        UIApplication.shared.keyWindow?.endEditing(true)
    }
    
    func initNavView(title : String, bolBack : Bool){
        if bolLoaded == false
        {
            navHeaderView = Bundle.main.loadNibNamed("NavHeaderView", owner: self, options: nil)?[0] as? NavHeaderView
            navHeaderView?.frame = CGRect(x: 0, y: 0, width: LCDW, height: 64)
            navHeaderView?.initUI(str: title, bolBack: bolBack)
            self.view.addSubview(navHeaderView!)
            bolLoaded = true
            
            navHeaderView?.testBtnHandler = {
                
            }
            navHeaderView?.opertionBtnHandler = {
                if bolBack == true
                {
                    let _ = self.navigationController?.popViewController(animated: true)
                }
                else
                {
                    self.initSideBar()
                }
            }
        }
    }
    
    func initSideBar(){
        self.optionView = (Bundle.main.loadNibNamed("OptionView", owner: self, options: nil)?[0] as? OptionView)!
        self.optionView.items = self.items
        self.optionView.frame = self.view.bounds
        self.optionView.initUI()
        
        self.view.addSubview(self.optionView)
        self.optionView.cellTouchUpHandler = {(index, obj) -> Void in
            if index.row == 4
            {
                GoogleSignInManager.sharedManager.signOut()
                return
            }
            self.items["didSelect"] = index.item
            self.optionView.handleSwipeGesture()
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            DispatchQueue.main.async {
                appDelegate.tabVC?.selectedIndex = index.row
                let currentVC = appDelegate.tabVC?.childViewControllers[index.row] as! UINavigationController
                currentVC.popToRootViewController(animated: false)
                
            }
//            if self.sideBarTappedHandler != nil
//            {
//                self.sideBarTappedHandler!(index.row as AnyObject)
//            }
        }
    }
    
    func getBaseTabVC() -> TabViewController{
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return (appDelegate?.tabVC)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
