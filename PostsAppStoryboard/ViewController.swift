//
//  ViewController.swift
//  PostsAppStoryboard
//
//  Created by Syed Raza on 8/13/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var postsList: UITableView!
    var dataSource: [Post] = [] {
        didSet {
            //reload my Data
            postsList.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
extension ViewController: UITableViewDelegate{
    
}
