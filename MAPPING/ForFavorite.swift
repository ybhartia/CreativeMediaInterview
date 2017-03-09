//
//  ViewControllerForFavorite.swift
//  MAPPING
//
//  Created by yash bhartia on 3/3/17.
//  Copyright © 2017 CreativeMedia. All rights reserved.
//

import UIKit
import SwiftyJSON
import GoogleMaps
import GooglePlaces

class ViewControllerForFavorite: UIViewController {
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("In Favorite")
//        
//        let urlToRequest = "https://maps.googleapis.com/maps/api/directions/json?origin=Boston,MA&destination=Concord,MA&key=AIzaSyCj7KDLr-eiWmghFqWfbHtspCf0nWeKWeQ"

        
//        var urlString = "http://maps.google.com/maps?"
//        urlString += "saddr=25,55"
//        urlString += "&daddr=26,55"
//        print(urlString)
//        let url = URL(string: urlString)!
//          UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
        
//        
//        let urlToRequest = "https://mobile.ucdavis.edu/locations/"
//        let requestURL: NSURL = NSURL(string: urlToRequest)!
//        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL as URL)
//        
//        let session = URLSession.shared
//        
//        let task = session.dataTask(with: urlRequest as URLRequest) {
//            (lata, response, error) -> Void in
//            
//            //let httpResponse = response as! HTTPURLResponse
//            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
//            
//           // let statusCode = httpResponse.statusCode
//            
//            if (statusCode == 200)
//            {
//                print("Everyone is fine, file downloaded successfully.")
//            }
//            do{
//            let json = try JSONSerialization.jsonObject(with: lata!, options:.allowFragments)
//                print(json)
//            }catch {
//                print("Error with Json: \(error)")
//            }
//        }
//        task.resume()
       
        
        
        
//        var data: NSData? = getJSON(urlToRequest: "https://mobile.ucdavis.edu/locations/")
//        var data2: NSArray? = parseJSON(inputData: data!)
//        print(data2)
//    }
//
//    func getJSON(urlToRequest: String) -> NSData{
//        do
//        {
//            return try NSData(contentsOf: NSURL(string: urlToRequest) as! URL)
//        }catch{
//            print("error1")
//        }
//        var data: NSData? = nil
//        return data!
//    }
//    
//    func parseJSON(inputData: NSData) -> NSArray{
//        do
//        {
//            let boardsDictionary: NSArray = try JSONSerialization.jsonObject(with: inputData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
//            return boardsDictionary
//        }catch{
//            print("error1")
//        }
//        var data: NSArray? = nil
//        return data!
    }
    
}
