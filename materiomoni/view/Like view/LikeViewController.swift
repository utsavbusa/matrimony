//
//  LikeViewController.swift
//  materiomoni
//
//  Created by Utsav busa on 23/11/22.
//

import UIKit

class LikeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //outlet of table view
    @IBOutlet weak var TableViewOutlet: UITableView!
    
    //favourite user array with data type of that array is Users
    var FavouriteusersArray:[Users] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    //this method run every time this view is open
    override func viewWillAppear(_ animated: Bool) {
        LoadUserData()
    }
    
    //LoadUserData method which method load data
    func LoadUserData(){
        FavouriteusersArray = UserDAL.getFavouriteUser()
        TableViewOutlet.reloadData()
    }
    
    //number of section method for tableview
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //number of row in section method for tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavouriteusersArray.count
    }
    
    //cellfor row at method for tableview cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: LikeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LikeTableViewCell
        
        
        let U:Users = FavouriteusersArray[indexPath.row]
        
        
        cell.UserImage.image = UIImage(named: U.Gender == "Male" ? "men":"women")
        
        cell.UserName.text = U.Name
        print(U.Education)
        cell.UserEducation.text = U.Education
        cell.UserDob.text = String(U.DOB)
        
        return cell
        
    }
    
    //didselectrow at method for tableview
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let udvc:DetailsViewController = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController_vc") as! DetailsViewController
        
        let U:Users = FavouriteusersArray[indexPath.row]
        udvc.DetailsObj = U
        
        self.navigationController?.pushViewController(udvc, animated: true)
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
