//
//  PostListViewController.swift
//  Test Assignment
//
//  Created by Jenish's MacBook on 02/05/24.
//

import UIKit

class PostListViewController: UIViewController{

//MARK: - Declare Outlets and Variables
    @IBOutlet weak var tblPostList: UITableView!
    var activityView: UIActivityIndicatorView?
    
    var currentPage = 1
    let pageSize = 10
    
    //MARK: - View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblPostList.dataSource = self
        tblPostList.delegate = self
        
        fetchData()
    }

// MARK: - Fatch Post Data API Call
    func fetchData() {
        showActivityIndicator()
        WebServices.shared.fetchPosts(pageNumber: currentPage, pageSize: pageSize) { isSuccess, error in
        self.hideActivityIndicator()
            if isSuccess{
                DispatchQueue.main.async {
                    self.tblPostList.reloadData()
                }
            }
        }
    }

//MARK: - Show Activity Indicator
    func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = self.view.center
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }

//MARK: - Hide Activity Indicator
    func hideActivityIndicator(){
        if (activityView != nil){
            activityView?.stopAnimating()
        }
    }
    
}

// MARK: - UITableViewDataSource and UITableViewDelegate
extension PostListViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WebServices.shared.Post_Model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostListTableViewCell", for: indexPath) as! PostListTableViewCell
        let post = WebServices.shared.Post_Model[indexPath.row]
        View_Corner_Radius_And_Shaddow(view: cell.CellView, CornerRadius: 10)
        cell.strIdAndTitle.text = "\(post.id): \(post.title)"
        return cell
    }
    

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == WebServices.shared.Post_Model.count - 1 {
            currentPage += 1
            fetchData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let PostDetailView = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PostDetailView") as! PostDetailView
        PostDetailView.PostDetailDataIndex = indexPath.row
        self.navigationController?.pushViewController(PostDetailView, animated: true)
        
    }
}
