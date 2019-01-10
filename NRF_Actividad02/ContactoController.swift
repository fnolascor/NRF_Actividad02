//
//  ContactoController.swift
//  NRF_Actividad02
//
//  Created by usuario on 1/8/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit
import CoreData

class ContactoController: UIViewController {
    @IBOutlet weak var tblContactos: UITableView!

    var contactos: Dictionary<String, Array<PersonaBD>> = [:]
    //Dictionary<String, Array<String>>
    
    //var contactos = [ "R":[ "Raymundo Jesús Sánchez Murillo"], "F": ["Francisco Nolasco Reyes"]]
    
    struct Objects {
        var sectionName : String!
        var sectionObjects : [PersonaBD]!
    }
    
    var personaSeleccionada: PersonaBD?
    var objectArray = [Objects]()
    var base: BaseDatos?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblContactos.dataSource = self
        tblContactos.delegate = self
        tblContactos.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        formatoContactos()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        formatoContactos()
        tblContactos.reloadData()
    }
    
    func formatoContactos()
    {
        base = BaseDatos()
        let predicate = { (element: PersonaBD) in
            return element.nombreCompleto?.substring(from: 0, to: 1)
        }
        let dictionary = Dictionary(grouping: base!.lstPersonas, by: predicate)
        contactos = dictionary as! Dictionary<String, Array<PersonaBD>>
        
        //let sortedBreeds = contactos.sorted(by: { $0.0 < $1.0 })
        objectArray = [Objects]()
        for (key, value) in contactos {
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
        cell.textLabel?.text = objectArray[indexPath.section].sectionObjects[indexPath.row].nombreCompleto
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
        
        for persona in (base?.lstPersonas)!
        {
            if(persona.nombreCompleto == currentCell?.textLabel?.text)
            {
                self.personaSeleccionada = persona
            }
        }
        
        //self.personaSeleccionada = Persona(nombreCompleto: (currentCell?.textLabel?.text)!)
        performSegue(withIdentifier: "idContacto", sender: nil)
    }
    

}

extension String {
    func substring(from: Int, to: Int) -> String {
        let start = index(startIndex, offsetBy: from)
        let end = index(start, offsetBy: to - from)
        return String(self[start ..< end])
    }
}
