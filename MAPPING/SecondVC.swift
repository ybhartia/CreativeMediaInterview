//
//  SecondVC.swift
//  MAPPING
//
//  Created by yash bhartia on 2/4/17.
//  Copyright © 2017 CreativeMedia. All rights reserved.
//

import UIKit

class SecondVC: UIViewController
{

    @IBOutlet weak var myLabel: UILabel!
    var passedData: String!

    override func viewDidLoad()
    {
        print(passedData)
        super.viewDidLoad()
        myLabel.text = passedData

    }

}
