//
//  ViewControllerSSR.swift
//  
//
//  Created by yash bhartia on 2/2/17.
//
//

import UIKit
import SwiftyJSON

class ViewControllerSSR: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        parseJSON()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func parseJSON()
    {
        let path = Bundle.main.path(forResource: "jsonFile", ofType: "json")
        let jsonData : NSData = NSData(contentsOfFile: path!) as NSData!
        var readableJSON = JSON(data: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers ,error: nil)
        
        print(readableJSON[0]["locations"].count)
        
        
    }
    
    
}
