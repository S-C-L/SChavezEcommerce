//
//  UsuarioViewModel.swift
//  SChavezEcommerce
//
//  Created by MacbookMBA10 on 10/01/23.
//

import Foundation
import CoreData
import UIKit

class UsuarioViewModel{
    
    let appDelegate = UIApplication.shared.delegate as!  AppDelegate
    
    func Add(nombre: String,apellidoPaterno: String, apellidoMaterno: String, fechaNacimiento: Date, email: String, password: String, userName: String, sexo: String, telefono: String, celular: String, curp: String, rol: Int) -> Result{
        var result = Result()
        do{
            let context = appDelegate.persistentContainer.viewContext
            let entidad = try! NSEntityDescription.entity(forEntityName: "Usuario", in: context)
            
            let usuarioCoreData = NSManagedObject(entity: entidad!, insertInto: context)
            
            usuarioCoreData.setValue(nombre, forKey: "nombre")
            usuarioCoreData.setValue(apellidoPaterno, forKey: "apellidoPaterno")
            usuarioCoreData.setValue(apellidoMaterno, forKey: "apellidoMaterno")
           // usuarioCoreData.setValue(fechaNacimiento, forKey: "fechaNacimiento")
            usuarioCoreData.setValue(email, forKey: "email")
            usuarioCoreData.setValue(password, forKey: "password")
            usuarioCoreData.setValue(userName, forKey: "userName")
            usuarioCoreData.setValue(sexo, forKey: "sexo")
            usuarioCoreData.setValue(telefono, forKey: "telefono")
            usuarioCoreData.setValue(celular, forKey: "celular")
            usuarioCoreData.setValue(curp, forKey: "curp")
            usuarioCoreData.setValue(rol.self, forKey: "rol")
            
            
            try! context.save()
            result.Correct = true
            print("Usuario agregado correctamente")
            
            
        }catch var error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
            print("Error")
        }
        return result
    }
    
    func GetAll() -> Result {
        var result =  Result()
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuario")
        do{
            let usuarios = try context.fetch(request)
            result.Objects = [Usuarios]()
            for objUsuario in usuarios as! [NSManagedObject]{
                var usuario = Usuarios()
                // usuario.nombre = objUsuario.value(forKey: "nombre") as? String
                usuario.nombre = objUsuario.value(forKey: "nombre") as! String
                usuario.apellidoPaterno = objUsuario.value(forKey: "apellidoPaterno") as! String
                usuario.apellidoMaterno = objUsuario.value(forKey: "apellidoMaterno") as! String
                // usuario.fechaNacimiento = objUsuario.value(forKey: "fechaNacimiento") as! String
                usuario.email = objUsuario.value(forKey: "email") as! String
                usuario.password = objUsuario.value(forKey: "password") as! String
                usuario.userName = objUsuario.value(forKey: "userName") as! String
                usuario.sexo = objUsuario.value(forKey: "sexo") as! String
                usuario.telefono = objUsuario.value(forKey: "telefono") as! String
                usuario.celular = objUsuario.value(forKey: "celular") as! String
                usuario.curp = objUsuario.value(forKey: "curp") as! String
                result.Objects!.append(usuario)
                print(usuario)
                print("Tu busqueda fue exitosa")
            }
        } catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        return result
    }
    
    func GetById(IdUsuario: Int) -> Result{
        var result = Result()
        let usuarioform = UsuarioForm()
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Usuario", in: context)
        let request: NSFetchRequest<Usuario>=Usuario.fetchRequest()
        request.entity = entity
        let predicate = NSPredicate(format: "Self = \(IdUsuario)")
        request.predicate = predicate
        do{
            var usuarios = try! context.fetch(request)
            result.Objects = [Usuarios]()
            for objUsuario in usuarios as! [NSManagedObject]{
                var usuario = Usuarios()
              //  let id = Int(objUsuario.objectID.uriRepresentation().absoluteString.components(separatedBy: "/P")[0])
                  print(usuarios)
                usuario.nombre = objUsuario.value(forKey: "nombre") as! String
                usuario.apellidoPaterno = objUsuario.value(forKey: "apellidoPaterno") as! String
                usuario.apellidoMaterno = objUsuario.value(forKey: "apellidoMaterno")as! String
                // usuario.fechaNacimiento = objUsuario.value(forKey: "fechaNacimiento") as! String
                usuario.email = objUsuario.value(forKey: "email") as! String
                usuario.password = objUsuario.value(forKey: "password") as! String
                usuario.userName = objUsuario.value(forKey: "userName") as! String
                usuario.sexo = objUsuario.value(forKey: "sexo") as! String
                usuario.telefono = objUsuario.value(forKey: "telefono") as! String
                usuario.celular = objUsuario.value(forKey: "celular") as! String
                usuario.curp = objUsuario.value(forKey: "curp") as! String
                result.Objects!.append(usuario)
                print(usuario)
                print("Tu busqueda fue exitosa")
            }
        }catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        
        return result
    }
    
    func Update(IdUsuario: Int, Nombre: String,Apaterno: String,Amaterno: String, Email: String, Password: String, Username: String, Sexo: String, Telefono: String, Celular: String, CURP: String) -> Result {
        let usuarioform = UsuarioForm()
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Usuario", in: context)
        let request: NSFetchRequest<Usuario>=Usuario.fetchRequest()
        request.entity = entity
        
        let predicate = NSPredicate(format: "Self = \(IdUsuario)")
        request.predicate = predicate
        var result = Result()
        do{
            var accion = try! context.fetch(request)
            
            if accion.count > 0 {
                let usuario = accion[0] as! NSManagedObject
                usuario.setValue(Nombre, forKey: "nombre")
                usuario.setValue(Apaterno, forKey: "apellidoPaterno")
                usuario.setValue(Amaterno, forKey: "apellidoMaterno")
                usuario.setValue(Email, forKey: "email")
                usuario.setValue(Password, forKey: "password")
                usuario.setValue(Username, forKey: "userName")
                usuario.setValue(Sexo, forKey: "sexo")
                usuario.setValue(Telefono, forKey: "telefono")
                usuario.setValue(Celular, forKey: "celular")
                usuario.setValue(CURP, forKey: "curp")
                
                try! context.save()
                result.Correct = true
                print("Usuario Actualizado Correctamente")

            }
            }catch var error{
                result.Correct = false
                result.Ex = error
                result.ErrorMessage = error.localizedDescription
                print("Error al actualizar usuario")
        }
        return result
    }
    
    func Delete(IdUsuario: Int) -> Result{
        var result = Result()
        let usuarioform = UsuarioForm()
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Usuario", in: context)
        let request: NSFetchRequest<Usuario>=Usuario.fetchRequest()
        request.entity = entity
        
        let predicate = NSPredicate(format: "Self = \(IdUsuario)")
        request.predicate = predicate
        
        do{
            var result = try! context.fetch(request)
            if result.count > 0 {
                let usuario = result[0] as! NSManagedObject
                context.delete(usuario)
                try! context.save()
                print("Usuario Eliminado")
            }
        }
         return result
    }
}
   
