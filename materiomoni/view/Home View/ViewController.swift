//
//  ViewController.swift
//  materiomoni
//
//  Created by Utsav busa on 20/11/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,chagearray {
    func changearrayvalue(value: [Users],Screen:String) {
        usersArray = value
        Screen1 = Screen
        print("\(usersArray.count)")
    }


    


    
    
    @IBOutlet weak var Tableview: UITableView!
    
    var usersArray:[Users] = []
    var Screen1:String = ""
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Tableview.delegate = self
        Tableview.dataSource = self
        
        usersArray = UserDAL.getUser()
        
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        LoadUserData()
    }
    func LoadUserData(){
        if Screen1 == "Search"{
            Tableview.reloadData()
            print("utsav \(usersArray.count)")
        
        }
        else{
            usersArray = UserDAL.getUser()
            Tableview.reloadData()
        }
    }
    
    @IBAction func Search(_ sender: Any) {
        
        let sdvc:SearchViewController = storyboard?.instantiateViewController(withIdentifier: "SearchViewController_vc") as! SearchViewController
        sdvc.slecetchangevalue = self
        self.navigationController?.pushViewController(sdvc, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        
        let U:Users = usersArray[indexPath.row]
        
        
        cell.userImage.image = UIImage(named: U.Gender == "Male" ? "men":"women")
        
        cell.UserName.text = U.Name
        cell.UserEducation.text = U.Education
        cell.UserDate.text = String(U.DOB)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let udvc:DetailsViewController = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController_vc") as! DetailsViewController
        
        let U:Users = usersArray[indexPath.row]
        udvc.DetailsObj = U
        
        self.navigationController?.pushViewController(udvc, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        
        let u:Users = self.usersArray[indexPath.row]
        
        let delet = UITableViewRowAction(style: .default, title: "Delet") { UITableViewRowAction, IndexPath in
            
            
            
            
            let alert = UIAlertController(title: "Favourite Car", message: "are you sure to delet \(u.Name)", preferredStyle: .alert)
            
            
            alert.addAction(UIAlertAction(title: "Yes", style: .default , handler: { UIAlertAction in
                
                let status = UserDAL.DeletUser(us: u)
                
                if status{
                    self.LoadUserData()
                }
                
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .default , handler: { UIAlertAction in
                
            }))
            
            self.present(alert, animated: true)
        }
        let edit = UITableViewRowAction(style: .default, title: "Edit") { UITableViewRowAction, IndexPath in
            
            let acvc:AddViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddViewController_vc") as! AddViewController
            
            acvc.uau = u
            acvc.fromscreen = "edit"
            
            
            self.navigationController?.pushViewController(acvc, animated: true
            )
                
        }
        edit.backgroundColor = .darkGray
        return [delet,edit]
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
