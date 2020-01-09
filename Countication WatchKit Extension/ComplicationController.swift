//
//  ComplicationController.swift
//  Countication WatchKit Extension
//
//  Created by Matt Luke on 11/13/19.
//  Copyright © 2019 MlukeApps. All rights reserved.
//

import ClockKit


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    var getCurrentCountdown = 0
    var setDay = 0
    var setMonth = 0
    var setYear = 0
    var fillFraction = 1.0
    
    // MARK: - Timeline Configuration
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        let defaults = UserDefaults.standard
        
        setDay = defaults.integer(forKey: "day")
        setMonth = defaults.integer(forKey: "month")
        setYear = defaults.integer(forKey: "year")
        
        calculateFillFraction()
        
        calculateTimeRemaining(dayInt: setDay, monthInt: setMonth, yearInt: setYear)
        
        
//        getCurrentCountdown = defaults.integer(forKey: "daysLeft")
        
        let template = CLKComplicationTemplateGraphicCircularClosedGaugeText()
        
        
        
        
        let fillFractionVar = 1.0
                   

        print("Fill Fraction is: \(fillFraction)")
            template.centerTextProvider = CLKSimpleTextProvider(text: "\(getCurrentCountdown)")
            template.gaugeProvider = CLKSimpleGaugeProvider(style: .ring, gaugeColor: .blue, fillFraction: Float(1 - fillFraction))
                   
                   
            let timelineEntry = CLKComplicationTimelineEntry(date: NSDate() as Date, complicationTemplate: template)
            handler(timelineEntry)
               
    }
    
    
    func calculateFillFraction()
    {
        let defaults = UserDefaults.standard
        let start = defaults.double(forKey: "start")
        let current = Double(Date().timeIntervalSince1970)
        let end = Double(defaults.double(forKey: "end"))
        print("Start: \(start)   Current: \(current)   End: \(end)")
        
        print("End Var is \(end)")
        
        print("Current - Start = \(current - start)")
        print("End - Start = \(end - start)")
        
        fillFraction = (current - start) / (end - start)
        
        print("Fill Fraction is \(fillFraction)")
        
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
        
        
        getCurrentCountdown = CompetitionDayDifference.day ?? 0
        
        
         print(CompetitionDayDifference)
    }
    
    func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.forward, .backward])
    }
    
    func getTimelineStartDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        handler(NSDate())
    }
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(nil)
    }
    
    func getPrivacyBehaviorForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationPrivacyBehavior) -> Void) {
        handler(CLKComplicationPrivacyBehavior.showOnLockScreen)
    }
    
    func getTimelineEndDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        handler(NSDate(timeIntervalSinceNow: (60 * 60 * 1)))
    }
    
    
    // MARK: - Timeline Population
    
    
    
    func getTimelineEntries(for complication: CLKComplication, before date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries prior to the given date
        handler(nil)
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries after to the given date
        handler(nil)
    }
    
    // MARK: - Placeholder Templates
    
    
   
    
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
            // This method will be called once per supported complication, and the results will be cached
            
            var template: CLKComplicationTemplate? = nil
            switch complication.family {
            case .modularSmall:
                template = nil
            case .modularLarge:
                template = nil
            case .utilitarianSmall:
                template = nil
            case .utilitarianLarge:
                template = nil
            case .circularSmall:
    //            let modularTemplate = CLKComplicationTemplateCircularSmallRingText()
    //            modularTemplate.textProvider = CLKSimpleTextProvider(text: "25")
    //            modularTemplate.fillFraction = 0.7
    //            modularTemplate.ringStyle = CLKComplicationRingStyle.closed
    //            template = modularTemplate
                template = nil
            case .utilitarianSmallFlat:
                template = nil
            case .extraLarge:
                template = nil
            case .graphicCorner:
                template = nil
            case .graphicBezel:
                template = nil
            case .graphicCircular:
                let circularTemplate = CLKComplicationTemplateGraphicCircularClosedGaugeText()
                circularTemplate.centerTextProvider = CLKSimpleTextProvider(text: "10")
                circularTemplate.gaugeProvider = CLKSimpleGaugeProvider(style: .ring, gaugeColor: .blue, fillFraction: 0.7)
                template = circularTemplate
            case .graphicRectangular:
                template = nil
            @unknown default:
                template = nil
            }
            handler(template)
        }
    
}
