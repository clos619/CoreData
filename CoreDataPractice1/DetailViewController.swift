//
//  DetailViewController.swift
//  CoreDataPractice1
//
//  Created by Field Employee on 12/30/20.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var moveLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var attunementLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var type: String = "loading type"
    var move: String?
    var name: String?
    var height: String?
    var weight: String?
    var age: String?
    var attunement: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.typeLabel.text = self.type
        self.moveLabel.text = self.move
        self.nameField.text = self.name
        self.heightLabel.text = height
        self.weightLabel.text = weight
        self.attunementLabel.text = attunement
        self.ageLabel.text = age
        

        
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
