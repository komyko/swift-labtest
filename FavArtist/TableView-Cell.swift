//
//  TableView-Cell.swift
//  FavArtist
//
//  Created by supakit on 21/10/2564 BE.
//

import UIKit

class TableView_Cell: UITableViewCell {

    @IBOutlet weak var imgweb: UIImageView!
    @IBOutlet weak var lbweb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
