//
//  InterfaceController.swift
//  Countication WatchKit Extension
//
//  Created by Matt Luke on 11/13/19.
//  Copyright © 2019 MlukeApps. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
       
        // Configure interface objects here.
    }
    
    
    func awakeWithContext(context: AnyObject?) {
        super.awake(withContext: context)
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    

}
