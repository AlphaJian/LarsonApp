//
//  NavSearchView.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/8/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class NavSearchView: UIView {

    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var searchTF: UITextField!
    
    var btnTappedHandler : ButtonTouchUpBlock?
    
    @IBAction func btnTapped(_ sender: AnyObject) {
        if btnTappedHandler != nil
        {
            btnTappedHandler!()
        }
    }

}
