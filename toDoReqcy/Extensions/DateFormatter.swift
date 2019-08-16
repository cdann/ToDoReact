//
//  DateFormatter.swift
//  toDoReqcy
//
//  Created by celine dann on 16/08/2019.
//  Copyright © 2019 celine dann. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let momentjsDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E MMM dd yyyy HH:mm:ss 'GMT'Z '(UTC)'"
        return formatter
    }()
}
