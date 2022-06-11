//
//  ViewController.swift
//  MacApp450
//
//  Created by Tyren Walker on 4/4/22.
//

import Cocoa
import PythonKit
import Alamofire


class FirstPage: NSViewController,NSTextFieldDelegate {
    
    
    struct MyVariables {
        static var string1 = String()
        static var passing1 = String()
        
        static var string2 = String()
        static var passing2 = String()
    }
    
    @IBOutlet weak var textFieldUsername: NSTextField!

    @IBAction func createAccount(_ sender: NSButton) {
        
        //grabbing product names and quantities
        let transfer = textFieldUsername.stringValue
        MyVariables.passing1 = transfer
        MyVariables.string1 = MyVariables.passing1
        
        if let controller = self.storyboard?.instantiateController(withIdentifier: "Secondpage") as? SecondPage
        {
        self.view.window?.contentViewController = controller
        }
    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

