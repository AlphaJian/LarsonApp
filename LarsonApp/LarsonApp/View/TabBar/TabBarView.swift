//
//  TabBarView.swift
//  LarsonApp
//
//  Created by appledev018 on 10/27/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class TabBarView: UIScrollView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var tabHandler : ReturnBlock?
    var titleArr = ["aaa","bbbb","cccc","dddd","eee","ffff"]
    let btnWidth = LCDW / 3
    let redLineHeight: CGFloat = 2
    
    var redLine : UIView?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentSize.height = frame.height
        self.contentSize.width = btnWidth * CGFloat(titleArr.count)
        self.showsHorizontalScrollIndicator = false
        self.backgroundColor = StringUtil.getColorWithRGB(red: 33, green: 150, blue: 243)
        
        for i in 0...titleArr.count - 1 {
            
            
        let btn = MKButton.init(frame: CGRect(x: CGFloat(i) * btnWidth, y: 0, width: btnWidth, height: frame.height))
            btn.tag = 10 + i
            btn.setTitle(titleArr[i], for: .normal)
            btn.addTarget(self, action: #selector(TabBarView.btnTapped), for: .touchUpInside)
            self.addSubview(btn)
        }
        
        redLine = UIView.init(frame: CGRect(x: 0, y: frame.height - redLineHeight , width: btnWidth, height: redLineHeight))
        redLine?.backgroundColor = UIColor.red
        self.addSubview(redLine!)
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    func btnTapped (_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3) { 
            self.redLine?.frame = CGRect(x: sender.frame.minX, y: self.frame.height - self.redLineHeight , width: self.btnWidth, height: self.redLineHeight)
            if sender.tag != 10 && sender.tag != 10 + self.titleArr.count - 1 {
                self.contentOffset.x = sender.frame.minX - self.btnWidth
            }
            
            let index = sender.tag - 10
            if self.tabHandler != nil {
                self.tabHandler!(index as AnyObject)
            }
        }
    }
    
    func scrollByView (index : Int){
        UIView.animate(withDuration: 0.3) {
            
            if index != 0 && index != self.titleArr.count - 1 {
            
        self.contentOffset.x = self.btnWidth * (CGFloat(index) - 1)
            }
         self.redLine?.frame = CGRect(x: CGFloat(index) * self.btnWidth, y: self.frame.height - self.redLineHeight , width: self.btnWidth, height: self.redLineHeight)
        }
    }
    
    

}
