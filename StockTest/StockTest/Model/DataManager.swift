//
//  DataManager.swift
//  StockTest
//
//  Created by Huang YenHan on 2019/6/10.
//  Copyright © 2019 HuangYenHan. All rights reserved.
//

import Foundation


class DataManager {
    
    static let shared = DataManager()
    
    private init() {}
    
    func getJSON() -> ContentDouble? {
        
        if let path = Bundle.main.path(forResource: "trend_2201", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let trend = try JSONDecoder().decode(Trend.self, from: data)
                
                return transContent(trend.root)
            } catch {
                print(error)
                return nil
            }
        }
        return nil
    }
    
    private func transTick(_ tick: [Tick]) -> [TickDouble] {
        
        var tempArr: [TickDouble] = []
        
        for index in tick.indices {
            if let tempC = Double(tick[index].c),
                let tempT = Double(tick[index].t),
                let tempV = Double(tick[index].v) {
            
            tempArr.append(TickDouble(t: tempT, c: tempC, v: tempV))
            }
        }
        
        return tempArr
        
    }
    
    private func transContent(_ root: Content) -> ContentDouble {
        
    let tempContent = ContentDouble(stk: root.stk, c: root.c, tp: root.tp, bp: root.bp, tick: transTick(root.tick))
        
    return tempContent
        
    }
    
}
