//
//  PostCell.swift
//  Parstagram
//
//  Created by Gabe De Mesa on 2/26/20.
//  Copyright © 2020 Gabe De Mesa. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet var photoView: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var captionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
