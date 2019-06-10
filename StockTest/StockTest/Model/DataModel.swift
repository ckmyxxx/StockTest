//
//  data.swift
//  StockTest
//
//  Created by Huang YenHan on 2019/6/9.
//  Copyright © 2019 HuangYenHan. All rights reserved.
//

import Foundation

// MARK: Origin
struct Trend: Codable {
    let root: Content
}

struct Content: Codable {
    let rc: String
    let cnts: String
    let stk: String
    let c: String
    let tp: String
    let bp: String
    let v: String
    let tt: String
    let st: String
    let tick : [Tick]
}

struct Tick: Codable {
    let t: String
    let o: String
    let h: String
    let l: String
    let c: String
    let v: String
}

// MARK: Double
struct TrendDouble: Codable {
    let root: ContentDouble
}

struct ContentDouble: Codable {
    let stk: String
    let c: String
    let tp: String
    let bp: String
    let tick : [TickDouble]
}

struct TickDouble: Codable {
    let t: Double
    let c: Double
    let v: Double
}
