
import Foundation
import SwiftUI

public struct MRAttributedTextView : UIViewRepresentable {

    var text:String
    var subsString:[String]
    var width: GeometryProxy
    var textFont:UIFont
    var subsStringFont:UIFont
    var subsStringColor:UIColor
    var alignment:NSTextAlignment
    var paddingHorizontal:CGFloat
    var onTapItemString:((String) -> Void)
    
    
    /// Description
    /// - Parameters:
    ///   - text: The String with subsString
    ///   - subStrings: The SubsString Array
    ///   - width: The Width of view
    ///   - textFont: The font of text (Default systemFont)
    ///   - subsStringFont: The font of subsString (Default systemFont)
    ///   - subsStringColor:The color of subsString (Default systemBlue)
    ///   - alignment: Alignment of view (Default Center)
    ///   - paddingHorizontal: The padding of view (Default 0)
    ///   - onTapItemString: The action of subsStrings
    public init(text:String,
         subStrings:[String],
         width:GeometryProxy,
         textFont:UIFont = .systemFont(ofSize: 16),
         subsStringFont:UIFont = .systemFont(ofSize: 16),
         subsStringColor:UIColor = UIColor.systemBlue,
         alignment:NSTextAlignment = .center,
         paddingHorizontal:CGFloat = 0,
         onTapItemString:@escaping ((String) -> Void)
    ) {
        self.text = text
        self.subsString = subStrings
        self.width = width
        self.textFont = textFont
        self.subsStringFont = subsStringFont
        self.subsStringColor = subsStringColor
        self.alignment = alignment
        self.paddingHorizontal = paddingHorizontal
        self.onTapItemString = onTapItemString
    }

    public class Coordinator : NSObject {

        var parent:MRAttributedTextView
        init(parent:MRAttributedTextView) {
            self.parent = parent
        }

    }

    public func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    public func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = alignment
        label.font = textFont
        label.preferredMaxLayoutWidth = (width.maxWidth - paddingHorizontal)
        return label
    }
    
    func createAttrString() -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string:text)
        subsString.forEach { string in
            let range = (text as NSString).range(of: string)
            let attrs = [NSMutableAttributedString.Key.foregroundColor : subsStringColor,
                         NSAttributedString.Key.font : subsStringFont]
            let subString = NSMutableAttributedString(string: string, attributes:attrs)
            attributedString.replaceCharacters(in: range, with: subString)
        }
        return attributedString
    }

    public func updateUIView(_ label: UILabel, context: Context) {
        label.attributedText = createAttrString()
        label.addTapGestureRecognizer { sender in
            subsString.forEach { string in
                let range = (text as NSString).range(of: string)
                if (sender.didTapAttributedTextInLabel(label: label, inRange: range)) {
                    onTapItemString(string)
                }
            }
        }
    }
}

