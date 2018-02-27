//
//  DetailViewController.swift
//  Instagram
//
//  Created by student on 2/27/18.
//  Copyright © 2018 Aayush. All rights reserved.
//

import UIKit
import ParseUI

class DetailViewController: UIViewController {

    @IBOutlet var dateLabel: UIView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var imageView: PFImageView!
    var post: PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        captionLabel.text = post["caption"] as? String
        authorLabel.text = post["author"] as? String
        imageView.file = post["media"] as? PFFile
        imageView.loadInBackground()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
