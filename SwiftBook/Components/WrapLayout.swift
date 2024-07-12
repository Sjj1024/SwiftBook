//
//  WrapLayout.swift
//  SwiftBook
//
//  Created by song on 2024/7/12.
//

import Foundation
import SwiftUI

struct WrapLayout: Layout {
    // 间距
    var spacing: CGFloat = 10
    
    // 缓存
    struct Cache {
        var sizes: [CGSize]
    }
    
    func makeCache(subviews: Subviews) -> Cache {
        Cache(sizes: subviews.map { $0.sizeThatFits(.unspecified) })
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout Cache) -> CGSize {
        var width: CGFloat = 0
        var height: CGFloat = 0
        var lineWidth: CGFloat = 0
        var lineHeight: CGFloat = 0
        
        for size in cache.sizes {
            if lineWidth + size.width + spacing > proposal.replacingUnspecifiedDimensions().width {
                width = max(width, lineWidth)
                height += lineHeight + spacing
                lineWidth = 0
                lineHeight = 0
            }
            lineWidth += size.width + spacing
            lineHeight = max(lineHeight, size.height)
        }
        
        width = max(width, lineWidth)
        height += lineHeight
        
        return CGSize(width: width, height: height)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout Cache) {
        var x: CGFloat = 0
        var y: CGFloat = 0
        var lineHeight: CGFloat = 100
        
        for (index, subview) in subviews.enumerated() {
            let size = cache.sizes[index]
            
            if x + size.width + spacing > bounds.width {
                x = 0
                y += lineHeight + spacing
                lineHeight = 0
            }
            
            subview.place(at: CGPoint(x: x, y: y), proposal: ProposedViewSize(size))
            x += size.width + spacing
            lineHeight = max(lineHeight, size.height)
        }
    }
}
