//
//  ViewController.swift
//  AppPets
//
//  Created by Moises on 7/15/17.
//  Copyright © 2017 Moises. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var petList: [Pet] = []
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    let statusDefault = "pending"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPets(status: statusDefault)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func testSomething(_ sender: Any) {
        
    }
    
    func loadPets(status: String){
        showActivityIndicator()
        clearList()
        Pet.findPetsByStatus(status: status){ (results: [Pet]) in
            for result in results{
                print("\(result)\n")
            }
            
            self.petList = results
            DispatchQueue.main.async {
                self.hideActivityIndicator()
                self.tableView.reloadData()
            }
        }
        
        /*DispatchQueue.global(qos: .userInteractive).async {
         
         }*/
    }
    
    func clearList(){
        if petList.count > 0 {
            petList.removeAll()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.petName.text = petList[indexPath.row].name
        cell.petCategory.text = petList[indexPath.row].category.name
        return (cell)
    }
    
    
    func showActivityIndicator(){
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func hideActivityIndicator(){
        activityIndicator.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
    
    @IBAction func showAlertFilter(_ sender: Any) {
        let alert = UIAlertController(title: "Select status", message: nil, preferredStyle: .alert)
        
        let pendingAction = UIAlertAction(title: "Pending", style: .default) { action in
            self.loadPets(status: "pending")
        }
        
        let soldAction = UIAlertAction(title: "Sold", style: .default) { action in
            self.loadPets(status: "sold")
        }
        
        let availableAction = UIAlertAction(title: "Available", style: .default) { action in
            self.loadPets(status: "available")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(pendingAction)
        alert.addAction(soldAction)
        alert.addAction(availableAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
        
    }
}

