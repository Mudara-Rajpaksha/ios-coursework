//
//  ReportCategoryViewModel.swift
//  MoneyMagnet
//
//  Created by CodeLabs on 2023-09-30.
//

import SwiftUI

class ReportCategoryViewModel: ObservableObject {
    @Published var selectedIndex: Int = 0
    @State var expenseCategories = ["Food and Dining", "Shopping", "Housing", "Utilities", "Shopping", "Healthcare", "Travel", "Subscriptions", "Other"]
    @State var incomeCategories = ["Salary", "Bonuses", "Investment", "Other"]
}
