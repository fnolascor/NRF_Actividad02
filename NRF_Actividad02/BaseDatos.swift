//
//  BaseDatos.swift
//  NRF_Actividad02
//
//  Created by usuario on 1/8/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import Foundation

struct BaseDatos
{
    var lstPersonas = [Persona]()
    
    init()
    {
        lstPersonas.append(frank)
        lstPersonas.append(ray)
        lstPersonas.append(jhon)
    }
    
    let frank: Persona = Persona.init(nombreCompleto: "Francisco Nolasco Reyes", fechaNacimiento: "09/06/1989", domicilio: "Ocaso 43, Insurgentes Cuicuilco, CDMX", correoElectrónico: "nolascorf@gmail.com")
    
    let ray: Persona = Persona.init(nombreCompleto: "Raymundo Jesús Sánchez", fechaNacimiento: "10/11/1990", domicilio: "Ocaso 43, Insurgentes Cuicuilco, CDMX", correoElectrónico: "rjsanchez@gmail.com")
    
    let jhon: Persona = Persona.init(nombreCompleto: "Jonatan Rebolledo Sánchez", fechaNacimiento: "24/05/1989", domicilio: "Ocaso 43, Insurgentes Cuicuilco, CDMX", correoElectrónico: "jhonysanxlatino@gmail.com")
    
    let mike: Persona = Persona.init(nombreCompleto: "Miguel Osbaldo Gallardo Toledo", fechaNacimiento: "25/07/1991", domicilio: "Ocaso 43, Insurgentes Cuicuilco, CDMX", correoElectrónico: "mosbald91@gmail.com")
}

