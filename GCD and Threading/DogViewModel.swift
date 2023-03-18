//
//  DogViewModel.swift
//  ThreadingAndGCD
//
//  Created by Stewart Lynch on 2020-06-11.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

class DogViewModel: ObservableObject {
    @Published private(set) var image: UIImage? = nil
    
    func getDog() {
        Log.location(fileName: #file)
        let url = "https://dog.ceo/api/breeds/image/random"
        let decoder = JSONDecoder()
        self.image = nil
        DispatchQueue.global(qos: .userInteractive).async {
            Log.queue(action: "Fetching JSON")
            guard let jsonURL = URL(string: url) else {
                fatalError("Invalid url")
            }
            guard let imageJSON = try? Data(contentsOf: jsonURL) else {
                fatalError("Could not get data from jsonURL")
            }
            guard let thisDog = try? decoder.decode(Dog.self, from: imageJSON) else {
                fatalError("There must be a problem decoding....")
            }
            guard let imageURL = URL(string: thisDog.imageURL) else {
                fatalError("Dog imageURL is invalid")
            }
            Log.queue(action: "Fetching Image")
            guard let imageData = try? Data(contentsOf: imageURL) else {
                fatalError("Can't get dog image data")
            }
            sleep(2)
            DispatchQueue.main.async {
                Log.queue(action: "Updating UI")
                self.image =  UIImage(data: imageData)
            }
        }
    }
    
    func getDogWithSession() {
        Log.location(fileName: #file)
        let url = "https://dog.ceo/api/breeds/image/random"
        let decoder = JSONDecoder()
        let session = URLSession.shared
        self.image = nil
        guard let jsonURL = URL(string: url) else {
            fatalError("Invalid url")
        }
        session.dataTask(with: jsonURL) { (data, _, error) in
            Log.queue(action: "Fetching JSON")
            if let error = error {
                fatalError(error.localizedDescription)
            }
            guard let imageJSON = try? Data(contentsOf: jsonURL) else {
                fatalError("Could not get data from jsonURL")
            }
            guard let thisDog = try? decoder.decode(Dog.self, from: imageJSON) else {
                fatalError("There must be a problem decoding....")
            }
            guard let imageURL = URL(string: thisDog.imageURL) else {
                fatalError("Dog imageURL is invalid")
            }
            Log.queue(action: "Fetching Image")
            guard let imageData = try? Data(contentsOf: imageURL) else {
                fatalError("Can't get dog image data")
            }
            sleep(2)
            DispatchQueue.main.async {
                Log.queue(action: "Updating UI")
                self.image =  UIImage(data: imageData)
            }
        }.resume()
    }
}




