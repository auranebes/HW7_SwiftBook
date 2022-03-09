//
//  ShapeView.swift
//  HW7_SwiftBook
//
//  Created by Arslan Abdullaev on 09.03.2022.
//

import SwiftUI

struct AwardsView: View {
    let shapes = Award.getShapes()
    let columns = [GridItem(.adaptive(minimum: 160, maximum: 200))]
    
    var body: some View {
        NavigationView {
            GridView(columns: 2, items: shapes, content: { shape, sideSize in
                VStack{
                    shape.awardView
                    Text(shape.title)
                }.frame(width: sideSize, height: sideSize)
            })
            .navigationTitle("Your Awards: " + String(shapes.count))
        }
        
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        AwardsView()
    }
}

