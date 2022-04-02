//
//  Extensions-SwiftUI.swift
//  
//
//  Created by Mahesh Rathod on 2/04/22.
//

import Foundation
import SwiftUI

extension GeometryProxy {
    var maxWidth: CGFloat {
        size.width - safeAreaInsets.leading - safeAreaInsets.trailing
    }
}

