//
//  ViewController2.swift
//  MAPPING
//
//  Created by yash bhartia on 2/1/17.
//  Copyright © 2017 CreativeMedia. All rights reserved.
//

import UIKit
import SwiftyJSON
import GoogleMaps

class ViewController2: UIViewController
{
    var i = Int()
    var j = Int()


    override func viewDidLoad()
    {
        
        let readableJSON = parseJSON()
        let lat = readableJSON[i]["locations"][j]["lat"].doubleValue
        
        let long = readableJSON[i]["locations"][j]["lng"].doubleValue
        
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 16.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        marker.title = readableJSON[i]["locations"][j]["name"].stringValue
        marker.snippet = readableJSON[i]["locations"][j]["abbr"].stringValue
        marker.map = mapView
        super.viewDidLoad()
    }
    func parseJSON() -> JSON
    {
        let path = Bundle.main.path(forResource: "jsonFile", ofType: "json")
        let jsonData : NSData = NSData(contentsOfFile: path!) as NSData!
        let readableJSON = JSON(data: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers ,error: nil)
        
        return readableJSON
    }
}
