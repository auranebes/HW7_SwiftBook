//
//  GridView.swift
//  HW7_SwiftBook
//
//  Created by Arslan Abdullaev on 09.03.2022.
//

import SwiftUI

struct GridView<Content, T>: View where Content : View {
    
    let columns: Int
    let items: [T]
    let content: (T, CGFloat) -> Content
    
    var rows: Int {
        items.count / columns
    }
    
    var body: some View {
        GeometryReader { geometry in
            
            let sideSize = geometry.size.width / CGFloat(columns)
            
            ScrollView {
                VStack {
                    ForEach(0...rows, id: \.self) { rowIndex in
                        HStack {
                            ForEach(0..<columns) { columnIndex in
                                if let index = indexFor(row: rowIndex, column: columnIndex) {
                                    content(items[index], sideSize)
                                        .frame(width: sideSize, height: sideSize)
                                } else {
                                   Spacer()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    init(columns: Int, items: [T], content: @escaping (T, CGFloat) -> Content) {
        self.columns = columns
        self.items = items
        self.content = content
    }
    
    private func indexFor(row: Int, column: Int) -> Int? {
        let index = row * columns + column
        return index < items.count ? index : nil
    }
    
}

struct CustomGridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(columns: 3, items: [11, 3, 4, 7, 76, 2, 1]) { item, sideSize  in
            Text("\(item)")
                .frame(width: sideSize, height: sideSize)
        }
    }
}
