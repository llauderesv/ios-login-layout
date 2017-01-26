//
//  NewsFeedController.swift
//  LoginDesign
//
//  Created by Orange Apps on 20/01/2017.
//  Copyright © 2017 Orange Apps. All rights reserved.
//

import UIKit

class NewsFeedController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tblNewsFeed: UITableView!
    
    var newsFeed: [NewsFeed]? = []
    
    var newsFeedData = ["Bill Gates", "Mark Zuckerberg", "Larry Page", "Steve Jobs"]
    
    var imageSrc = ["bill", "download", "larry-page", "steve"]
    
    var likeStatus = ["false", "false", "false", "false"]
    
    static var currentValue = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Change the color of the navigation bar.
        navigationController?.navigationBar.barTintColor = UIColor(r: 255, g: 0, b: 0, a: 1)
        
        // Change the color the status bar to white background.
        navigationController?.navigationBar.barStyle = .blackOpaque
        
        // Setup the Dynamic row height
        self.tblNewsFeed.estimatedRowHeight = 400
        self.tblNewsFeed.rowHeight = UITableViewAutomaticDimension
        
        onInitializer()
        
        print(NewsFeedController.currentValue += 1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let newsFeedCell = Bundle.main.loadNibNamed("NewsFeedCell", owner: self, options: nil)?.first as! NewsFeedCell
        
        newsFeedCell.btnLike.addTarget(self, action: #selector(NewsFeedController.btnLikeListener), for: .touchUpInside)
        // Add tag to the button
        newsFeedCell.btnLike.tag = indexPath.row
        newsFeedCell.likeFlag.text = likeStatus[indexPath.row]
        newsFeedCell.imgUser.image = UIImage(named: imageSrc[indexPath.row])
        newsFeedCell.lblUsername.text = newsFeed?[indexPath.row].name
        newsFeedCell.lblTimePosted.text = "Just now"
        newsFeedCell.lblContent.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        return newsFeedCell
    }
    
    // Change the navigation title to Back
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.title = "Back"
    }
    
    // Change the navigation title to News Feed
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "News Feed"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsFeed?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    @IBAction func btnLogOut(_ sender: Any) {
        let loginController =
            self.storyboard?.instantiateViewController(withIdentifier: "LoginController") as! ViewController
        present(loginController, animated: true, completion: nil)
    }
    
    // Function for handling like event
    func btnLikeListener(sender: UIButton) {
        
        let tag = sender.tag
        
        // Check if the use is already like in a post
        if likeStatus[tag] == "false" {
            // Change the background of the button
            sender.setTitleColor(UIColor(r: 78, g: 159, b: 255, a: 1.0), for: .normal)
            sender.setImage(UIImage(named: "like_filled"), for: .normal)
            
            likeStatus[tag] = "true"
        } else {
            sender.setTitleColor(UIColor(r: 92, g: 94, b: 102, a: 1.0), for: .normal)
            sender.setImage(UIImage(named: "like20"), for: .normal)
            
            likeStatus[tag] = "false"
        }
        
        /*var likes = "Like"
        
        let inc = foo()
        
        if inc > 1 {
            likes = "Likes"
        } else {
            likes = "Like"
        }
        
        sender.setTitle("\(likes) \(inc)", for: .normal)*/
    }
    
    func foo() -> Int {
        struct StaticVars {
            static var counter = 0
        }
        StaticVars.counter += 1
        return StaticVars.counter
    }
    
    func onInitializer() {
        for value in newsFeedData {
            let newsFeedData = NewsFeed()
            newsFeedData.name = value
            newsFeed?.append(newsFeedData)
        }
    }
    
}
