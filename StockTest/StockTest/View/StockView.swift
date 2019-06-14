//
//  StockView.swift
//  StockTest
//
//  Created by Huang YenHan on 2019/6/14.
//  Copyright © 2019 HuangYenHan. All rights reserved.
//

import UIKit

class StockView: UIView {
    
    var canvasWidth: Double = UIScreen.widthD - 70
    var canvasHeight: Double = UIScreen.widthD
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit(_ content: ContentDouble?) {
        getAllPoint(content)
        
        getGrid()
        
        addXLabel()
        
        addYLabel(content)
    }
    
    func createShapeLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.frame
        shapeLayer.fillColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5).cgColor
        shapeLayer.lineWidth = 0.5
        shapeLayer.strokeColor = UIColor.gray.cgColor
        
        return shapeLayer
    }
    
    func addShapeLayer(_ shapeLayer: CAShapeLayer, path: UIBezierPath, view: UIView) {
        shapeLayer.path = path.cgPath
        shapeLayer.position = view.center
        view.layer.addSublayer(shapeLayer)
    }
    
    func addXLabel() {
        
        for index in 0...4 {
            let label = UILabel(frame: CGRect(x: Double(index) * canvasWidth * 2 / 9, y: canvasHeight + 30, width: 40, height: 22))
            
            if index == 0 {
                label.text = "09"
            } else {
                label.text = "\(index + 9)"
            }
            label.textAlignment = .right
            label.textColor = UIColor.white
            
            addSubview(label)
        }
        
    }
    
    func addYLabel(_ content: ContentDouble?) {
        
        for index in 0...2 {
            let label = UILabel(frame: CGRect(x: -15, y: canvasHeight * Double(index) / 2 - Double(index) * 11 + 30, width: 45, height: 22))
            
            guard let content = content else { return }
            
            if index == 0 {
                label.text = content.tp
                label.backgroundColor = UIColor.red
            } else if index == 1 {
                label.text = content.c
            } else {
                label.text = content.bp
                label.backgroundColor = UIColor(red: 0, green: 0.5, blue: 0, alpha: 1)
            }
            label.textAlignment = .right
            label.textColor = UIColor.white
            
            addSubview(label)
        }
        
    }
    
    func getAllPoint(_ content: ContentDouble?) {
        let shapeLayer = createShapeLayer()
        let path = UIBezierPath()
        
        if let content = content, let c = Double(content.c) {
            path.transCoMove(to: CGPoint(x: 0, y: canvasHeight / 2))
            path.transCoAddLine(to: CGPoint(x: 0, y: canvasHeight / 2))
            
            for index in content.tick.indices {
                
                let tempX = content.tick[index].t * canvasWidth / content.tick.last!.t
                let tempY = (content.tick[index].c - c) * canvasHeight / (c * 0.1 * 2) + canvasHeight / 2
                path.transCoAddLine(to: CGPoint(x: tempX, y: tempY))
                print("\(index)x: \(tempX), y: \(tempY)")
            }
            path.transCoAddLine(to: CGPoint(x: canvasWidth, y: canvasHeight / 2))
        }
        
        addShapeLayer(shapeLayer, path: path, view: self)
        
    }
    
    func getGrid() {
        
        // add Y Grid
        for index in 0...4 {
            let shapeLayer = createShapeLayer()
            let path = UIBezierPath()
            
            path.transCoMove(to: CGPoint(x: 0, y: canvasHeight * Double(index) / 4))
            path.transCoAddLine(to: CGPoint(x: canvasWidth, y: canvasHeight * Double(index) / 4))
            
            addShapeLayer(shapeLayer, path: path, view: self)
        }
        
        // add X Grid
        for index in stride(from: 0, to: 9, by: 2) {
            let shapeLayer = createShapeLayer()
            let path = UIBezierPath()
            
            path.transCoMove(to: CGPoint(x: canvasWidth * Double(index) / 9, y: 0))
            path.transCoAddLine(to: CGPoint(x: canvasWidth * Double(index) / 9, y: canvasHeight))
            
            addShapeLayer(shapeLayer, path: path, view: self)
        }
        
        addLastXGrid()
    }
    
    private func addLastXGrid() {
        let shapeLayer = createShapeLayer()
        let path = UIBezierPath()
        
        path.transCoMove(to: CGPoint(x: canvasWidth, y: 0))
        path.transCoAddLine(to: CGPoint(x: canvasWidth, y: canvasHeight))
        
        addShapeLayer(shapeLayer, path: path, view: self)
    }
    
}
