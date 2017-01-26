//
//  NewsFeedCell.swift
//  LoginDesign
//
//  Created by Orange Apps on 20/01/2017.
//  Copyright © 2017 Orange Apps. All rights reserved.
//

import UIKit

class NewsFeedCell: UITableViewCell {
    
    
    @IBOutlet var imgUser: UIImageView!
    @IBOutlet var lblUsername: UILabel!
    @IBOutlet var lblTimePosted: UILabel!
    @IBOutlet var lblContent: UILabel!
    @IBOutlet var btnLike: UIButton!
    @IBOutlet var likeFlag: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Set border in the imgUser
        imgUser.layer.borderWidth = 1.0
        imgUser.layer.borderColor = UIColor(r: 231, g: 231, b: 241, a: 1).cgColor
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
