//
//  getNewsData.swift
//  newsapi
//
//  Created by iosdev on 30.11.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import Foundation
func getNewsData() {
    
    guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=664a6a8d61ab454b97f9d1081641d131")
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

    
    

