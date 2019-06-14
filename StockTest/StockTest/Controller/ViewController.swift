//
//  ViewController.swift
//  StockTest
//
//  Created by Huang YenHan on 2019/6/9.
//  Copyright © 2019 HuangYenHan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var stockView: StockView!
    var content: ContentDouble?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createCanvas()
        
        content = DataManager.shared.getJSON()
        
        stockView.commonInit(content)
        
    }
    
    func createCanvas() {
        stockView = StockView(frame: CGRect(x: 30, y: 100, width: UIScreen.width - 70, height: UIScreen.width))
        view.addSubview(stockView)
    }
    
}

