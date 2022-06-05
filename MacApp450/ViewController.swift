//
//  ViewController.swift
//  MacApp450
//
//  Created by Tyren Walker on 4/4/22.
//

import Cocoa
import PythonKit
import Alamofire

class ViewController: NSViewController {
  
    func  Hide(){
        sswitching.isHidden=true
    }
    
    func UnHide(){
        sswitching.isHidden=false
    }
    
    @IBOutlet weak var sswitching: NSButton!
    
    
    // button to switch to registration after page after approved verification
    @IBAction func switching(_ sender: NSButton)
    {
        
        if let controller = self.storyboard?.instantiateController(withIdentifier: "Firstpage") as? FirstPage
        {
        self.view.window?.contentViewController = controller
        }
    }
    
    @IBOutlet weak var result: NSTextField! //used to show machine learning response
    @IBOutlet weak var question1: NSTextField! //verification question # 1 text field
    @IBOutlet weak var question2: NSTextField! //verification question # 2 text field
    @IBOutlet weak var question3: NSTextField! //verification question # 3 text field
    @IBOutlet weak var submissionR: NSTextField!
    
    
    //Defined a constant that holds the URL for our web service
      let postrequest = "https://botbdb.000webhostapp.com/verify.php"
    
    //button to answer verification question, it calls the
    //machine learning function and blockchain function
    @IBAction func execute(_ sender: NSButton)
    {
        
        
        let parameters: Parameters=[
            "q1":question1.stringValue,
            "q2":question2.stringValue,
            "q3":question3.stringValue
                ]
        
Alamofire.request(postrequest, method: .post, parameters: parameters).responseJSON
    {
            response in
            //printing response
            print(response)
        }
        
        let sys = Python.import("sys")
        sys.path.append("/Users/bmoreliketyy/Downloads/") // path to your Python file's directory.
        let example = Python.import("example") // import the Python file.
        let ml  = example.machinelearning() // call the Python function.
        let change = ml as Any
        let response = String(describing: change)
        
        //lines 69-71 are removing some characters that were being displayed
        //for the ML score
        let remove = response.replacingOccurrences(of: "[", with: "", options: NSString.CompareOptions.literal, range: nil)
        let removee = remove.replacingOccurrences(of: ".", with: "", options: NSString.CompareOptions.literal, range: nil)
        let removeee = removee.replacingOccurrences(of: "]", with: "", options: NSString.CompareOptions.literal, range: nil)
        
        //display the score that the ML algo calculated
        result.stringValue = removeee
        
        let score = Int(removeee)
        if score! > 10
        {
            submissionR.stringValue = "You are eligible, please click proceed!"
            UnHide()
        }
        
        else{
            submissionR.stringValue = "Sorry, you are not eligible to ship with us"
        }
    
        

    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
        Hide()
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

