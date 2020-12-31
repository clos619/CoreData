//
//  ViewController.swift
//
//  Created by Field Employee on 12/28/20.
//

import UIKit
import CoreData

protocol DataSendingDelegate{
    func sendUserInfo(data: String)

}

class ViewController: UIViewController {
    

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var coreTableView: UITableView!
    var champ = [Champion]()
    var delegate: DataSendingDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.coreTableView.delegate = self
        self.coreTableView.dataSource = self
        
        self.getChampions()
        self.getChampionDetails()

        
    
    }
    func getChampions(){
        
        do{
            self.champ = try context.fetch(Champion.fetchRequest())
            
            DispatchQueue.main.async {
                self.coreTableView.reloadData()
            }
        }catch{
            
        }
    }
    func getChampionDetails(){
        do{
            let request : NSFetchRequest<Champion> = Champion.fetchRequest()
            request.predicate = NSPredicate(format: "name == %@")
            let champions = try context.fetch(Champion.fetchRequest())
            for i in champions{
                print(champ[0].name!)
            }
        }catch{
            print("couldnt fetch champion details")
        }
    }


    @IBAction func viewDetails(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle:  nil)
                let detailVC = storyboard.instantiateViewController(identifier: "DetailViewController") as! DetailViewController

        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @IBAction func addChampion(_ sender: Any) {
        let alert = UIAlertController(title: "Add Champion", message: "Enter Details", preferredStyle: .alert)
        alert.addTextField()
        alert.addTextField()
        alert.addTextField()
        alert.addTextField()
//        alert.addTextField()
//        alert.addTextField()
//        alert.addTextField()
//        alert.addTextField()
        let submitButton = UIAlertAction(title: "Add", style: .default){
            (action) in
            
            let textField = alert.textFields![0]
            let ageField = alert.textFields![1]
            let attunementField = alert.textFields![2]
//            let heightField = alert.textFields![3]
//            let weightField = alert.textFields![4]
            let moveField = alert.textFields![3]
//            let typeField = alert.textFields![6]
            
            
            let newChamp = Champion(context: self.context)
            newChamp.name = textField.text
            newChamp.age = ageField.text
            newChamp.attunement = attunementField.text
//            newChamp.height = Int32(heightField.text!)!
//            newChamp.weight = Int32(weightField.text!)!
            newChamp.move = moveField.text
//            newChamp.type = typeField.text
           
            do{
                try self.context.save()
            }catch{
                print("didnt save")
            }
            self.getChampions()
            

            
        }
        
        alert.addAction(submitButton)
        
        self.present(alert, animated: true, completion: nil)
    }
    }
    

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let champion = self.champ[indexPath.row]
        
        let alert = UIAlertController(title: "EDIT", message: "EDIT NAMES", preferredStyle: .alert)
        alert.addTextField()
        
        let textField = alert.textFields![0]
        textField.text = champion.name
        
        let saveButton = UIAlertAction(title: "Save champ", style: .default){(action)in}
        alert.addAction(saveButton)
        self.present(alert, animated: true, completion: nil)
        
        let detailVC = DetailViewController()
        detailVC.nameField.text = champ[indexPath.row].name


    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete"){(action,view,completionHandler) in
            
            let deadChampion = self.champ[indexPath.row]
            
            self.context.delete(deadChampion)
            
            do{
                try self.context.save()
                
            }catch{
                print("couldnt delete")
                
            }
            self.getChampions()
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
}
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return champ.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = coreTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let champ = self.champ[indexPath.row]
        
        cell.textLabel?.text = champ.name
        return cell
    }
}
