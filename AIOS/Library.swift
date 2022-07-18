//
//  Library.swift
//  AIOS
//
//  Created by Serge Kotov on 16.07.2022.
//

import Foundation

/// Return true for given probability in range 0...1
/// - Parameter r: chance from 0.0 to 1.0
/// - Returns: true, if a random value included in range from 0 to r,
/// otherwise returns false
func chance(_ r: Float) -> Bool {
    guard r > 0 else { return false }
    guard r < 1 else { return true }
    
    let c = Float.random(in: 0...1)
    return c < r ? true : false
}
