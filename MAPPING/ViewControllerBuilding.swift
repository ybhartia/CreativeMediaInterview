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

class ViewControllerBuilding: UIViewController , UITableViewDelegate, UITableViewDataSource{

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
        //print(Option)
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
        //print(readableJSON[Option]["locations"][indexPath.row]["name"].stringValue)
        
        let lat = readableJSON[Option]["locations"][indexPath.row]["lat"].doubleValue
        
        let long = readableJSON[Option]["locations"][indexPath.row]["lng"].doubleValue
        
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 16.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        marker.title = readableJSON[Option]["locations"][indexPath.row]["name"].stringValue
        marker.snippet = readableJSON[Option]["locations"][indexPath.row]["abbr"].stringValue
        marker.map = mapView
    }

    
    
    
}
