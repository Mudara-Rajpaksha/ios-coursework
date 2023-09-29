//
//  HomeViewModel.swift
//  MoneyMagnet
//
//  Created by CodeLabs on 2023-09-30.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var showFilterTime = false
    @Published var showReportSelect = false
    @Published var filterTime = 0
    @Published var reportType: Bool = false
    @State var filterTypes = ["Today", "Month", "Year"]
    @Published var jumpToReport: Bool = false
}
