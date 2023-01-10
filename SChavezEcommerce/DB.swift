//
//  DB.swift
//  SChavezEcommerce
//
//  Created by MacbookMBA10 on 04/01/23.
//

import Foundation
import SQLite3

class DB{
    let Path: String = "Document.SChavezEcommerce.sql"
    var db: OpaquePointer? = nil
    
    init(){
        OpenConexion()
    }
    
    func OpenConexion(){
        let FilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathExtension(self.Path)
        let db = sqlite3_open (FilePath.path,&db)
        var opaquepointer: OpaquePointer? = nil
        if db == SQLITE_OK{
            print("Conexion Correcta")
            print(FilePath)
        }else{
            print("Error al conectar con la BD")
        }
    }
}

