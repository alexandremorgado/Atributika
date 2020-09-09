//
//  AttributedView.swift
//  Demo
//
//  Created by Ernesto Rivera on 5/14/20.
//  Copyright © 2020 Atributika. All rights reserved.
//

import SwiftUI
#if !os(macOS)
import UIKit
#else
import AppKit
#endif

#if !os(macOS)
public struct AttributedView: UIViewRepresentable {
    
    var attributedText: AttributedText?
    var configureLabel: ((AttributedLabel) -> Void)? = nil
    
    @State var maxWidth: CGFloat = 300
    
    public typealias UIViewType = MaxWidthAttributedLabel
    
    public func makeUIView(context: Context) -> MaxWidthAttributedLabel {
        let view = MaxWidthAttributedLabel()
        configureLabel?(view)
        return view
    }
    
    public func updateUIView(_ uiView: MaxWidthAttributedLabel, context: Context) {
        uiView.attributedText = attributedText
        uiView.maxWidth = maxWidth
    }
    
    public class MaxWidthAttributedLabel: AttributedLabel
    {
        var maxWidth: CGFloat!
        
        open override var intrinsicContentSize: CGSize
        {
            sizeThatFits(CGSize(width: maxWidth, height: .infinity))
        }
    }
}

#else
//public struct AttributedView: NSViewRepresentable {
//
//    public typealias NSViewType = NSView
//
//    public func makeNSView(context: Context) -> NSView {
//        //
//    }
//
//    public func updateNSView(_ nsView: NSView, context: Context) {
//        //
//    }
//
//}

#endif

#if !os(macOS)
struct AttributedView_Previews: PreviewProvider {
    
    static let all = Style.font(UIFont.preferredFont(forTextStyle: .body))
    static let link = Style("a")
        .foregroundColor(.blue, .normal)
        .foregroundColor(.brown, .highlighted)
    static let configureLabel: ((AttributedLabel) -> Void) = { label in
        label.numberOfLines = 0
        label.textColor = .label
    }
    
    static var previews: some View {
        Group {
            AttributedView(attributedText: "Denny JA: Dengan RT ini, anda ikut memenangkan Jokowi-JK. Pilih pemimpin yg bisa dipercaya (Jokowi) dan pengalaman (JK). #DJoJK"
                .style(tags: link)
                .styleHashtags(link)
                .styleMentions(link)
                .styleLinks(link)
                .styleAll(all), configureLabel: configureLabel, maxWidth: 300)
            AttributedView(attributedText: "@e2F If only Bradley's arm was longer. Best photo ever. 😊 #oscars https://pic.twitter.com/C9U5NOtGap<br>Check this <a href=\"https://github.com/psharanda/Atributika\">link</a>"
                .style(tags: link)
                .styleHashtags(link)
                .styleMentions(link)
                .styleLinks(link)
                .styleAll(all), configureLabel: configureLabel)
                .fixedSize(horizontal: true, vertical: true)
            AttributedView(attributedText: """
            # A big message

            - With *mentions* [Ernesto Test Account](user://91010061)
            - **Bold** text

            ## Also

            > Quotes

            1. Some `code`
            2. And data detectors  (801) 917 4444, email@dot.com and http://apple.com
            """
                .style(tags: link)
                .styleHashtags(link)
                .styleMentions(link)
                .styleLinks(link)
                .styleAll(all), configureLabel: configureLabel)
                .fixedSize(horizontal: true, vertical: true)
        }
    }
}
#endif
