//
//  ContactoController.swift
//  NRF_Actividad02
//
//  Created by usuario on 1/8/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit
import ContactsUI

class ContactoController: UIViewController {
    
    
    
    
    @IBOutlet weak var tblContactos: UITableView!

    var breeds = ["A": ["Alberto"], "B": ["Bereniuce"], "C": ["Carlos", "Claudia"], "F": ["Francisco"]]
    
    struct Objects {
        var sectionName : String!
        var sectionObjects : [String]!
    }
    
    var objectArray = [Objects]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblContactos.dataSource = self
        tblContactos.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        
        
        // SORTING [SINCE A DICTIONARY IS AN UNSORTED LIST]
        let sortedBreeds = breeds.sorted(by: { $0.0 < $1.0 })
        for (key, value) in sortedBreeds {
            print("\(key) -> \(value)")
            objectArray.append(Objects(sectionName: key, sectionObjects: value))
        }
    }
}

extension ContactoController:  UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return objectArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectArray[section].sectionObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = objectArray[indexPath.section].sectionObjects[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objectArray[section].sectionName
    }
}
