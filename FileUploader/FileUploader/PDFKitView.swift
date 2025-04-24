//
//  PDFKitView.swift
//  FileUploader
//
//  Created by 김규철 on 4/24/25.
//

import PDFKit
import SwiftUI

struct PDFKitView: UIViewRepresentable {
    let pdf: PDFDocument
    
    func makeUIView(context: UIViewRepresentableContext<PDFKitView>) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: UIViewRepresentableContext<PDFKitView>) {
        DispatchQueue.main.async {
            uiView.document = pdf
        }
    }
}
