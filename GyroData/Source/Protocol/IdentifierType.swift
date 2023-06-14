//
//  IdentifierType.swift
//  GyroData
//
//  Created by kimseongjun on 2023/06/14.
//

import UIKit

public protocol IdentifierType {
    static var identifier: String { get }
}

extension IdentifierType {
    public static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: IdentifierType {}
