//
//  AnnotationPriority.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import CoreGraphics

enum AnnotationProirity: CGFloat {
    case low = 0
    case regular = 1
    case high = 2
}

protocol HaveAnnotationProirity {
    var annotationProirity: AnnotationProirity { get set }
}
