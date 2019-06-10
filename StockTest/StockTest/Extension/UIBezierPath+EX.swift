//
//  UIBezierPath+EX.swift
//  StockTest
//
//  Created by Huang YenHan on 2019/6/10.
//  Copyright © 2019 HuangYenHan. All rights reserved.
//

import Foundation
import UIKit

extension UIBezierPath {
    
    func transCoMove(to: CGPoint, y: CGFloat = UIScreen.width - 70) {
        
        self.move(to: CGPoint(x: to.x, y: y - to.y))
    }
    
    func transCoAddLine(to: CGPoint, y: CGFloat = UIScreen.width - 70) {
        
        self.addLine(to: CGPoint(x: to.x, y: y - to.y))
        
    }
}
