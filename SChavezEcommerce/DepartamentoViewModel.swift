//
//  DepartamentoViewModel.swift
//  SChavezEcommerce
//
//  Created by MacbookMBA10 on 05/01/23.
//

import Foundation
import SQLite3

class DepartamentoViewModel{
    
    let DepartamentoModel: Departamento? = nil
    
    func Add(departamento: Departamento)-> Result { //Funcion Agregar
        var result = Result()
        let context = DB.init()
        //let db = DB.init()
        let query = "INSERT INTO Departamento(Nombre,IdArea)VALUES(?,?)"
        var statement : OpaquePointer? = nil
        
        do{
            if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                sqlite3_bind_text(statement, 1, (departamento.NombreDepartamento as NSString).utf8String, -1, nil)
                sqlite3_bind_int(statement, 2, (departamento.IdArea.IdArea as NSNumber).int32Value)
               
                if sqlite3_step(statement) == SQLITE_DONE{
                    result.Correct = true
                }else{
                    result.Correct = false
                }
                print(statement)
                print("Departamento agregado correctamente")
                print(departamento.NombreDepartamento)
                print(departamento.IdArea.IdArea)
               
            }
        } catch let error {
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
            print("Error no se pudo agregar el departamento")
            
        }
        return result
    }
    
    func Update(departamento: Departamento)-> Result{ //Funcion Actualizar?
        var result = Result()
        let context = DB.init()
        let query = "UPDATE Departamento SET Nombre=?,IdArea=? WHERE IdDepartamento=\(departamento.IdDepartamento)"
        //NSString *sqlString = @"UPDATE field SET name=?, type=?, state=? where _id=?";
        var statement : OpaquePointer? = nil
        
        do{
            if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
               // sqlite3_bind_int(statement, 0, (producto.IdProducto as NSNumber).int32Value)
                sqlite3_bind_text(statement, 1, (departamento.NombreDepartamento as NSString).utf8String, -1, nil)
                sqlite3_bind_int(statement, 2, (departamento.IdArea.IdArea as! NSNumber).int32Value)
              
               
                
                print("Departamento Actualizado correctamente")
               // print(producto.IdProducto)
               
                
                if (sqlite3_step(statement) > 0)
                                   {
                                       print("Correcto")
                                   }
                                   else
                                   {
                                       result.Correct = false;
                                       result.ErrorMessage = "Error al Actualizar Departamento";
                                   }
                
                
                if sqlite3_step(statement) == SQLITE_DONE{
                    result.Correct = true
                } else{
                    result.Correct = false
                }
                
            }
        } catch let error {
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
            print("Error al actualizar registro")
        }
        return result
    }
    
    
    func Delete(departamento: Departamento) -> Result{ //Funcion Eliminar
        var result = Result()
        let context = DB.init()
        let query = "Delete From Departamento Where IdDepartamento = \(departamento.IdDepartamento)"
        var statement : OpaquePointer? = nil
        
        do{
                if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                    sqlite3_bind_int(statement, 0, (departamento.IdDepartamento as NSNumber).int32Value)
                    
                              
                if sqlite3_step(statement) == SQLITE_DONE{
                    result.Correct = true
                }else{
                    result.Correct = false
                }
                print ("Registro Eliminado Correctamente")
            }
        } catch let error {
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
            print("Error al eliminar registro")
        }
        return result
        
    }
    
    func GetAll()-> Result{ // Funcion Mostrar todos los registros
        var result = Result()
        let context = DB.init()
        let query = "SELECT IdDepartamento,Nombre, IdArea FROM Departamento"
        var statement : OpaquePointer? = nil
     
        do{
            if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                result.Objects = []
                while sqlite3_step(statement) == SQLITE_ROW{
                    
                    var departamento = Departamento(IdDepartamento: 0, NombreDepartamento: "", IdArea: Area(IdArea: 0, Nombre: ""))
                    departamento.IdDepartamento = Int(sqlite3_column_int(statement, 0))
                    departamento.NombreDepartamento =  String(cString: sqlite3_column_text(statement, 1))
                    departamento.IdArea.IdArea = Int(sqlite3_column_int(statement, 2))
                 //   departamento.IdArea = Area(IdArea: 0, Nombre: "")
                   
                    result.Objects?.append(departamento)
                   print(departamento)
                   // print(producto.Imagen)
                    
                }
                result.Correct = true
            }
                
        }catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        return result
    }
    
    func GetById(departamento: Departamento)-> Result{ // Funcion Mostrar todos los registros
        var result = Result()
        let context = DB.init()
        let query = "SELECT IdDepartamento,Nombre,IdArea FROM Departamento WHERE IdDepartamento = \(departamento.IdDepartamento)"
        var statement : OpaquePointer? = nil
        do{
            if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                result.Objects = []
                
              
                while sqlite3_step(statement) == SQLITE_ROW{
                    var departamento = Departamento(IdDepartamento: departamento.IdDepartamento, NombreDepartamento: departamento.NombreDepartamento, IdArea: Area(IdArea: departamento.IdArea.IdArea, Nombre: ""))
                    departamento.IdDepartamento = Int(sqlite3_column_int(statement, 0))
                    departamento.NombreDepartamento = String(cString: sqlite3_column_text(statement, 1))
                    departamento.IdArea.IdArea = Int(sqlite3_column_int(statement, 2))

                    
                    result.Objects?.append(departamento)
                    print(departamento)
                    
                }
                result.Correct = true
            }
                
        }catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        return result
    }

}
