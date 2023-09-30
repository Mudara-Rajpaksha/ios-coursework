//
//  ReportTransferViewModel.swift
//  MoneyMagnet
//
//  Created by CodeLabs on 2023-09-30.
//

import Foundation
import UIKit

class ReportTransferViewModel: ObservableObject {
    @Published var isError: Bool = false
    
    func uploadToStorage(selectedImage: UIImage){
        ImageUploadUtils.uploadImage(selectedImage: selectedImage) { downloadURL in
            if let downloadURL = downloadURL {
                print("Download URL: \(downloadURL)")
            } else {
                print("Error uploading image or getting download URL.")
            }
        }
    }
}
