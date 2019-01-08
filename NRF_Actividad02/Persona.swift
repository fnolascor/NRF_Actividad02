//
//  Persona.swift
//  NRF_Actividad02
//
//  Created by usuario on 1/8/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import Foundation

class Persona
{
    var nombreCompleto: String = ""
    var fechaNacimiento: String = ""
    var edad: Int = 0
    var domicilio: String = ""
    var correoElectrónico: String = ""
    
    init(nombreCompleto: String, fechaNacimiento: String, domicilio: String, correoElectrónico: String)
    {
        self.nombreCompleto = nombreCompleto
        self.fechaNacimiento = fechaNacimiento
        self.domicilio = domicilio
        self.correoElectrónico = correoElectrónico
        self.edad = FuncionesGenericas.init().CalcularEdad(fechaNacimiento: fechaNacimiento)
    }
    
    func EdadPersona(fechaNacimiento: String) -> Int{
        var tempFechaNacimiento = fechaNacimiento
        for _ in 0...5
        {
            tempFechaNacimiento.remove(at: tempFechaNacimiento.startIndex)
        }
        
        let thisYear = 2019
        
        return thisYear - Int(tempFechaNacimiento)!
    }
}

struct FuncionesGenericas
{
    func CalcularEdad(fechaNacimiento: String) -> Int {
        var tempFechaNacimiento = fechaNacimiento
        for _ in 0...5
        {
            tempFechaNacimiento.remove(at: tempFechaNacimiento.startIndex)
        }
        
        let thisYear = 2019
        
        return thisYear - Int(tempFechaNacimiento)!
    }
}
