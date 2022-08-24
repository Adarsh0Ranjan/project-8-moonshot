//
//  Bundle-Deecodable.swift
//  project-8-views
//
//  Created by Roro Solutions on 27/07/22.
//

import Foundation
extension  Bundle {
    func decode<T: Codable>(_ file: String) -> T { //There is a big difference between T and [T]. Remember, T is a placeholder for whatever type we ask for, so if we say “decode our dictionary of astronauts,” then T becomes [String: Astronaut]. If we attempt to return [T] from decode() then we would actually be returning [[String: Astronaut]] – an array of dictionaries of astronauts!
            guard let url = self.url(forResource: file, withExtension: nil) else {
                fatalError("Failed to locate \(file) in bundle.")
            }

            guard let data = try? Data(contentsOf: url) else {
                fatalError("Failed to load \(file) from bundle.")
            }

            let decoder = JSONDecoder()
            let formatter = DateFormatter()
            formatter.dateFormat = "y-MM-dd"
            decoder.dateDecodingStrategy = .formatted(formatter)

            guard let loaded = try? decoder.decode(T.self, from: data) else {
                fatalError("Failed to decode \(file) from bundle.")
            }

            return loaded
        }
}
//extension Bundle {
//    func decode(_ file: String) -> [String: Astronaut] {
//        guard let url = self.url(forResource: file, withExtension: nil) else {
//            fatalError("Failed to locate \(file) in bundle.")
//        }
//
//        guard let data = try? Data(contentsOf: url) else {
//            fatalError("Failed to load \(file) from bundle.")
//        }
//
//        let decoder = JSONDecoder()
//
//        guard let loaded = try? decoder.decode([String: Astronaut].self, from: data) else {
//            fatalError("Failed to decode \(file) from bundle.")
//        }
//
//        return loaded
//    }
//}
