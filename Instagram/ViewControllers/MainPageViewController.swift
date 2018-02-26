//
//  MainPageViewController.swift
//  Instagram
//
//  Created by Pujan Thapa on 2/25/18.
//  Copyright © 2018 Aayush. All rights reserved.
//

import UIKit
import ParseUI

class MainPageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var refreshControl = UIRefreshControl()
    var remotePosts: [PFObject] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector (MainPageViewController.didPullToRefresh(_:)), for: .valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 316
        
        // Do any additional setup after loading the view.

        // fetch data asynchronously
        makeRequest()
        
    }
    
    func makeRequest(){
        let query = PFQuery(className: "Post")
        query.order(byDescending: "createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) -> Void in
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(posts!.count) scores.")
                // Do something with the found objects
                self.remotePosts = posts!
                if posts != nil {
                    self.tableView.reloadData()
                    self.refreshControl.endRefreshing()
                    
                }
            } else {
                // Log details of the failure
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    @objc
    func didPullToRefresh(_ refreshControl: UIRefreshControl){
        self.refreshControl.attributedTitle = NSAttributedString(string: "Fetching User Storeis ... ")
        makeRequest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didLogOut(_ sender: Any){
        NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return remotePosts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostViewCell
        cell.instagramPost = remotePosts[indexPath.row]
        cell.captionLabel.text = remotePosts[indexPath.row]["caption"] as? String
        return cell
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
