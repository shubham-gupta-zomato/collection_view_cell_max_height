//
//  ZLayout.swift
//  Composition Layout
//
//  Created by Shubham Gupta on 20/07/22.
//

import UIKit

class ZCollectionViewLayout: UICollectionViewCompositionalLayout {
    var maximumHeight: CGFloat = 0

    override func prepare() {
        super.prepare()
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attribute = super.layoutAttributesForItem(at: indexPath)
        if let height = attribute?.frame.height, maximumHeight <= height {
            maximumHeight = height
        }
        return super.layoutAttributesForItem(at: indexPath)
    }
}
