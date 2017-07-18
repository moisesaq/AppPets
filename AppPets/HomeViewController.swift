//
//  ViewController.swift
//  AppPets
//
//  Created by Moises on 7/15/17.
//  Copyright © 2017 Moises. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    let baseUrl = "http://petstore.swagger.io/v2/pet/findByStatus?status="
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func testSomething(_ sender: Any) {
        /*Pet.testFunction(data: "hello"){ (result: String) in
            print(result)
        }*/
        Pet.findPetsByStatus(status: "sold"){ (results: [Pet]) in
            var textResult = ""
            for result in results{
                print("\(result)\n")
                textResult += "\(result.name) | \(result.category.name) | \(String(describing: result.photos.first))\n"
            }
            DispatchQueue.main.async {
                self.resultLabel.text = textResult
            }
        }
        
        /*DispatchQueue.global(qos: .userInteractive).async {
            
        }*/
    }
    
}

