//
//  SearchViewController.swift
//  materiomoni
//
//  Created by Utsav busa on 23/11/22.
//

import UIKit

protocol chagearray{
    func changearrayvalue(value:[Users],Screen:String)
}

class SearchViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var slecetchangevalue : chagearray?
    
    
    @IBOutlet weak var GenderSegmentOutlet: UISegmentedControl!
    
    @IBOutlet weak var CastOutlet: UITextField!
    
    @IBOutlet weak var AgeGroup1: UITextField!
    
    @IBOutlet weak var AgeGroup2: UITextField!
    
    
    
    var SelectGender:String = "All"
    var Castes:[Caste] = []
    var selectedCaste:String = ""
    var Castpiker: UIPickerView = UIPickerView()
    var usersArrayOfSearch:[Users] = []
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Castpiker.delegate = self
        Castpiker.dataSource = self
        
        
        CastOutlet.inputView = Castpiker
        Castes = CasteDAL.getUser()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func GenderSelectionAction(_ sender: Any) {
        
        switch  GenderSegmentOutlet.selectedSegmentIndex {
        case 0:
            SelectGender = "All"
        case 1:
            SelectGender = "Male"
        default :
            SelectGender = "Female"
        }
        
    }
    
    
    @IBAction func SearchBtnAction(_ sender: Any) {
        
        print(Int(AgeGroup2.text ?? "0") )
        
        usersArrayOfSearch = UserDAL.Search(Gender: SelectGender, Caste: selectedCaste, Age1: Int(AgeGroup1.text ?? "") ?? 0, Age2: Int(AgeGroup2.text ?? "") ?? 0)

        print(SelectGender)
        print(selectedCaste)
        print(usersArrayOfSearch.count)
       

        self.slecetchangevalue?.changearrayvalue(value: usersArrayOfSearch,Screen: "Search")
        
        self.navigationController?.popViewController(animated: true)
        
      
        
    }
    
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
        CastOutlet.text = c.CasteName
        selectedCaste = c.CasteName
        CastOutlet.resignFirstResponder()
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
