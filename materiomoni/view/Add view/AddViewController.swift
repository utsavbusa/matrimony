//
//  AddViewController.swift
//  materiomoni
//
//  Created by Utsav busa on 22/11/22.
//

import UIKit

class cellclass:UITableViewCell{
    
}

class AddViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var flag = true

    var favourite:Int32 = 0
    
    @IBOutlet weak var FavouriteSegmentOutlets: UISegmentedControl!
    
    @IBAction func FavouriteSegmentAction(_ sender: Any) {
        
        switch FavouriteSegmentOutlets.selectedSegmentIndex
        {
        case 0:
            favourite = 1
            StarBtn.image = UIImage(systemName: "star.fill" )
        case 1:
            favourite = 0
            StarBtn.image = UIImage(systemName: "star" )
            
        default:
            favourite = 0
        }
       
    }
    
    @IBOutlet weak var StarBtn: UIBarButtonItem!
    
    //this method use for start btn action when star btn click that change tha star color and also change value of favouire if favourite is 0 then that chnage to 1 and favourite is 1 than that change to 0 also change the segment of favouite acourding to flag
    @IBAction func StartbtnAction(_ sender: Any) {
        
        if flag == true {
            favourite = 1
            StarBtn.image = UIImage(systemName: "star.fill" )
            flag = false
            FavouriteSegmentOutlets.selectedSegmentIndex = 0
            
        }
        else{
            favourite = 0
            StarBtn.image = UIImage(systemName: "star" )
            flag = true
            FavouriteSegmentOutlets.selectedSegmentIndex = 1
        }
        
    }
    
    @IBOutlet weak var Date: UIDatePicker!
    
    @IBOutlet weak var Name: UITextField!
    
    @IBOutlet weak var Age: UITextField!
    
    var gender:String = String()
    
    @IBOutlet weak var Education: UITextField!
    
    @IBOutlet weak var Height: UITextField!
    
    @IBOutlet weak var Address: UITextField!
    
    @IBOutlet weak var CastTextfiled: UITextField!
    
    @IBOutlet weak var State: UITextField!
    
    @IBOutlet weak var City: UITextField!
    
    @IBOutlet weak var Phone: UITextField!
    
    @IBOutlet weak var Mobile: UITextField!
    
    @IBOutlet weak var Remarks: UITextField!
    
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var MainImage: UIImageView!
    
    @IBOutlet weak var submitButtonOutlet: UIButton!
    
    var Castpiker: UIPickerView = UIPickerView()
    var DOBPiker: UIDatePicker = UIDatePicker()
    
    let transparentView = UIView()
    let tableView = UITableView()
    var selectedButton = UIButton()
    var dataSource = [String]()
    var Castes:[Caste] = []
    var selectedCaste:Caste = Caste()
    var uau:Users = Users()
    var fromscreen = ""
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //this code shape of image
        MainImage.layer.masksToBounds = true
        MainImage.layer.cornerRadius = MainImage.bounds.width/2
        
        //this code change favourite segment to no
        FavouriteSegmentOutlets.selectedSegmentIndex = 1
      
        //set delgeate and datasource of tableView and Castpiker
        tableView.delegate = self
        tableView.dataSource = self
        Castpiker.delegate = self
        Castpiker.dataSource = self
        
        //register tableview cell
        tableView.register(cellclass.self, forCellReuseIdentifier: "cell")
        
        
        //set inputview of casttextfile to castepiker
        CastTextfiled.inputView = Castpiker
        
        //get all cast for castepiker and set all caste in array of Castes
        Castes = CasteDAL.getUser()
        
        //this code for when enduser edit profile of any user
        if fromscreen == "edit"{
            print("utsav busa")
            self.title = uau.Name
            Name.text = uau.Name
            MainImage.image = UIImage(named: uau.Gender == "Male" ? "men":"women")
            
            
            btnSelectGender.setTitle(uau.Gender, for: .normal)
            if uau.IsFavourite == 1{
                StarBtn.image = UIImage(systemName: "star.fill" )
                FavouriteSegmentOutlets.selectedSegmentIndex = 0
            }
            else{
                StarBtn.image = UIImage(systemName: "star" )
                FavouriteSegmentOutlets.selectedSegmentIndex = 1
            }
            
            let df = DateFormatter()
            df.dateFormat = "dd-MM-yyyy"
            let date = df.date(from: uau.DOB)
            let fixdate = df.date(from: "01-01-2022")
            Date.setDate((date ?? fixdate)! , animated: true)
            
            Age.text = String(uau.Age)
            
            
            Castpiker.selectRow(Int(uau.CasteId)-1, inComponent: 0, animated: true)
            CastTextfiled.text = uau.CasteName
            
            Education.text = uau.Education
            
            Height.text = uau.Height
            
            Address.text = uau.Address
            
            City.text = uau.City
            
            State.text = uau.State
            
            Phone.text = uau.Phone
            
            Mobile.text = uau.Mobile
            
            Email.text = uau.Email
            
            Remarks.text = uau.Remarks
            
            //isfavourite
            
            //change the submit btn name to update
            submitButtonOutlet.setTitle("Update", for: .normal)
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    
    //this foour method use of Castepiker method1 is numberOfComponents,method 2 is numberOfRowsInComponent,method 3 is titleForRow,method 4 is didSelectRow
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Castes.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let c:Caste = Castes[row]
        
        return c.CasteName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let c:Caste = Castes[row]
        CastTextfiled.text = c.CasteName
        selectedCaste = c
        CastTextfiled.resignFirstResponder()
    }
    
    
    //this method use for add tansparand view when enduser click on select gender method
    func addTransparentView(frames: CGRect) {
             let window = UIApplication.shared.keyWindow
             transparentView.frame = window?.frame ?? self.view.frame
             self.view.addSubview(transparentView)
             
             tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
             self.view.addSubview(tableView)
             tableView.layer.cornerRadius = 5
             
             transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
             tableView.reloadData()
             let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
             transparentView.addGestureRecognizer(tapgesture)
             transparentView.alpha = 0
             UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
                 self.transparentView.alpha = 0.5
                 self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height + 5, width: frames.width, height: CGFloat(self.dataSource.count * 50))
             }, completion: nil)
         }
    
    
    //remove transpernt view method
    @objc func removeTransparentView() {
             let frames = selectedButton.frame
             UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
                 self.transparentView.alpha = 0
                 self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
             }, completion: nil)
         }
    
    
    //selectgeneder btn outlet
    @IBOutlet weak var btnSelectGender: UIButton!
    
    
    
    //slectgendrdrop method use for when user click slectgender text box that time they give droup down manu
    @IBAction func SelecGenderDrop(_ sender: Any) {
        dataSource = ["Male", "Female"]
            selectedButton = btnSelectGender
            addTransparentView(frames: btnSelectGender.frame)
    }
    
    
    //this four method use for design select gender droupdown box
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             selectedButton.setTitle(dataSource[indexPath.row], for: .normal)
        
            gender = selectedButton.title(for: .normal) ?? ""
        
        if gender == "Male"{
            MainImage.image = UIImage(named: "men")
        }
        else{
            MainImage.image = UIImage(named: "women")
        }
       
             removeTransparentView()
         }
    
    
    
    //submit btn metod
    @IBAction func Submit(_ sender: Any) {
        
        //make submitobj that data type name is Users
        var submitObj:Users = Users()
        
        // all the value that user enter in text fild which store in submitobj
        submitObj.Name = Name.text ?? ""
        submitObj.Gender = gender
    
        // selecdate varible has a today date
        let selectdate = DOBPiker.date
        let formate = DateFormatter()
        formate.dateFormat = "dd-mm-yy"
        
        //this code get date from datepiker and store in submitObj DOB
        submitObj.DOB = formate.string(from: selectdate)
        
        submitObj.Age = Int32(Age.text ?? "0") ?? 0
        
        submitObj.CasteId = selectedCaste.CasteId
        
        submitObj.Education = Education.text!
        
        submitObj.Height = Height.text!
        
        submitObj.Address = Address.text!
        
        submitObj.City = City.text!
        
        submitObj.State = State.text!
        
        submitObj.Phone = Phone.text!
        
        submitObj.Mobile = Mobile.text!
        
        submitObj.Remarks = Remarks.text!
        
        submitObj.IsFavourite = favourite
        
       
       
        
        var status:Bool = false
        
        
        //chech that this method work for add new user of edit exicting user
        if fromscreen == "edit"{
            
            
            //set profile id of submit obj
            submitObj.ProfileID = uau.ProfileID
            
            //edit exicting user data usind EditUser method
            status = UserDAL.EditUser(us: submitObj)
            
        }
        else{
            
            status = UserDAL.AddUser(us: submitObj)
        }
        
        if status{
            
            //print alert message
            let alert = UIAlertController(title: "add", message: fromscreen == "edit" ? "you just upadate \(submitObj.Name)" :"you just add new user successfully ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default,handler: {UIAlertAction in
                
                self.navigationController?.popViewController(animated: true)
                
            }))
            self.present(alert, animated: true)
        }
        
        
        
        

        let indexDeta: [String : Int] = ["index" : 0]
        NotificationCenter.default.post(name: Notification.Name("changeIndex"),object: nil,userInfo: indexDeta)
        self.view.endEditing(true)
        
        makeEmpty()
        
            
        
        
        
        
        
    }
    func makeEmpty(){
        Name.text = ""
        let currentdate = Foundation.Date()
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy"
        Date.setDate(df.date(from: df.string(from: currentdate) )!, animated: true)
        selectedButton.setTitle("Select Gender", for: .normal)
        Age.text = ""
        Education.text = ""
        Height.text = ""
        Address.text = ""
        CastTextfiled.text = ""
        State.text = ""
        City.text = ""
        Phone.text = ""
        Mobile.text = ""
        Remarks.text = ""
        
        
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
