//
//  TransfersViewModel.swift
//  MoneyMagnet
//
//  Created by CodeLabs on 2023-09-30.
//

import SwiftUI

class TransfersViewModel: ObservableObject {
    @Published var showFilterTime = false
    @Published var showFilterType = false
    @Published var filterTime = 0
    @Published var filterType = 0
    @State var filterTypes = ["Today", "Month", "Year"]
}
