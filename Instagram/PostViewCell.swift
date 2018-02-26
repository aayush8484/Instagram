//
//  PostViewCell.swift
//  Instagram
//
//  Created by Pujan Thapa on 2/25/18.
//  Copyright © 2018 Aayush. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class PostViewCell: UITableViewCell {

    @IBOutlet weak var photoView: PFImageView!
    
    @IBOutlet weak var captionLabel: UILabel!
    var instagramPost: PFObject! {
        didSet {
            self.photoView.file = instagramPost["media"] as? PFFile
            self.photoView.loadInBackground()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // captionLabel.text = instagramPost["caption"] as? String
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
