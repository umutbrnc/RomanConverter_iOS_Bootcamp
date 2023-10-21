//
//  String+Extension.swift
//  RomanConverter
//
//  Created by Emincan Antalyalı on 14.10.2023.
//

import UIKit

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
