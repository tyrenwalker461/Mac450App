//
//  ViewController.swift
//  MacApp450
//
//  Created by Tyren Walker on 4/4/22.
//

import Cocoa
import PythonKit
import Alamofire


class ThirdPage: NSViewController,NSTextFieldDelegate {
    var passed1 = String()
    var passed2 = String()
    var passed3 = String()
    var passed4 = String()
    var passed5 = String()
    var passed6 = String()
    var passed7 = String()
    var passed8 = String()
    
    var time1 = Timer()
    var time2 = Timer()
    var time3 = Timer()
    var time4 = Timer()
    var time5 = Timer()
   
    @IBOutlet weak var trackingNum: NSTextField!
    
    @IBOutlet weak var displayOne: NSTextField!
    
    @IBOutlet weak var display1: NSTextField!
    
    @IBOutlet weak var displayTwo: NSTextField!
    
    @IBOutlet weak var display2: NSTextField!
    
    @IBOutlet weak var displayThree: NSTextField!
    
    @IBOutlet weak var display3: NSTextField!
    
    @IBOutlet weak var displayFour: NSTextField!
    
    @IBOutlet weak var display4: NSTextField!
    
    @IBOutlet weak var loc1: NSTextField!
    
    @IBOutlet weak var loc2: NSTextField!
    
    @IBOutlet weak var loc3: NSTextField!
    
    @IBOutlet weak var loc4: NSTextField!
    
    @IBOutlet weak var dateOne: NSTextField!
    @IBOutlet weak var dateTwo: NSTextField!
    @IBOutlet weak var dateThree: NSTextField!
    @IBOutlet weak var dateFour: NSTextField!
    
    override func viewDidLoad() {
    super.viewDidLoad()
       
        time1 = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(printTime1), userInfo: nil, repeats: true)
        time2 = Timer.scheduledTimer(timeInterval: 8.0, target: self, selector: #selector(printTime2), userInfo: nil, repeats: true)
       
        time3 = Timer.scheduledTimer(timeInterval: 8.0, target: self, selector: #selector(printTime2), userInfo: nil, repeats: true)
        time4 = Timer.scheduledTimer(timeInterval: 8.0, target: self, selector: #selector(printTime2), userInfo: nil, repeats: true)
        time5 = Timer.scheduledTimer(timeInterval: 8.0, target: self, selector: #selector(printTime2), userInfo: nil, repeats: true)
          
        
        //start of displaying products and quanitites
        let passed1 = SecondPage.MyVariables2.string1
        displayOne.stringValue = passed1
    
        let passed2 = SecondPage.MyVariables2.string5
        display1.stringValue = passed2
        
        let passed3 = SecondPage.MyVariables2.string2
        displayTwo.stringValue = passed3
        
        let passed4 = SecondPage.MyVariables2.string6
        display2.stringValue = passed4
        
        let passed5 = SecondPage.MyVariables2.string3
        displayThree.stringValue = passed5
    
        let passed6 = SecondPage.MyVariables2.string7
        display3.stringValue = passed6
        
        let passed7 = SecondPage.MyVariables2.string4
        displayFour.stringValue = passed7
        
        let passed8 = SecondPage.MyVariables2.string8
        display4.stringValue = passed8
        
        //end of displaying products and quantities
        
        trackingNum.stringValue = String(Int.random(in: 20000..<1000000))
        
        let place1 = Int.random(in: 1..<4)
        let place2 = Int.random(in: 1..<4)
        let place3 = Int.random(in: 1..<4)
        
        if place1 == 1
        {
            loc1.stringValue = "Europe"
            dateOne.stringValue = "5/17"
        }
        else if place1 == 2
        {
            loc1.stringValue = "Asia"
            dateOne.stringValue = "5/22"
        }
        else if place1 == 3
        {
            loc1.stringValue = "China"
            dateOne.stringValue = "5/22"
        }
        else if place1 == 4
        {
            loc1.stringValue = "Japan"
            dateOne.stringValue = "5/22"
        }
        else
        {
            loc1.stringValue = "Africa"
            dateOne.stringValue = "5/22"
        }
        
        if place2 == 1
        {
            loc2.stringValue = "Europe"
            dateTwo.stringValue = "5/17"
        }
        else if place2 == 2
        {
            loc2.stringValue = "Asia"
            dateTwo.stringValue = "5/22"
        }
        else if place2 == 3
        {
            loc2.stringValue = "China"
            dateTwo.stringValue = "5/22"
        }
        else if place2 == 4
        {
            loc2.stringValue = "Japan"
            dateTwo.stringValue = "5/22"
        }
        else
        {
            loc2.stringValue = "Africa"
            dateTwo.stringValue = "5/22"
        }
        
        if place3 == 1
        {
            loc3.stringValue = "Europe"
            dateThree.stringValue = "5/17"
        }
        else if place3 == 2
        {
            loc3.stringValue = "Asia"
            dateThree.stringValue = "5/22"
        }
        else if place3 == 3
        {
            loc3.stringValue = "China"
            dateThree.stringValue = "5/22"
        }
        else if place3 == 4
        {
            loc3.stringValue = "Japan"
            dateThree.stringValue = "5/22"
        }
        else
        {
            loc3.stringValue = "Africa"
            dateThree.stringValue = "5/22"
        }
        
    }
    
    @objc func printTime1() {
        loc1.stringValue="America"
        loc2.stringValue="America"
        loc3.stringValue="America"
        time1.invalidate()
       }

    @objc func printTime2() {
        loc1.stringValue="Delivered"
        loc2.stringValue="Delivered"
        loc3.stringValue="Delivered"
        time2.invalidate()
       }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

