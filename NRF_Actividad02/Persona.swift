//
//  Persona.swift
//  NRF_Actividad02
//
//  Created by usuario on 1/8/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import Foundation

enum Parentesco: String {
    case Familiar = "Familiar"
    case Amigo = "Amigo"
    case Conocido = "Conocido"
    case Oficina = "Oficina"
    case Ninguno = "Ninguno"
}

class Persona
{
    var nombreCompleto: String = ""
    var fechaNacimiento: String = ""
    var edad: Int = 0
    var domicilio: String = ""
    var correoElectrónico: String = ""
    var parentesco: Parentesco = Parentesco.Ninguno
    
    init(nombreCompleto: String, fechaNacimiento: String, domicilio: String, correoElectrónico: String, parentesco: Parentesco)
    {
        self.nombreCompleto = nombreCompleto
        self.fechaNacimiento = fechaNacimiento
        self.domicilio = domicilio
        self.correoElectrónico = correoElectrónico
        self.edad = FuncionesGenericas.init().CalcularEdad(fechaNacimiento: fechaNacimiento)
        self.parentesco = parentesco
    }
    
    init(nombreCompleto: String)
    {
        self.nombreCompleto = nombreCompleto
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
