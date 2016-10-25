//
//  BlockDefination.swift
//  BusinessOS
//
//  Created by Jian Zhang on 12/2/15.
//  Copyright © 2015 PwC. All rights reserved.
//

import UIKit

typealias ButtonTouchUpBlock = () -> Void
typealias ButtonTouchUpWithParmBlock = (AnyObject) -> Void

typealias CellTouchUpBlock = (NSIndexPath, AnyObject) -> Void

typealias ReturnBlock = (AnyObject) -> Void

typealias ReturnCGRectBlock = (CGRect) -> Void

typealias ReturnWithTwoParmsBlock = (AnyObject,AnyObject) -> Void
typealias ReturnWithThreeParmsBlock = (AnyObject,AnyObject,AnyObject) -> Void
typealias ReturnWithFourParmsBlock = (AnyObject,AnyObject,AnyObject,AnyObject) -> Void

let LCDW : CGFloat = UIScreen.main.bounds.size.width
let LCDH : CGFloat = UIScreen.main.bounds.size.height



class BlockDefination: NSObject {

}
