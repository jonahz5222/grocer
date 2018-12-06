//
//  PurchaseDetailViewController.swift
//  Grocer
//
//  Created by linChunbin on 11/8/18.
//  Copyright © 2018 it4500. All rights reserved.
//

import UIKit

class PurchaseDetailViewController: UIViewController {
    var purchase:Purchase?

    @IBOutlet weak var receiptImage: UIImageView!
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    
    @IBOutlet weak var purchaserImage: UIImageView!
    @IBOutlet weak var itemsTableView: UITableView!
    
    var items = [Item]()
    override func viewDidLoad() {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateField.text = dateFormatter.string(from: (purchase?.date)!)
        receiptImage.image = UIImage(data: (purchase?.receipt)!)
        titleField.text = purchase?.title ?? ""
        if let imageData = purchase?.getPurchaser()?.getPicture(){
            purchaserImage.image = UIImage(data: imageData)
        }
        else{
            purchaserImage.image = UIImage(named: "ProfileImage")
        }
        descriptionField.text = purchase?.getPurchaseDescription() ?? ""
        if let tempItems = purchase?.getItems(){
            items = tempItems
        }
        

        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func saveTapped(_ sender: Any) {
        print("save tapped")
        _ = navigationController?.popViewController(animated: true)

    }
}
extension PurchaseDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(items.count)
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell")!
        print("CELL FOR ROW AT")
        print(items)
        cell.textLabel?.text = items[indexPath.row].name
        cell.detailTextLabel?.text = String(items[indexPath.row].price)
        return cell
    }
    
}
