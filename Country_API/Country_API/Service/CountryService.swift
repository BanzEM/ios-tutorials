//
//  CountryService.swift
//  Country_API
//
//  Created by Bandisile Mazomba on 2026/09/04.
//

import Foundation

class CountryService {
    let YOUR_API_KEY = "rc_live_bba3041097914edc99dfe98a5942dedd"
    
    
    var stringURL: String {
        return "https://api.restcountries.com/countries/v5?q=canada&api-key=\(YOUR_API_KEY)"
    }
    
    func fetchCountries ( completion: @escaping (CountryData?, Error? ) -> Void) {
        
        guard let url = URL(string: stringURL) else {
            
            completion( nil, NSError(domain: "INVALID URL", code: 0, userInfo: nil))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else{
                completion(nil, error)
                return
            }
            
            do {
                self.prettyPrintJSON(data)
                let decoder = JSONDecoder()
                
                let result: DataObject = try decoder.decode(DataObject.self, from: data )
                completion(result.data, nil)
                
            } catch{
                completion(nil, error)
            }
            
        }
        
        task.resume()
    }
    
    
    
    func prettyPrintJSON(_ data: Data) {
        do {
            let object = try JSONSerialization.jsonObject(with: data)
            let prettyData = try JSONSerialization.data(
                withJSONObject: object,
                options: [.prettyPrinted, .sortedKeys]
            )

            print(String(data: prettyData, encoding: .utf8) ?? "")
        } catch {
            print("Invalid JSON:", error)
        }
    }
}
