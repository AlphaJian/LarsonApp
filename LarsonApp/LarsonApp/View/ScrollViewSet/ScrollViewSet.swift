//
//  ScrollViewSet.swift
//  LarsonApp
//
//  Created by appledev018 on 11/1/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class ScrollViewSet: UIScrollView, UIScrollViewDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    var titleArr = ["aaa","bbbb","cccc","dddd","eee","ffff"]
    var scrolledHandler : ReturnBlock?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentSize.height = frame.height
        self.contentSize.width = LCDW * CGFloat(titleArr.count)
        self.showsHorizontalScrollIndicator = false
        self.isPagingEnabled = true
        self.delegate = self

    
        for i in 0...titleArr.count - 1 {
            
            let view = UIView.init(frame: CGRect(x: CGFloat(i) * LCDW, y: 0, width: LCDW, height: frame.height))
            
            view.backgroundColor = StringUtil.getColorWithRGB(red: 30 * CGFloat(i), green: 20 * CGFloat(i), blue: 155)
        
            self.addSubview(view)
            
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = contentOffset.x / LCDW
        
        print (index)
        
        if self.scrolledHandler != nil {
            self.scrolledHandler!(index as AnyObject)
        }
    }
    
    
    func scrollByTab (index : Int) {
        self.contentOffset.x = LCDW * CGFloat(index)
    }
    
}
