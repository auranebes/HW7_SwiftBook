//
//  ShapeViewModel.swift
//  HW7_SwiftBook
//
//  Created by Arslan Abdullaev on 09.03.2022.
//

import SwiftUI


struct Award: Identifiable {
    let id = UUID()
    let awardView: AnyView
    let title: String
    
    static func getShapes() -> [Award] {
            [
                Award(awardView: AnyView(GradientRectangles().frame(width: 160, height: 160)),
                      title: "Gradient Rectangles"),
                Award(awardView: AnyView(PathView().frame(width: 160, height: 160)),
                      title: "PathView"),
                Award(awardView: AnyView(CurvesView().frame(width: 160, height: 160)),
                      title: "CurvesView")
            ]
        }
}
