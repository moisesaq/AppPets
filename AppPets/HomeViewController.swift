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
            self.resultLabel.text = results[1].name
            for result in results{
                print("\(result)\n")
            }
        }
    }
    
    func getPets(status: String?) {
        guard let status = status else{
            print("String is nil")
            return
        }
        print(status)
        
        let textUrl = baseUrl + status
        guard let url = URL(string: textUrl)  else { return }
        
        /*var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")*/
        let session = URLSession.shared
        session.dataTask(with: url){(data, response, error) in
            if let response = response{
                print(response)
            }
            
            if let data = data{
                print(data)
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch{
                    print(error)
                }
            }
            
        }.resume()
    }
    
}

