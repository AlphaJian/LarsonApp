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
    var optionView : OptionView?
    var tabBarView : TabBarView?
    var scrollViewSet : ScrollViewSet?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func initNavView(title : String){
        navHeaderView = Bundle.main.loadNibNamed("NavHeaderView", owner: self, options: nil)?[0] as? NavHeaderView
        navHeaderView?.frame = CGRect(x: 0, y: 0, width: LCDW, height: 64)
        navHeaderView?.initUI(str: title, bolBack: false)
        self.view.addSubview(navHeaderView!)
        navHeaderView?.testBtnHandler = {
            
        }
        navHeaderView?.opertionBtnHandler = {
            self.optionView = Bundle.main.loadNibNamed("OptionView", owner: self, options: nil)?[0] as? OptionView
            self.optionView!.frame = self.view.bounds
            self.optionView?.initUI()
            
            self.view.addSubview(self.optionView!)
            self.optionView?.cellTouchUpHandler = {(index, obj) -> Void in
               
                    self.optionView?.handleSwipeGesture()
            }
        }
        
//        tabBarView = TabBarView.init(frame: CGRect(x: 0, y: 64, width: LCDW, height: 64))
//        self.view.addSubview(tabBarView!)
//        
//        tabBarView?.tabHandler = {(index)-> Void in
//        let page = index as! Int
//            self.scrollViewSet?.scrollByTab(index: page)
//        }
//        
//        scrollViewSet = ScrollViewSet.init(frame: CGRect(x: 0, y: 128, width: LCDW, height: LCDH - 128 ))
//        self.view.addSubview(scrollViewSet!)
//
//        scrollViewSet?.scrolledHandler =  {(index)-> Void in
//            let page = index as! Int
//            self.tabBarView?.scrollByView(index: page)
//        }
//
//        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
