//
//  ViewController.swift
//  UserSessionData
//  nombre y apellidos: Joshua Juarbe
//  id de estudiante: 18-06110744
//  código del curso: ITP2340
//  fecha de entrega: Abril 26, 2020
//  Copyright © 2020 Joshua Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    
    
//Se establecen los elementos que se estan añadiendo desde el Main.storyboard
    @IBOutlet var saveButton: UIButton!
    
    @IBOutlet var deleteButton: UIButton!
    
    @IBOutlet var firstName: UITextField!
    
    @IBOutlet var lastName: UITextField!
    
    @IBOutlet var pickerView: UIPickerView!
    
    @IBOutlet var datePicker: UIDatePicker!
    
    @IBOutlet var dobLabel: UILabel!

    var favoriteColor: Int! = 0
    
    var pickerDataSource = ["Red", "Blue", "Violet", "Yellow", "Green", "White"]
    
    var gradientLayer: CAGradientLayer!
    
    var dob: String! = ""
    
    var dobString: String? = ""
    
    var dateFormatter = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
// Programación para escoger la fecha de nacimiento
    @IBAction func datePickerAction(_ sebder: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        
        let strDate = dateFormatter.string(from: datePicker.date)
        
        let calendar: Calendar = Calendar.current
        
        let ageComponents = (calendar as NSCalendar).components( .year, from:  datePicker.date, to: Date(), options: [])
        
        print (ageComponents.year!)
        
        self.dobLabel.text = "DOB: " + strDate + " (" + String(describing: ageComponents.year!) + " year's old)"
        
        self.dob = strDate
        print ("EHM --> datePickerAction() self.dob = " + self.dob)
        
    }
    // Programación para el botón de "delete"
    func deleteButtonClick(_ sender: AnyObject) {
        if (firstName.text == "") {
            loadDataDefaults()
            
            deleteButton.setTitle("Delete Data", for: UIControlSate())
            
        } else {
            firstName.text = ""
            lastName.text = ""
            
            favoriteColor = 5
            
            pickerView.selectRow(favoriteColor, inComponent: 0, animated: true)
            
            self.dobLabel.text = "Date of Birth"
            
            self.view.backgroundColor = UIColor.white;
            
            dateFormatter = DateFormatter()
            
            dateFormatter.dateFormat = "dd-MMM-yyyy"
            
            let todayDate = dateFormatter.string(from: Date())
            
            let dobNSDate = dateFormatter.date(from: todayDate)
            
            self.datePicker.setDate(dobNSDate!, animated: false)
            
            self.datePicker.maximumDate = Date()
            
            deleteButton.setTitle("Load Data", for: UIControl.State())
            
       // Programación para el botón de "save"
        }
        
        func saveButtonClick(_ sender: AnyObject) {
            
            let defaults = UserDefaults.standard
            
            defaults.set(firstName.text, forKey: "firstName")
            
            defaults.set(lastName.text, forKey: "lastName")
            
            defaults.set(favoriteColor, forKey: "favoriteColor")
            
            defaults.set(self.dob.uppercased(), forKey: "dob")
            
            defaults.synchronize()
            
            let filename: String! = "filedata.txt"
            
            var file_read: String! = ""
            
            let file_write: String! = firstName.text! + ", " + lastName.text! + ", " + String(self.favoriteColor) + ", " + self.dob!.uppercased()
            
            let dirs : [String] = (NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask, true))
            
            let dir = dirs[0] //doucuments directory
            
            print ("EHM --> dir = \(dir)")
            
            let path = URL(fileURLWithPath: dir).appendingPathComponent(filename)
            
            do {
                try file_write!.write(to: path, atomically: false, encoding: String.Encoding.utf8)
                
            }
            
            catch let error as NSError {
                
                print ("EHM --> Error Writing file. ERROR: \(error.localizedDescription)")
            }
            
            do {
                file_read = try NSString(contentsOf: path, encoding: String.Encoding.utf8.rawValue) as String
                
                print ("EHM -->> file_read = \(file_read)")
            }
            catch let error as NSError {
                print ("EHM -->> Error Reading file. ERROR: \(file_read) - \(error.localizedDescription)")
            }
            
            print("EHM -->> saveButtonClick() firstName = \(String(describing: firstName.text))")
             print("EHM -->> saveButtonClick() lastName = \(String(describing: lastName.text))")
            print("EHM -->> saveButtonClick() favoriteColor = \(favoriteColor)")
            print("EHM -->> saveButtonClick() dob = \(datePicker.date)")
            
             print("EHM -->> saveButtonClick() file_read = \(file_read)")
            
            
            
            
        }
        
        func loadDatadefaults() {
            print ("EHM loadDataDefaults() Start !!! ")
            let defaults = UserDefaults.standard
            
            firstName.text = defaults.object(forKey: "firstName") as? String
            lastName.text = defaults.object(forKey: "lastName") as? String
            
            favoriteColor  = defaults.object(forKey: "favoriteColor") as? Int
            
            if (favoriteColor == nil) {
                favoriteColor = 0
                
            }
            pickerView.selectRow(favoriteColor, inComponent: 0, animated: true)
            
            if (favoriteColor == 0)
            {
                self.view.backgroundColor = UIColor.red;
            }
            else if (favoriteColor == 1)
            {
                self.view.backgroundColor = UIColor.blue;
            }
            else if ( favoriteColor == 2)
            {
                self.view.backgroundColor = UIColor.purple;
            }
            else if (favoriteColor == 3)
            {
                self.view.backgroundColor = UIColor.yellow;
            }
            else if (favoriteColor == 4)
            {
                self.view.backgroundColor = UIColor.green;
            }
            else
            {
                self.view.backgroundColor = UIColor.white;
            }
            
            dateFormatter.dateFormat = "dd-MMM-yyyy"
            
            dobString = dateFormatter.string(from: datePicker.date)
            
            dobString = (defaults.object(forKey: "dob") as? String)
            
            if (dobString == "") {
                dobString = dateFormatter.string(from: Date())
            }
            
            if (dobString == nil) {
                
                dobString = dateFormatter.string(from: Date())
            }
            
            print ("EHM loadDataDefaults() ----> dobString (after) = " + dobString!)
            
            let dobNSDate = dateFormatter.date(from: dobString!)
            
            self.datePicker.maximumDate = Date()
            
            print("EHM -->> loadDataDefaults() firstName = \(String(describing: firstName.text))")
             print("EHM -->> loadDataDefaults() lastName = \(String(describing: lastName.text))")
             print("EHM -->> loadDataDefaults() favoriteColor = \(favoriteColor)")
             print("EHM -->> loadDataDefaults() dobString = \(String(describing: dobString))")
             print("EHM -->> loadDataDefaults() dobNSDate = \(String(describing: dobNSDate))")
            
            print ("EHM loadDataDefaults() End !!! ")
        }
        
        func numerOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return pickerDataSource.count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return pickerDataSource[row]
        }
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            self.favoriteColor = row
            if (row == 0)
            {
                self.view.backgroundColor = UIColor.red;
            }
            else if (row == 1)
            {
                self.view.backgroundColor = UIColor.blue;
            }
            else if (row == 2)
            {
                self.view.backgroundColor = UIColor.purple;
            }
            else if (row == 3)
            {
                self.view.backgroundColor = UIColor.yellow;
            }
            else if (row == 4)
            {
                self.view.backgroundColor = UIColor.green;
            }
            else
            {
                self.view.backgroundColor = UIColor.white;
            }
        }
        
        func createGradientLayer() {
            gradientLayer = CAGradientLayer()
            
            gradientLayer.frame = self.view.bounds
            gradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
            self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
        func viewDidLoad() {
            super.viewDidLoad()
            
            saveButton.layer.cornerRadius = 5
            saveButton.layer.borderWidth = 0.5
            
            deleteButton.layer.cornerRadius = 5
            deleteButton.layer.borderWidth = 0.5
            
            self.pickerView.dataSource = self;
            self.pickerView.delegate = self;
            
            loadDataDefaults()
        }
        
        func didRecieveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        

}

}
//le envié el codigo aun teniendo errores ya que seguí las instrucciones presentadas, intenté de arreglar los errores pero no tuve exito. Me disculpo
