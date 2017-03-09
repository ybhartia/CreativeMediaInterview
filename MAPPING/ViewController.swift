
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
    }
    
    
    @IBAction func Sender(_ sender: Any)
    {
        let readableJSON = parseJSON()
        for i in 0...readableJSON.count
        {
            for j in 0...readableJSON[i]["locations"].count
            {
                if(myTextField.text != "")
                {
                    if( myTextField.text == readableJSON[i]["locations"][j]["name"].stringValue)
                    {
                        let myVC = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
                        myVC.i = i
                        myVC.j = j
                        navigationController?.pushViewController(myVC, animated: true)
                    }
                }
            }
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let readableJSON = parseJSON()
        return readableJSON.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let readableJSON = parseJSON()
        let label = readableJSON[indexPath.row]["name"].stringValue
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

