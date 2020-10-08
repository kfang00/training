//
//  MKPointAnnotation-ObservableObject.swift
//  BucketList
//
//  Created by Kayla Fang on 10/8/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        }

        set {
            title = newValue
        }
    }

    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unknown value"
        }

        set {
            subtitle = newValue
        }
    }
}
