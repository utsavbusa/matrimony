//
//  TableViewCell.swift
//  materiomoni
//
//  Created by Utsav busa on 20/11/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var userImage: UIImageView!
    
    
    @IBOutlet weak var UserName: UILabel!
    
    
    @IBOutlet weak var UserEducation: UILabel!
    
    @IBOutlet weak var UserDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImage.layer.masksToBounds = true
        userImage.layer.cornerRadius = userImage.bounds.width/2
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
