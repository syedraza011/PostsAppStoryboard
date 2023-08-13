//
//  ViewController.swift
//  PostsAppStoryboard
//
//  Created by Syed Raza on 8/13/23.
//

import UIKit

class ViewController: UIViewController {
    let viewModel = PostsViewModel()
    @IBOutlet weak var postsList: UITableView!
    var dataSource: [Post] = [] {
        didSet {
            //reload my Data
            postsList.reloadData()
        }
    }
    override func viewDidLoad()  {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Task{
            do {
                let dataSource = try await viewModel.getPosts()
            }catch {
                
            }
        }
    }
}
        
        extension ViewController: UITableViewDataSource {
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return dataSource.count
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as? UITableViewCell else {
                    return UITableViewCell()}
                cell.textLabel?.text = dataSource[indexPath.row].title
                return cell
            }
            
            
        }
        extension ViewController: UITableViewDelegate{
            func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                <#code#>
            }
            override func prepare (for: segue: UIStoryboardSegue, sender: Any?) {
                if let detailsVC =segue,destination segue.Identifier == "postListDetails" {
                     detailsVC = segue.destination
                }
            }
        }
    
