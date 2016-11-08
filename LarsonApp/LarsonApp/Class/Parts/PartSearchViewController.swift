//
//  PartSearchViewController.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/8/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class PartSearchViewController: BaseViewController {

    var partsResultTableView : PartsResultTableView?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initNav()
        initUI()
    }
    
    func initNav()
    {
        let navSearchView = Bundle.main.loadNibNamed("NavSearchView", owner: self, options: nil)?[0] as? NavSearchView
        navSearchView?.frame = CGRect(x: 0, y: 0, width: LCDW, height: 64)
        self.view.addSubview(navSearchView!)
        
        navSearchView?.btnTappedHandler = {
            self.navigationController?.popViewController(animated: true)
        }
        navSearchView?.searchHandler = {(keywords) -> Void in
            self.view.showhud()
            DataManager.shareManager.searchParts(keywords: keywords as! String, successHandler: { (results) in
                DispatchQueue.main.async {
                    self.view.hidehud()
                    self.partsResultTableView?.dataItems = PartsManager.shareManager.parsePartsDicToModel(dic: results as! NSDictionary)
                    self.partsResultTableView?.reloadData()
                }
                
                }, failHandeler: {(obj)in})
        }
    }
    
    func initUI(){
        partsResultTableView = PartsResultTableView(frame: CGRect(x: 0, y: 64, width: LCDW, height: LCDH - 64), style: .plain)
        self.view.addSubview(partsResultTableView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
