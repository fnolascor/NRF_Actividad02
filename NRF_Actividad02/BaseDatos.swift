//
//  BaseDatos.swift
//  NRF_Actividad02
//
//  Created by usuario on 1/8/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct BaseDatos
{
    var lstPersonas = [PersonaBD]()
    
    init()
    {
//        lstPersonas.append(frank)
//        lstPersonas.append(ray)
//        lstPersonas.append(jhon)
//        lstPersonas.append(mike)
        
       cargaPersonas()
        
    }
    
    mutating func cargaPersonas()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
//
        var user = PersonaBD(context: context)
        user.nombreCompleto = "Francisco Nolasco Reyes"
        user.fechaNacimiento = "09/06/1989"
        user.domicilio = "Ocaso 43, Insurgentes Cuicuilco, CDMX"
        user.correoElectronico = "nolascorf@gmail.com"
        user.parentesco = "Amigo"

        appDelegate.saveContext()

        user = PersonaBD(context: context)
        user.nombreCompleto = "Raymundo Jesús Sánchez Murillo"
        user.fechaNacimiento = "10/08/1990"
        user.domicilio = "Ocaso 43, Insurgentes Cuicuilco, CDMX"
        user.correoElectronico = "rjsanchez@gmail.com"
        user.parentesco = "Amigo"

        appDelegate.saveContext()

        user = PersonaBD(context: context)
        user.nombreCompleto = "Jonatan Rebolledo Sánchez"
        user.fechaNacimiento = "25/05/1990"
        user.domicilio = "Ocaso 43, Insurgentes Cuicuilco, CDMX"
        user.correoElectronico = "jhonysanxlatino@gmail.com"
        user.parentesco = "Conocido"

        appDelegate.saveContext()

        user = PersonaBD(context: context)
        user.nombreCompleto = "Miguel Osbaldo Gallardo Toledo"
        user.fechaNacimiento = "25/07/1991"
        user.domicilio = "Ocaso 43, Insurgentes Cuicuilco, CDMX"
        user.correoElectronico = "mosbald91@gmail.com"
        user.parentesco = "Amigo"

        appDelegate.saveContext()
        
        user = PersonaBD(context: context)
        user.nombreCompleto = "Rogelio López Gómez"
        user.fechaNacimiento = "25/07/1991"
        user.domicilio = "Ocaso 43, Insurgentes Cuicuilco, CDMX"
        user.correoElectronico = "mosbald91@gmail.com"
        user.parentesco = "Amigo"
        
        appDelegate.saveContext()
        
//        let usersFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "PersonaBD")
//
//        do {
//            let fetchedUsers = try context.fetch(usersFetch) as! [PersonaBD]
//
//            //print(type(of:fetchedUsers))
//            for item in fetchedUsers{
//                lstPersonas.append(item)
//            }
//
//
//        } catch {
//            fatalError("Failed to fetch users: \(error)")
//        }
        
    }
    
//    let frank: Persona = Persona.init(nombreCompleto: "Francisco Nolasco Reyes", fechaNacimiento: "09/06/1989", domicilio: "Ocaso 43, Insurgentes Cuicuilco, CDMX", correoElectrónico: "nolascorf@gmail.com", parentesco: Parentesco.Amigo)
//
////    let ray: Persona = Persona.init(nombreCompleto: "Raymundo Jesús Sánchez Murillo", fechaNacimiento: "10/08/1990", domicilio: "Ocaso 43, Insurgentes Cuicuilco, CDMX", correoElectrónico: "rjsanchez@gmail.com")
//
//    let ray: Persona = Persona.init(nombreCompleto: "Raymundo Jesús Sánchez Murillo", fechaNacimiento: "13/01/1990", domicilio: "Ocaso 43, Insurgentes Cuicuilco, CDMX", correoElectrónico: "rjsanchez@gmail.com", parentesco: Parentesco.Oficina)
//
//    let jhon: Persona = Persona.init(nombreCompleto: "Jonatan Rebolledo Sánchez", fechaNacimiento: "24/05/1989", domicilio: "Ocaso 43, Insurgentes Cuicuilco, CDMX", correoElectrónico: "jhonysanxlatino@gmail.com", parentesco: Parentesco.Ninguno)
//
//    let mike: Persona = Persona.init(nombreCompleto: "Miguel Osbaldo Gallardo Toledo", fechaNacimiento: "25/07/1991", domicilio: "Ocaso 43, Insurgentes Cuicuilco, CDMX", correoElectrónico: "mosbald91@gmail.com", parentesco: Parentesco.Amigo)
//
//    func obtieneInfoPersona(persona: Persona) -> Persona
//    {
//        for p in lstPersonas
//        {
//            if(persona.nombreCompleto == p.nombreCompleto)
//            {
//                return p
//            }
//        }
//        return persona
//    }
}

