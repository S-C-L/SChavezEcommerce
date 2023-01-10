//
//  DepartamentoGetAllTableViewController.swift
//  SChavezEcommerce
//
//  Created by MacbookMBA10 on 06/01/23.
//

import UIKit
import SwipeCellKit

class DepartamentoGetAllTableViewController: UITableViewController {
    
    let departamentoViewModel = DepartamentoViewModel()
    var departamentos = [Departamento]()
    var idDepartamento: Int = 0
    
    override func viewDidLoad() {
        navigationController?.isNavigationBarHidden = false
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "DepartamentoTableViewCell", bundle: nil), forCellReuseIdentifier: "DepartamentoCell")
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func loadData() {
        let result = departamentoViewModel.GetAll()
        if result.Correct{
            departamentos = result.Objects! as! [Departamento]
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
        return departamentos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DepartamentoCell", for: indexPath) as! DepartamentoTableViewCell
        // cell.attemptRecovery(fromError: false, optionIndex: 0, delegate: self, didRecoverSelector: indexPath, contextInfo: 0)
        
        cell.delegate = self
        
        cell.IdDepartamento.text = String(departamentos[indexPath.row].IdDepartamento)
        cell.NombreDeparatmento.text = departamentos[indexPath.row].NombreDepartamento
        cell.IdArea.text = String(departamentos[indexPath.row].IdArea.IdArea)
        
        return cell
    }
    
    
    //}
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }    
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    }
    
    extension DepartamentoGetAllTableViewController : SwipeTableViewCellDelegate{
        func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeCellKit.SwipeActionsOrientation) -> [SwipeCellKit.SwipeAction]? {
            //  guard orientation == .right else { return nil }
            
            //var dezlizar = orientation
            if orientation == .right{
                guard orientation == .right else { return nil }
                let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
                    print(indexPath.row)
                    
                    let iddepartamento = self.departamentos[indexPath.row].IdDepartamento
                    
                    let result = self.departamentoViewModel.Delete(departamento: Departamento(IdDepartamento: iddepartamento, NombreDepartamento: "", IdArea: Area(IdArea: 0, Nombre: "")))
 
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
                    let iddepartamento = self.departamentos[indexPath.row].IdDepartamento
                    let nombre = self.departamentos[indexPath.row].NombreDepartamento
                    let area = self.departamentos[indexPath.row].IdArea.IdArea
                    
                    self.performSegue(withIdentifier: "UpdateDepa", sender: self)
                    
                    

                    let result = self.departamentoViewModel.GetById(departamento: Departamento(IdDepartamento: iddepartamento, NombreDepartamento: "", IdArea: Area(IdArea: 0, Nombre: "")))
                    
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
                    if segue.identifier == "UpdateDepa"{
                        let departamentoForm = segue.destination as! DepartamentoGetAllTableViewController
                        departamentoForm.idDepartamento = self.idDepartamento
                       
                    }
                }
            }
        }
        
    }
    
//}

