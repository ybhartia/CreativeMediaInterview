//
//  ViewControllerHouse.swift
//  MAPPING
//
//  Created by yash bhartia on 2/2/17.
//  Copyright © 2017 CreativeMedia. All rights reserved.
///Users/yashbhartia/Desktop/XCODE/MAPPING/MAPPING/ViewControllerBuilding.swift

import UIKit
import SwiftyJSON
import GoogleMaps

class ViewControllerHouse: UITableViewController {

    var stringPassed = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        let readableJSON = parseJSON()
        return readableJSON[1]["locations"].count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let readableJSON = parseJSON()
        
        let label = readableJSON[1]["locations"][indexPath.row]["name"].stringValue
        
        cell.textLabel?.text = label
        
        return cell
    }

    
    func parseJSON() -> JSON
    {
        let path = Bundle.main.path(forResource: "jsonFile", ofType: "json")
        let jsonData : NSData = NSData(contentsOfFile: path!) as NSData!
        let readableJSON = JSON(data: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers ,error: nil)
        
        return readableJSON
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let readableJSON = parseJSON()
        print(readableJSON[1]["locations"][indexPath.row]["name"].stringValue)
        
        let lat = readableJSON[1]["locations"][indexPath.row]["lat"].doubleValue

        let long = readableJSON[1]["locations"][indexPath.row]["lng"].doubleValue
                
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 16.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        marker.title = readableJSON[1]["locations"][indexPath.row]["name"].stringValue
        marker.snippet = readableJSON[1]["locations"][indexPath.row]["abbr"].stringValue
        marker.map = mapView
        
        
        
    }

    

    
}
