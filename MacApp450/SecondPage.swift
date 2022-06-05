//
//  ViewController.swift
//  MacApp450
//
//  Created by Tyren Walker on 4/4/22.
//

import Cocoa
import PythonKit
import Alamofire

class SecondPage: NSViewController,NSTextFieldDelegate  {
    
    struct MyVariables2 {
        static var string1 = String()
        static var passing1 = String()
        
        static var string2 = String()
        static var passing2 = String()
        
        static var string3 = String()
        static var passing3 = String()
        
        static var string4 = String()
        static var passing4 = String()
        
        static var string5 = String()
        static var passing5 = String()
        
        static var string6 = String()
        static var passing6 = String()
        
        static var string7 = String()
        static var passing7 = String()
        
        static var string8 = String()
        static var passing8 = String()
    }
    
    var passed = String()
    
    @IBOutlet weak var displayName: NSTextField!
    
    //start of products and quantities
    
    @IBOutlet weak var productOne: NSTextField!
    
    @IBOutlet weak var quanOne: NSTextField!
    
    @IBOutlet weak var productTwo: NSTextField!
    
    @IBOutlet weak var quanTwo: NSTextField!
    
    @IBOutlet weak var productThree: NSTextField!
    
    @IBOutlet weak var quanThree: NSTextField!
    
    @IBOutlet weak var productFour: NSTextField!
    
    @IBOutlet weak var quanFour: NSTextField!
    
    //end of products and quantities
    
    @IBOutlet weak var bcMessage: NSTextField!
    
    @IBOutlet weak var trackButton: NSButton!
   
    func  Hide(){
       trackButton.isHidden=true
    }
    
    func UnHide(){
        trackButton.isHidden=false
    }
    
    @IBAction func trackNow(_ sender: NSButton) {
         //start of transferring all products & quantity
        
        let transfer = productOne.stringValue
        MyVariables2.passing1 = transfer
        MyVariables2.string1 = MyVariables2.passing1
        
        let transfer2 = productTwo.stringValue
        MyVariables2.passing2 = transfer2
        MyVariables2.string2 = MyVariables2.passing2
        
        let transfer3 = productThree.stringValue
        MyVariables2.passing3 = transfer3
        MyVariables2.string3 = MyVariables2.passing3
        
        let transfer4 = productFour.stringValue
        MyVariables2.passing4 = transfer4
        MyVariables2.string4 = MyVariables2.passing4
        
        let transfer5 = quanOne.stringValue
        MyVariables2.passing5 = transfer5
        MyVariables2.string5 = MyVariables2.passing5
        
        let transfer6 = quanTwo.stringValue
        MyVariables2.passing6 = transfer6
        MyVariables2.string6 = MyVariables2.passing6
        
        let transfer7 = quanThree.stringValue
        MyVariables2.passing7 = transfer7
        MyVariables2.string7 = MyVariables2.passing7
        
        let transfer8 = quanFour.stringValue
        MyVariables2.passing8 = transfer8
        MyVariables2.string8 = MyVariables2.passing8
    
        //end of tranferring all products & quantity
        if let controller = self.storyboard?.instantiateController(withIdentifier: "Thirdpage") as? ThirdPage
               {
               self.view.window?.contentViewController = controller
               }
    }
    
    let postrequest = "https://botbdb.000webhostapp.com/verify.php"
    
    
    @IBAction func shipIt(_ sender: NSButton) {
        
        let parameters: Parameters=[
            "q1":productOne.stringValue,
            "q2":productTwo.stringValue,
            "q3":productThree.stringValue
                ]
        
Alamofire.request(postrequest, method: .post, parameters: parameters).responseJSON
    {
            response in
            //printing response
            print(response)
        }
        
        //running machine learning program
        let sys = Python.import("sys")
        sys.path.append("/Users/bmoreliketyy/Downloads/") // path to your Python file's directory.
        let example = Python.import("ProductChecking") // import the Python file.
        let ml  = example.machinelearning() // call the Python function.
        let change = ml as Any
        let response = String(describing: change)

        
        //for the ML score
        let remove = response.replacingOccurrences(of: "[", with: "", options: NSString.CompareOptions.literal, range: nil)
        let removee = remove.replacingOccurrences(of: "]", with: "", options: NSString.CompareOptions.literal, range: nil)
    
        let eligible = Int(removee)
        if eligible! > 0
        {
            UnHide()
            //running blockchain program
            let runblock = example.blockchain() // call the Python function.
            let mb = runblock as Any
            let response2 = String(describing: mb)
            bcMessage.stringValue = response2
        }
        else{
            bcMessage.stringValue = "There is an unaccepted quality of one or more products"
        }


    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
       Hide()
        let passed = FirstPage.MyVariables.string1
        displayName.stringValue = passed
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

