//
//  Departamento.swift
//  SChavezEcommerce
//
//  Created by MacbookMBA10 on 04/01/23.
//

import Foundation

struct Departamento{
    var IdDepartamento: Int
        var NombreDepartamento: String
        var IdArea: Area
    
    init(IdDepartamento: Int, NombreDepartamento: String, IdArea: Area) {
        self.IdDepartamento = IdDepartamento
        self.NombreDepartamento = NombreDepartamento
        self.IdArea = IdArea
    }
   /* init(){
        self.IdDepartamento = 0
        self.NombreDepartamento = ""
        self.IdArea = Area(IdArea: 0, Nombre: "")
    }*/
    
    }
