//
//  DescContactoController.swift
//  NRF_Actividad02
//
//  Created by usuario on 1/8/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit

class DescContactoController: UIViewController {
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var dpvFechaNacimiento: UIDatePicker!
    @IBOutlet weak var txtCorreoElectronico: UITextField!
    @IBOutlet weak var txtParentesco: UITextField!
    @IBOutlet weak var imgCumple: UIImageView!
    @IBOutlet weak var btnFelicitar: UIButton!
    
    @IBAction func btnFelicitarAhora(_ sender: UIButton) {
        let img = UIImage(named: "imgHB")
        let txt = "#HappyBirthday"
        let items = [img!,txt] as [Any]
        let avc = UIActivityViewController(activityItems: items, applicationActivities: nil)
        avc.excludedActivityTypes = [UIActivity.ActivityType.airDrop]
        present(avc, animated: true)
        {
            print("Compartido")
        }
    }
    
    
    var base: BaseDatos = BaseDatos()
    var contacto: Persona?
    var tempFechaCumpleaños: String?
    var tempFecha: Date?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        contacto = base.obtieneInfoPersona(persona: contacto!)
        
        
        txtNombre.text = contacto?.nombreCompleto
        txtCorreoElectronico.text = contacto?.correoElectrónico
        txtParentesco.text = contacto?.parentesco.rawValue
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        if dateFormatter.date(from: (contacto?.fechaNacimiento)!) != nil {
            dpvFechaNacimiento.date = dateFormatter.date(from: (contacto?.fechaNacimiento)!)!
            tempFechaCumpleaños = contacto?.fechaNacimiento
        }
        
        if(EsCumpleañosProximo(fecha: tempFechaCumpleaños!))
        {
            imgCumple.isHidden = false
            btnFelicitar.isHidden = false
        }
    }
    
    func EsCumpleañosProximo(fecha: String) -> Bool
    {
        let hoy: Date = Date.init()
        let mesActual = hoy.month
        let mes = fecha.substring(from: 3, to: 5)
        
        if(mesActual == mes)
        {
            let diaActual = Int(hoy.day)
            let dia = Int(fecha.substring(from: 0, to:2))
            var diasFaltantes = (diaActual! - dia!)
            
            if(diasFaltantes<0)
            {
                diasFaltantes = diasFaltantes * -1
            }
            
            if(diasFaltantes>=0 && diasFaltantes<6)
            {
                return true
            }
        }
        return false
    }
}

extension String {
    func substring(from: Int, to: Int) -> String {
        let start = index(startIndex, offsetBy: from)
        let end = index(start, offsetBy: to - from)
        return String(self[start ..< end])
    }
}

extension Date {
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        return dateFormatter.string(from: self)
    }
}

extension Date {
    var day: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: self)
    }
}
