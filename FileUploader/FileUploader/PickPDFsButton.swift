//
//  ContentView.swift
//  FileUploader
//
//  Created by 김규철 on 4/24/25.
//

import SwiftUI
import UniformTypeIdentifiers
import PDFKit

struct ContentView: View {
    @State private var docData: Data?
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            PickPDFsButton() {
                do {
                    let docData = try Data(contentsOf:$0)
                    self.docData = docData
                    
                } catch {
                    print(error)
                }
            }
            
            if docData != nil { // URL이 있을 경우에만 버튼 표시
                Button("PDF 보기") {
                    isPresented = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
        }
        .background(Color.white)
        .sheet(isPresented: $isPresented) {
            if let url = docData, let pdfDocument = PDFDocument(data: docData ?? Data()) {
                PDFKitView(pdf: pdfDocument)
                    .frame(maxWidth: .infinity, maxHeight: 500)
                    .background(.white)
            } else {
                Text("PDF를 불러올 수 없습니다")
                    .padding()
            }
        }
    }
}

struct PickPDFsButton: View {
     @State private var showFileImporter = false
    var handlePickedPDF: (URL) -> Void


     var body: some View {
         Button {
             showFileImporter = true
         } label: {
             Label("Choose PDFs to combine", systemImage: "doc.circle")
         }
         .fileImporter(
             isPresented: $showFileImporter,
             allowedContentTypes: [.item],
             allowsMultipleSelection: true
         ) { result in
             switch result {
             case .success(let files):
                 files.forEach { file in
                     // gain access to the directory
                     let gotAccess = file.startAccessingSecurityScopedResource()
                     if !gotAccess { return }
                     // access the directory URL
                     // (read templates in the directory, make a bookmark, etc.)
                         handlePickedPDF(file)
                     // release access
                     file.stopAccessingSecurityScopedResource()
                 }
             case .failure(let error):
                 // handle error
                 print(error)
             }
         }
     }
 }

#Preview {
    PickPDFsButton() {
        print($0)
    }
}
