//
//  DepartamentoTableViewCell.swift
//  SChavezEcommerce
//
//  Created by MacbookMBA10 on 05/01/23.
//

import UIKit
import SwipeCellKit

class DepartamentoTableViewCell: SwipeTableViewCell {
    
    @IBOutlet weak var IdDepartamento: UILabel!
    @IBOutlet weak var NombreDeparatmento: UILabel!
    @IBOutlet weak var IdArea: UILabel!
    @IBOutlet weak var ImageDepartamento: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
