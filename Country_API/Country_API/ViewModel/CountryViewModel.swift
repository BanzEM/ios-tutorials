//
//  CountryViewModel.swift
//  Country_API
//
//  Created by Bandisile Mazomba on 2026/09/04.
//

import Foundation
import Combine


class CountryViewModel: ObservableObject {
    
    @Published var countries: CountryData?
    @Published var vmError: String?
    
    private let service = CountryService()
    
    
    
    func getCountries() {
        
        
        service.fetchCountries { [weak self] country, error  in
            
            DispatchQueue.main.async{
                
                guard error == nil  else{
                    self?.vmError = error?.localizedDescription ?? "failed to fetch country"
                    return
                }
                
                guard let country else {
                    self?.vmError = error?.localizedDescription
                    return
                }
                
                self?.countries = country
            }
            
            
        }
        
        
        
    }
    
    
    
}
