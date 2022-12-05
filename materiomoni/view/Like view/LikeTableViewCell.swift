//
//  LikeTableViewCell.swift
//  materiomoni
//
//  Created by Utsav busa on 23/11/22.
//

import UIKit

class LikeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserImage: UIImageView!
    
    @IBOutlet weak var UserDob: UILabel!
    @IBOutlet weak var UserEducation: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        UserImage.layer.masksToBounds = true
        UserImage.layer.cornerRadius = UserImage.bounds.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
