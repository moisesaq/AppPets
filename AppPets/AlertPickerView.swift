//
//  AlertPickerView.swift
//  AppPets
//
//  Created by Moises on 7/19/17.
//  Copyright © 2017 Moises. All rights reserved.
//

import Foundation
import UIKit

class AlertPickerView: UIAlertController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    let status = ["available", "pending", "sold"]
    let statusPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //statusPicker.center = view.center
        statusPicker.delegate = self
        statusPicker.dataSource = self
        self.view.addSubview(statusPicker)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return status.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return status[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
}
