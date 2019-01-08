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

    var contactos = ["R": ["Raymundo Jesús Sánchez Murillo"], "F": ["Francisco Nolasco Reyes"], "M": ["Miguel Osbaldo Gallardo Toledo"], "J": ["Jonatan Rebolledo Sánchez"]]
    
    //var contactos = ["Raymundo Jesús Sánchez Murillo", "Francisco Nolasco Reyes","Miguel Osbaldo Gallardo Toledo", "Jonatan Rebolledo Sánchez"]
    
    struct Objects {
        var sectionName : String!
        var sectionObjects : [String]!
    }
    var personaSeleccionada: Persona?
    var objectArray = [Objects]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblContactos.dataSource = self
        tblContactos.delegate = self
        tblContactos.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        
        
        // SORTING [SINCE A DICTIONARY IS AN UNSORTED LIST]
        let sortedBreeds = contactos.sorted(by: { $0.0 < $1.0 })
        for (key, value) in sortedBreeds {
            print("\(key) -> \(value)")
            objectArray.append(Objects(sectionName: key, sectionObjects: value))
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let personaSelec = contactos[tblContactos.indexPathForSelectedRow]
        if segue.identifier == "idContacto"{
            if let vcd = segue.destination as? DescContactoController{
                vcd.contacto = self.personaSeleccionada
            }
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

extension ContactoController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let currentCell = tableView.cellForRow(at: indexPath)
        //personaSeleccionada = Persona.init(nombreCompleto: currentCell!.textLabel!.text!)
        self.personaSeleccionada = Persona(nombreCompleto: (currentCell?.textLabel?.text)!)
        performSegue(withIdentifier: "idContacto", sender: nil)
    }
    

}
