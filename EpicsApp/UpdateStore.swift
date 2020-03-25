//
//  UpdateStore.swift
//  EpicsApp
//
//  Created by Carlo Forrest Dormiendo on 2020-03-23.
//  Copyright © 2020 Carlo Forrest Dormiendo. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}
