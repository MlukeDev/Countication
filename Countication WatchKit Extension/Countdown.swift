//
//  Countdown.swift
//  Countication WatchKit Extension
//
//  Created by Matt Luke on 12/4/19.
//  Copyright © 2019 MlukeApps. All rights reserved.
//

import Foundation

class Countdown
{
    var name : String
    var day : Int
    var month : Int
    var year : Int
    
    init(n:String, d:Int, m:Int, y:Int){
        name = n
        day = d
        month = m
        year = y

    }
}
