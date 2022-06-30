//
//  Bundle-Decodable.swift
//  MoonShot
//
//  Created by Hitesh Suthar on 17/06/22.
//

//                                  Importing JSON include 4 steps


/*                              1. Locate the file in the Bundle using URl
                                2. Load the file into a Data Instance (data)
                                3. Decode the file in the required format ([String: Astronaut]) into some Instance (loaded) from  the Data Instance (data)
                                4. return the Instance (loaded)
*/
import Foundation
extension Bundle {

    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else { //self here refers to bundle class.
                                                                               //if file doesnt exist then url returns nil.
            
                                                                                //guard-let checks if the variable contains a value or nil
            fatalError("Failed to locate \(file) in bundle")
        }
        guard let data = try? Data(contentsOf: url) else { //data is data type that can store various type of data
                                                            // Try? doesnt need do catch. If the operation fails, the method returns nil, If the operation succeeds, the optional contains a value.
            fatalError("failed to load \(file) bundle")
        }
        let decoder = JSONDecoder()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-mm-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else { //.decode only decode object that conform to Codable
            fatalError("Failed to decode \(file) from bundle")
        }
        return loaded
    }
}
