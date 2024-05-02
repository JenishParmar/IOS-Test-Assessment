//
//  PostDetailView.swift
//  Test Assignment
//
//  Created by Jenish's MacBook on 02/05/24.
//

import Foundation
import UIKit

class PostDetailView:UIViewController{
    
//MARK: - Declare Outlets and Variables
    @IBOutlet weak var tblPostDetail:UITableView!
    
    var PostDetailDataIndex = 0

//MARK: - View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblPostDetail.delegate = self
        tblPostDetail.dataSource = self
        
    }
    
}

// MARK: - UITableViewDataSource and UITableViewDelegate
extension PostDetailView:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostDetailTableViewCell", for: indexPath) as! PostDetailTableViewCell
        
        View_Corner_Radius_And_Shaddow(view: cell.MainView, CornerRadius: 10)
        cell.intUserID.text = "UserID: \(WebServices.shared.Post_Model[PostDetailDataIndex].userId)"
        cell.intID.text = "Id: \(WebServices.shared.Post_Model[PostDetailDataIndex].id)"
        cell.intTitle.text = "Title: \(WebServices.shared.Post_Model[PostDetailDataIndex].title)"
        cell.intBody.text = "Body: \(WebServices.shared.Post_Model[PostDetailDataIndex].body)"
        
        return cell
    }
}
