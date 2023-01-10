//
//  ProductoTableViewCell.swift
//  SChavezEcommerce
//
//  Created by MacbookMBA10 on 04/01/23.
//

import UIKit
import SwipeCellKit

class ProductoTableViewCell: SwipeTableViewCell {
//class AlumnoTableViewCell: SwipeTableViewCell{
    
    @IBOutlet weak var Nombrelbl: UILabel!
    @IBOutlet weak var IdProveedor: UILabel!
    @IBOutlet weak var Stock: UILabel!
    @IBOutlet weak var Descripcion: UILabel!
    @IBOutlet weak var PrecioUnitario: UILabel!
    @IBOutlet weak var ImageUser: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
