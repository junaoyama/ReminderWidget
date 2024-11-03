//
//  RemindWidgetBundle.swift
//  RemindWidget
//
//  Created by jun on 2024/11/03.
//

import WidgetKit
import SwiftUI

@main
struct RemindWidgetBundle: WidgetBundle {
    var body: some Widget {
        RemindWidget()
        RemindWidgetControl()
        RemindWidgetLiveActivity()
    }
}
