//
//  MyPurchaseViewController.swift
//  Grocer
//
//  Created by linChunbin on 12/4/18.
//  Copyright © 2018 it4500. All rights reserved.
//

import UIKit

class MyPurchaseViewController: UIViewController {
    
    var myItems: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for item in myItems{
            print(item.getName())
            print(item.getPrice())
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
