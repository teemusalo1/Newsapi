//
//  ViewController.swift
//  newsapi
//
//  Created by iosdev on 30.11.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {


    @IBOutlet weak var tbv: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "The List"
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "TCell")
        
            guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=2e74625e86ac4c50a2a11e4440a2383f")
         else {
            fatalError("failed to create URL")
        }

        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            if error != nil {
                print("Client error (error)")
            }
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                return
            }

            guard let data2 = data else {
                return
            }

            do {
                let decoder = JSONDecoder()
              let news = try decoder.decode(News.self, from: data2)


               print(news)


            } catch let err {
                print("Error", err)
            }

        }
        task.resume()

        }
    // Do any additional setup after loading the view.
    }

