//
//  AddPageInterfaceController.swift
//  Countication WatchKit Extension
//
//  Created by Matt Luke on 11/18/19.
//  Copyright © 2019 MlukeApps. All rights reserved.
//

import WatchKit
import Foundation


protocol ModalItemChooserDelegate {
    func didSelectItem (t: NSString, m: String, d:String, y:String)
}

class AddPageInterfaceController: WKInterfaceController {
//    func didSelectItem() -> NSString {
//
//    }
    
    
    
    
    
    

//    weak var delegate : DisplayinterfaceControllerDelegate?
    
    @IBOutlet weak var monthPicker: WKInterfacePicker!
    @IBOutlet weak var dayPicker: WKInterfacePicker!
    @IBOutlet weak var yearPicker: WKInterfacePicker!
    
    var delegate: CountdownsInterfaceController?
    
    var monthPickerChoice = "1"
    var dayPickerChoice = "1"
    var yearPickerChoice = "2019"
    var title = NSString("Countdown")
    
    var dayList: [(String, String)] = [
    ("1st", "1"),
    ("2nd", "2"),
    ("3rd", "3"),
    ("4th", "4"),
    ("5th", "5"),
    ("6th", "6"),
    ("7th", "7"),
    ("8th", "8"),
    ("9th", "9"),
    ("10th", "10"),
    ("11th", "11"),
    ("12th", "12"),
    ("13th", "13"),
    ("14th", "14"),
    ("15th", "15"),
    ("16th", "16"),
    ("17th", "17"),
    ("18th", "18"),
    ("19th", "19"),
    ("20th", "20"),
    ("21th", "21"),
    ("22th", "22"),
    ("23th", "23"),
    ("24th", "24"),
    ("25th", "25"),
    ("26th", "26"),
    ("27th", "27"),
    ("28th", "28"),
    ("29th", "29"),
    ("30th", "30"),
    ("31th", "31"),]
    
    var monthList: [(String, String)] = [
    ("Jan.", "1"),
    ("Feb.", "2"),
    ("March", "3"),
    ("April", "4"),
    ("May", "5"),
    ("June", "6"),
    ("July", "7"),
    ("Aug.", "8"),
    ("Sept.", "9"),
    ("Oct.", "10"),
    ("Nov.", "11"),
    ("Dec.", "12"),]
    
    var yearList: [(String, String)] = [
    ("2019", "2019"),
    ("2020", "2020"),
    ("2021", "2021"),
    ("2022", "2022"),
    ("2023", "2023"),
    ("2024", "2024"),
    ("2025", "2025"),
    ("2026", "2026"),
    ("2027", "2027"),
    ("2028", "2028"),
    ("2029", "2029"),
    ("2030", "2030"),]
    
    
    func didSelectItem(itemSelected: String) {
        
    }
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        self.delegate = context as? CountdownsInterfaceController
        
        let dayItems: [WKPickerItem] = dayList.map {
            let dayItem = WKPickerItem()
            dayItem.caption = $0.0
            dayItem.title = $0.1
            return dayItem
        }
            
        let monthItems: [WKPickerItem] = monthList.map {
            let monthItem = WKPickerItem()
            monthItem.caption = $0.0
            monthItem.title = $0.1
            return monthItem
            
            }
        
        let yearItems: [WKPickerItem] = yearList.map {
            let yearItem = WKPickerItem()
            yearItem.caption = $0.0
            yearItem.title = $0.1
            return yearItem
        }
            
        dayPicker.setItems(dayItems)
        monthPicker.setItems(monthItems)
        yearPicker.setItems(yearItems)
            
        // Configure interface objects here.
    }
    
    
    @IBAction func addTitle(_ value: NSString?) {
        title = value ?? "Countdown"
    }
    
        
    @IBAction func addCountdownButton() {
        self.delegate?.didSelectItem(t: title, m: monthPickerChoice, d: dayPickerChoice, y: yearPickerChoice)
        self.dismiss()
    }
    
    
    @IBAction func monthPickerChanged(value: Int) {
        monthPickerChoice = (monthList[value].1)
        print(monthPickerChoice)
    }
    
    @IBAction func dayPickerChanged(value: Int) {
        dayPickerChoice = (dayList[value].1)
        print(dayPickerChoice)
    }

    @IBAction func yearPickerChanged(value: Int) {
        yearPickerChoice = (yearList[value].1)
        print(yearPickerChoice)
    }
    
}
