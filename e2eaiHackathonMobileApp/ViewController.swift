//
//  ViewController.swift
//  e2eaiHackathonMobileApp
//
//  Created by Yusuf Özgül on 19.12.2019.
//  Copyright © 2019 Yusuf Özgül. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var text: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func getResultButton(_ sender: Any)
    {
        getResult(key: text.text) { (value) in
            DispatchQueue.main.async {
                self.text.text = value
            }
            
        }
    }

    func getResult(key: String, completion: @escaping (String) -> Void)
    {
        let url = URL(string: "http://http://40.121.157.250/\(key)")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            guard let data = data else { return }
            completion(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
}

