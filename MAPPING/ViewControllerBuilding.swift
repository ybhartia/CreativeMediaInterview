//
//  ViewControllerBuilding.swift
//  MAPPING
//
//  Created by yash bhartia on 2/2/17.
//  Copyright © 2017 CreativeMedia. All rights reserved.
//

import UIKit
import SwiftyJSON
import GoogleMaps

class ViewControllerBuilding: UIViewController , UITableViewDelegate, UITableViewDataSource
{

    var stringPassed = ""
    var Option = Int()
    @IBOutlet weak var Heading: UILabel!
    
    func parseJSON() -> JSON
    {
        let path = Bundle.main.path(forResource: "jsonFile", ofType: "json")
        let jsonData : NSData = NSData(contentsOfFile: path!) as NSData!
        let readableJSON = JSON(data: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers ,error: nil)
        
        return readableJSON
    }

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        Heading.text = stringPassed
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let readableJSON = parseJSON()
     
        return readableJSON[Option]["locations"].count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let readableJSON = parseJSON()
        let label = readableJSON[Option]["locations"][indexPath.row]["name"].stringValue
        
        cell.textLabel?.text = label
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let readableJSON = parseJSON()
        let myVC = storyboard?.instantiateViewController(withIdentifier: "FinalMapFromCategories") as! FinalMapFromCategories
        
        myVC.lat = readableJSON[Option]["locations"][indexPath.row]["lat"].doubleValue
        myVC.long = readableJSON[Option]["locations"][indexPath.row]["lng"].doubleValue
        myVC.Tittle = readableJSON[Option]["locations"][indexPath.row]["name"].stringValue
        myVC.Snippet = readableJSON[Option]["locations"][indexPath.row]["abbr"].stringValue
        
        navigationController?.pushViewController(myVC, animated: true)
    }

    
    
    
}
