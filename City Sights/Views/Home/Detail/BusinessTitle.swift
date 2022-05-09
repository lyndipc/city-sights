//
//  BusinessTitle.swift
//  City Sights
//
//  Created by Lyndi Castrejon on 5/8/22.
//

import SwiftUI

struct BusinessTitle: View {
    
    var business: Business
    
    var body: some View {
        
        VStack(alignment: .leading) {
         
            // Business Name
            Text(business.name!)
                .font(.largeTitle)
            
            // Address
            if business.location?.displayAddress != nil {
                ForEach((business.location?.displayAddress)!, id: \.self) { displayLine in
                    
                    Text(displayLine)
                }
            }
            
            // Rating
            Image("regular_\(business.rating ?? 0)")
        }
    }
}
