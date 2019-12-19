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
        var term = key
        term = term.replacingOccurrences(of: " ", with: "%20")
        term = term.replacingOccurrences(of: "ü", with: "%C3%BC")
        term = term.replacingOccurrences(of: "ş", with: "%C5%9F")
        term = term.replacingOccurrences(of: "ı", with: "%C4%B1")
        term = term.replacingOccurrences(of: "Ö", with: "%C3%96")
        term = term.replacingOccurrences(of: "Ç", with: "%C3%87")
        term = term.replacingOccurrences(of: "ğ", with: "%C4%9F")
        term = term.replacingOccurrences(of: "Ş", with: "%C5%9E")
        term = term.replacingOccurrences(of: "İ", with: "%C4%B0")
        term = term.replacingOccurrences(of: "ç", with: "%C3%A7")
        
        let url = URL(string: "http://40.121.157.250/\(term)")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            guard let data = data else { return }
            completion(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
}

