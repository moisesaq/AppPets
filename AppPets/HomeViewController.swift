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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func testSomething(_ sender: Any) {
        showActivityIndicator()
        Pet.findPetsByStatus(status: "sold"){ (results: [Pet]) in
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
        /*let alert = AlertPickerView(title: "Filter", message: nil, preferredStyle: .alert)
        self.present(alert, animated: true)*/
    }
}

