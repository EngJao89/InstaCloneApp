//
//  PostagemTableViewCell.swift
//  InstaCloneApp
//
//  Created by João Ricardo Martins Ribeiro on 28/01/25.
//

import UIKit

class PostagemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descricaoPostagem: UILabel!
    @IBOutlet weak var fotoPostagem: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
