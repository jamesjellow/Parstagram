//
//  FeedViewController.swift
//  Parstagram
//
//  Created by Gabe De Mesa on 2/26/20.
//  Copyright © 2020 Gabe De Mesa. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    var posts = [PFObject]()

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let query = PFQuery(className: "Posts")
        query.includeKey("author")
        query.limit = 20
        query.findObjectsInBackground{ (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.tableView.reloadData()
            }
        }
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let post = posts[section]
//        let comments = (post["comments"] as? [PFObject]) ?? []
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        let post = posts[indexPath.row]
        let user = post["author"] as! PFUser
        cell.usernameLabel.text = user.username

        cell.captionLabel.text = post["caption"] as! String

        let imageFile = post["image"] as! PFFileObject
        let urlString = imageFile.url
        let url = URL(string: urlString!)
//        print(url)
        cell.photoView.af_setImage(withURL: url!)
        return cell
    }

    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOut()
        print("Logged out")
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        
        let sceneDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
        
        sceneDelegate.window?.rootViewController = loginViewController
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
