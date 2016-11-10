//
//  ScrollViewSet.swift
//  LarsonApp
//
//  Created by appledev018 on 11/1/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class ScrollViewSet: UIView, UIScrollViewDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var tabBarView : TabBarView?

    var scrollView : UIScrollView?
    var titleArr = ["aaa","bbbb","cccc","dddd","eee","ffff"]
    var scrolledHandler : ReturnBlock?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tabBarView = TabBarView.init(frame: CGRect(x: 0, y: 0, width: LCDW, height: 64))
        tabBarView?.titleArr = self.titleArr
        scrollView?.delegate = self
        //scrollView?.delegatePass = self
        self.addSubview(tabBarView!)
        
        tabBarView?.tabHandler = {(index)-> Void in
            let page = index as! Int
            self.scrollByTab(index: page)
        }
        
        scrollView = UIScrollView.init(frame: CGRect(x: 0, y: 64, width: LCDW, height: LCDH - 128 ))
        scrollView?.contentSize.height = (scrollView?.frame.height)!
        scrollView?.contentSize.width = LCDW * CGFloat(titleArr.count)
        scrollView?.showsHorizontalScrollIndicator = false
        
        scrollView?.isPagingEnabled = true
        scrollView?.delegate = self
        self.addSubview(scrollView!)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView == self.scrollView {        
        let index = scrollView.contentOffset.x / LCDW
        tabBarView?.scrollByView(index: Int(index))
        }
    }
    
    
    func scrollByTab (index : Int) {
        scrollView?.contentOffset.x = LCDW * CGFloat(index)
    }
  

}
