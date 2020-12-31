//
//  DetailViewController.swift
//  CoreDataPractice1
//
//  Created by Field Employee on 12/30/20.
//

import UIKit



class DetailViewController: UIViewController, DataSendingDelegate {
    
    

    @IBOutlet weak var nameField: UITextField!
    
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var moveLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var attunementLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = ViewController()
        
        
    }
    func sendUserInfo(data: String) {
        nameField.text = data
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showData"{
            let vc: ViewController = segue.destination as! ViewController
            vc.delegate = self
        }
    }

}
