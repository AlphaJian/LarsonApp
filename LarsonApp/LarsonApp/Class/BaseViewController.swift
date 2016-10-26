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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
