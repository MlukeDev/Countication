//
//  CountdownsInterfaceController.swift
//  Countication WatchKit Extension
//
//  Created by Matt Luke on 11/14/19.
//  Copyright © 2019 MlukeApps. All rights reserved.
//

import WatchKit
import Foundation
import ClockKit

//protocol CountdownsInterfaceControllerDelegate : NSObjectProtocol{
//    func doSomethingWith(data: String)
//}



class CountdownsInterfaceController: WKInterfaceController, ModalItemChooserDelegate {
   

    @IBOutlet weak var countDownLabel: WKInterfaceLabel!
    @IBOutlet weak var dateLabel: WKInterfaceLabel!
    @IBOutlet weak var daysLeftLabel: WKInterfaceLabel!
    
    
    
    
    
    var countdowns = "CountdownTitle"
    
    
    
    var day = 1
    var month = 1
    var year = 2019
    var daysLeft = 0
    var startDate = 0
    
    var item = "no item"
    

    func reloadComplications() {
        
        print("Reloading Complications")
        let server = CLKComplicationServer.sharedInstance()
        guard let complications = server.activeComplications, complications.count > 0 else {
            return
        }
             
        for complication in complications  {
            server.reloadTimeline(for: complication)
        }
    }
    
    override func awake(withContext context: Any?) {
        
        

       
        
        super.awake(withContext: context)
            let defaults = UserDefaults.standard
        
        
        
        
        countdowns = defaults.string(forKey: "title") ?? "Countdown"
        day = defaults.integer(forKey: "day")
        month = defaults.integer(forKey: "month")
        year = defaults.integer(forKey: "year")
        calculateTimeRemaining(dayInt: day, monthInt: month, yearInt: year)
        
        defaults.set(daysLeft, forKey: "daysLeft")
            
        let dateString = "\(month)-\(day)-\(year)"
        
        setLabels(title: countdowns, dateString: dateString, daysLeft: daysLeft)
        
     
        
            print(context as? String ?? "default")
        
        }
    
    func setLabels(title: String, dateString: String, daysLeft: Int)
    {
        countDownLabel.setText(title)
        dateLabel.setText(dateString)
        daysLeftLabel.setText(String(daysLeft))
    }
    
    func didSelectItem(t: NSString, m: String, d: String, y: String) {
        self.item = t as String
        print(t)
        
        let defaults = UserDefaults.standard
        let dateString = "\(m)-\(d)-\(y)"
        
        let dateFormatter = DateFormatter()

        // This is important - we set our input date format to match our input string
        // if the format doesn't match you'll get nil from your string, so be careful
        dateFormatter.dateFormat = "MM-dd-yyyy"

        //`date(from:)` returns an optional so make sure you unwrap when using.
        let dateFromString: Date? = dateFormatter.date(from: dateString)
        print(dateFromString)
        print(dateString)
        let dateFrom : Double = dateFromString?.timeIntervalSince1970 ?? 0.0
        
        print("DateFrom \(dateFrom)")
        print(Date().timeIntervalSince1970)
        
        defaults.set(dateFrom, forKey: "end")
        
        
        
        let date = Date()
        
        let start = Double(Date().timeIntervalSince1970)
        
        defaults.set(start, forKey: "start")
        
        let calendar = Calendar.current
        let startDay = calendar.component(.day, from: date)
        let startMonth = calendar.component(.month, from: date)
        let startyear = calendar.component(.year, from: date)
        
        
        defaults.set(startDay, forKey: "startDay")
        defaults.set(startMonth, forKey: "startMonth")
        defaults.set(startyear, forKey: "startYear")
        
        defaults.set(d, forKey: "day")
        defaults.set(m, forKey: "month")
        defaults.set(y, forKey: "year")
        defaults.set(t, forKey: "title")
        
        reloadComplications()
        
        day = Int(d) ?? 1
        month = Int(m) ?? 1
        year = Int(y) ?? 2019
        
        
        
        let datesString = "\(m)-\(d)-\(y)"
        
        calculateTimeRemaining(dayInt: day, monthInt: month, yearInt: year)
        
        setLabels(title: t as String, dateString: datesString, daysLeft: daysLeft)
            
    }
    
    @IBAction func addButton() {
        self.presentController(withName: "AddPageInterfaceController", context: self)
    }
    
    func calculateTimeRemaining(dayInt: Int, monthInt: Int, yearInt: Int)
    {
        let date = NSDate()
         let calendar = Calendar.current

         let components = calendar.dateComponents([.month, .year, .day], from: date as Date)

         let currentDate = calendar.date(from: components)

         let userCalendar = Calendar.current

         
         let competitionDate = NSDateComponents()
         competitionDate.year = yearInt
         competitionDate.month = monthInt
         competitionDate.day = dayInt
        
         let competitionDay = userCalendar.date(from: competitionDate as DateComponents)!
         
         let CompetitionDayDifference = calendar.dateComponents([.day], from: currentDate!, to: competitionDay)
        
        
        daysLeft = CompetitionDayDifference.day ?? 0
        let defaults = UserDefaults.standard
        defaults.set(daysLeft, forKey: "daysLeft")
        
         print(CompetitionDayDifference)
    }
    
}
