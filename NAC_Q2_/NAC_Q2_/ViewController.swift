//
//  ViewController.swift
//  NAC_Q2_
//
//  Created by Usuário Convidado on 13/09/19.
//  Copyright © 2019 rm81549. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var txtInput: UILabel!
    
    @IBOutlet weak var txtAnotation: UITextField!
    let defaults = UserDefaults.standard
    let identifierArray = "lista"
    
    

    var items: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        items = ["Apple", "Pineapple", "Orange", "Blackberry", "Banana", "Pear", "Kiwi", "Strawberry", "Mango", "Walnut", "Apricot", "Tomato", "Almond", "Date", "Melon", "Water Melon", "Lemon", "Coconut", "Fig", "Passionfruit", "Star Fruit", "Clementin", "Citron", "Cherry", "Cranberry"]
        // Do any additional setup after loading the view.
        UserDefaults.standard
        defaults.set(items, forKey: identifierArray)
        items = defaults.stringArray(forKey: identifierArray) ?? [String]()
        showItems()
        
    }
    
    @IBAction func addNewAnotation(_ sender: Any) {
        items.append(txtAnotation.text ?? "")
        defaults.set(items, forKey: identifierArray)
        items = defaults.stringArray(forKey: identifierArray) ?? [String]()
        showItems()
    }
    
    func showItems(){
        var text = ""
        for item in items {
            text += item
            text += "\n"
        }
        txtInput.text = text
    }
    
    
    
    
}

