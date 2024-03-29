//
//  ViewController.swift
//  NAC_Q1
//
//  Created by Usuário Convidado on 13/09/19.
//  Copyright © 2019 rm81549. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtId: UITextField!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtCompleted: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func searchId(_ sender: Any) {
        doHttpGet(urlPath: "https://jsonplaceholder.typicode.com/todos/\(txtId.text ?? "1")")
    }
    
    
    func doHttpGet(urlPath: String){
        let url = URL(string: urlPath)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                        //let jsondata = json?["data"] as? [String:Any]
                        
                        for item in json!{
                            print(item.value)
                            if item.key == "title"{
                                self.txtTitle.text = item.value as? String
                                
                            }
                            else if item.key == "completed"{
                                let completed = item.value as? Bool
                                self.txtCompleted.text = completed ?? false ? "true": "false"
                             }
                            
                        }
                        
                    } catch let error as NSError {
                        print("Failed to load: \(error.localizedDescription)")
                    }
                }
            }
            
        }
        task.resume()
    }


}

