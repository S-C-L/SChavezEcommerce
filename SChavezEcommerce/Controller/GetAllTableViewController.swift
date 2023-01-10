//
//  GetAllTableViewController.swift
//  SChavezEcommerce
//
//  Created by MacbookMBA10 on 04/01/23.
//

import UIKit
import SwipeCellKit

class GetAllTableViewController: UITableViewController {
    //class GetAllTableViewController: UITableViewController{
    
    let productoViewModel = ProductoViewModel()
    var productos = [Producto]()
    var idProducto : Int = 0
    
    override func viewDidLoad() {
        // super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ProductoTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductoCell")
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func loadData() {
        let result = productoViewModel.GetAll()
        if result.Correct{
            productos = result.Objects! as! [Producto]
            tableView.reloadData()
        }
        else{
            //ALERT
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("ViewWillAppear")
        loadData()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return productos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductoCell", for: indexPath) as! ProductoTableViewCell
       // cell.attemptRecovery(fromError: false, optionIndex: 0, delegate: self, didRecoverSelector: indexPath, contextInfo: 0)
        cell.delegate = self
    
        cell.Nombrelbl.text = productos[indexPath.row].Nombre
        cell.PrecioUnitario.text = String(productos[indexPath.row].PrecioUnitario)
        cell.Stock.text = String(productos[indexPath.row].Stock)
        cell.Descripcion.text = productos[indexPath.row].Descripcion
        
        var image = productos[indexPath.row].Imagen
        
//cell.ImageUser.image = UIImage(named: image)
        
       if productos[indexPath.row].Imagen == ""{
            cell.ImageUser.image = UIImage(named: "User")
        }else{
            let imageData = Data(base64Encoded: productos[indexPath.row].Imagen,options: Data.Base64DecodingOptions.ignoreUnknownCharacters)
            cell.ImageUser.image = UIImage(data: imageData!)
        }
        
        return cell
    }
    
  
}


/*extension GetAllTableViewController : SwipeTableViewCellDelegate{
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeCellKit.SwipeActionsOrientation) -> [SwipeCellKit.SwipeAction]? {
      //  guard orientation == .right else { return nil }
        
        //var dezlizar = orientation
        if orientation == .right{
            guard orientation == .right else { return nil }
            let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
                print(indexPath.row)
                
                let idproducto = self.productos[indexPath.row].IdProducto
                
                let result = self.productoViewModel.Delete(producto: Producto(IdProducto: idproducto, Nombre: "", PrecioUnitario: 0.0, Stock: 0, Proveedor: Proveedor(IdProveedor: 0, Nombre: "", Telefono: ""), Departamento: Departamento(IdDepartamento: 0, NombreDepartamento: "", IdArea: Area(IdArea: 0, Nombre: "")), Descripcion: "", Imagen: ""))
                if result.Correct == true{
                    print("Correcto")
                }else{
                    print("Error")
                }
                self.loadData()
            }
            
            deleteAction.image = UIImage(systemName: "trash")
            deleteAction.backgroundColor = .red
            
            return [deleteAction]
        }
        else{
            guard orientation == .left else { return nil }
            let updateAction = SwipeAction(style: .destructive, title: "Update") { action, indexPath in
                print(indexPath.row)
                let idproducto = self.productos[indexPath.row].IdProducto
                
                let result = self.productoViewModel.Delete(producto: Producto(IdProducto: idproducto, Nombre: "", PrecioUnitario: 0.0, Stock: 0, Proveedor: Proveedor(IdProveedor: 0, Nombre: "", Telefono: ""), Departamento: Departamento(IdDepartamento: 0, NombreDepartamento: "", IdArea: Area(IdArea: 0, Nombre: "")), Descripcion: "", Imagen: ""))
                if result.Correct == true{
                    print("Correcto")
                }else{
                    print("Error")
                }
                self.loadData()
            }
            //deleteAction.image = UIImage(named: "delete")
            updateAction.image = UIImage(systemName: "arrow.triangle.2.circlepath.circle.fill")
            updateAction.backgroundColor = .blue
            
            return [updateAction]
        }
    }
        
    }*/

extension GetAllTableViewController : SwipeTableViewCellDelegate{
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeCellKit.SwipeActionsOrientation) -> [SwipeCellKit.SwipeAction]? {
      //  guard orientation == .right else { return nil }
        
        //var dezlizar = orientation
        if orientation == .right{
            guard orientation == .right else { return nil }
            let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
                print(indexPath.row)
                
                let idproducto = self.productos[indexPath.row].IdProducto
                
                let result = self.productoViewModel.Delete(producto: Producto(IdProducto: idproducto, Nombre: "", PrecioUnitario: 0.0, Stock: 0, Proveedor: Proveedor(IdProveedor: 0, Nombre: "", Telefono: ""), Departamento: Departamento(IdDepartamento: 0, NombreDepartamento: "", IdArea: Area(IdArea: 0, Nombre: "")), Descripcion: "", Imagen: ""))
                if result.Correct == true{
                    print("Correcto")
                }else{
                    print("Error")
                }
                self.loadData()
            }
            
            deleteAction.image = UIImage(systemName: "trash")
            deleteAction.backgroundColor = .red
            
            return [deleteAction]
        }
        else{
            guard orientation == .left else { return nil }
            let updateAction = SwipeAction(style: .destructive, title: "Update") { [self] action, indexPath in
                print(indexPath.row)
                let idproducto = self.productos[indexPath.row].IdProducto
                let nombre = self.productos[indexPath.row].Nombre
                let preciounitario = self.productos[indexPath.row].PrecioUnitario
                let stock = self.productos[indexPath.row].Stock
                let proveedor = self.productos[indexPath.row].Proveedor.IdProveedor
                let departamento = self.productos[indexPath.row].Departamento.IdDepartamento
             
                
                self.performSegue(withIdentifier: "UpdateSegues", sender: self)
                
                
              /*  let result = self.productoViewModel.Update(Producto(IdProducto: idproducto, Nombre: nombre, PrecioUnitario: preciounitario, Stock: stock, Proveedor: Proveedor(IdProveedor: proveedor, Nombre: "", Telefono: ""), Departamento: Departamento(IdDepartamento: departamento, NombreDepartamento: "", IdArea: Area(IdArea: 0, Nombre: "")), Descripcion: "", Imagen: ""))*/
                let result = self.productoViewModel.GetById(Idproducto: idProducto)
                
                if result.Correct == true{
                    print("Correcto")
                    
                }else{
                    print("Error")
                }
                self.loadData()
            }
            //deleteAction.image = UIImage(named: "delete")
            updateAction.image = UIImage(systemName: "arrow.triangle.2.circlepath.circle.fill")
            updateAction.backgroundColor = .blue
            
            return [updateAction]
            func prepare(for segue: UIStoryboardSegue,sender: Any?) {
                if segue.identifier == "UpdateSegues"{
                    let productoForm = segue.destination as! GetAllTableViewController
                    productoForm.idProducto = self.idProducto
                }
        }
        }
    }
        
    }
