//
//  ViewController.swift
//  MAPPING
//
//  Created by yash bhartia on 1/29/17.
//  Copyright © 2017 CreativeMedia. All rights reserved.
//

import UIKit
import SwiftyJSON
import GoogleMaps
import CoreData
//import RealmSwift
import Alamofire

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        
        URLSession(configuration: .default).dataTask(with: URL(string: "https://mobile.ucdavis.edu/locations")!) { data, response, error in
            let json = JSON(data: data!)
            
        print (json[1]["locations"][1]["name"][1])
            
//      DispatchQueue.main.async {
//                
//            }
        }
    }
    
    
    @IBAction func Sender(_ sender: Any)
    {
        let readableJSON = parseJSON()
        for i in 0...4
        {
            for j in 0...readableJSON[i]["locations"].count
            {
                if(myTextField.text != "")
                {
                    
                    if( myTextField.text == readableJSON[i]["locations"][j]["name"].stringValue)
                    {
                        print("Found")
                        let myVC = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
                        myVC.i = i
                        myVC.j = j
                        navigationController?.pushViewController(myVC, animated: true)
                    }
                }
            }
        }
    }
    
//    @IBAction func SSR(_ sender: Any)
//    {
//        let myVC = storyboard?.instantiateViewController(withIdentifier: "ViewControllerBuilding") as! ViewControllerBuilding
//        myVC.stringPassed = "S. & S. Resources"
//        myVC.Option = 0
//        navigationController?.pushViewController(myVC, animated: true)
//    }
//    
//    @IBAction func House(_ sender: Any)
//    {
//        let myVC = storyboard?.instantiateViewController(withIdentifier: "ViewControllerBuilding") as! ViewControllerBuilding
//        myVC.stringPassed = "Housing and Dining"
//        myVC.Option = 1
//        navigationController?.pushViewController(myVC, animated: true)
//        
//    }
//    @IBAction func POI(_ sender: Any)
//    {
//        let myVC = storyboard?.instantiateViewController(withIdentifier: "ViewControllerBuilding") as! ViewControllerBuilding
//        myVC.stringPassed = "Places Of Interest"
//        myVC.Option = 2
//        navigationController?.pushViewController(myVC, animated: true)
//    }
//    
//    @IBAction func Rec(_ sender: Any)
//    {
//        let myVC = storyboard?.instantiateViewController(withIdentifier: "ViewControllerBuilding") as! ViewControllerBuilding
//        myVC.stringPassed = "Recreation"
//        myVC.Option = 3
//        navigationController?.pushViewController(myVC, animated: true)
//    }
//    
//    @IBAction func Buildings(_ sender: Any)
//    {
//        let myVC = storyboard?.instantiateViewController(withIdentifier: "ViewControllerBuilding") as! ViewControllerBuilding
//        myVC.stringPassed = "Building"
//        myVC.Option = 4
//        navigationController?.pushViewController(myVC, animated: true)
//    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let readableJSON = parseJSON()
        print(readableJSON.count)
        return readableJSON.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let readableJSON = parseJSON()
        let label = readableJSON[indexPath.row]["name"].stringValue
        print(label)
        cell.textLabel?.text = label
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        let readableJSON = parseJSON()
        
        let myVC = storyboard?.instantiateViewController(withIdentifier: "ViewControllerBuilding") as! ViewControllerBuilding
        myVC.stringPassed = readableJSON[indexPath.row]["name"].stringValue
        myVC.Option = indexPath.row
        navigationController?.pushViewController(myVC, animated: true)
        
    }
    
    
    func parseJSON() -> JSON
    {
        let path = Bundle.main.path(forResource: "jsonFile", ofType: "json")
        let jsonData : NSData = NSData(contentsOfFile: path!) as NSData!
        let readableJSON = JSON(data: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers ,error: nil)
        
        return readableJSON
    }
    
}

