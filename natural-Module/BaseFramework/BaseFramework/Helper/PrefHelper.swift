//
//  PrefHelper.swift
//  BaseFramework
//
//  Created by BRI on 09/07/18.
//  Copyright © 2018 Tommy. All rights reserved.
//

import Foundation

public struct PrefHelper {
    static let pref = UserDefaults.standard
    public static func saveObject(key:String ,value:AnyObject){
        let data = NSKeyedArchiver.archivedData(withRootObject: value)
        pref.set(data, forKey: key)
        commit()
    }
    
    public static func getObject(key:String)->AnyObject?{
        if let data = pref.object(forKey: key) as? NSData {
            let obj = NSKeyedUnarchiver.unarchiveObject(with: data as Data)!
            return obj as AnyObject?
        }
        return nil
    }
    
    public static func commit(){
        pref.synchronize()
    }
}

public extension UIView {
    
    public class func instantiateFromNib<T: UIView>(viewType: T.Type, bundle: Bundle) -> T {
        print("test \(self)")
        return (UINib(nibName: "\(self)", bundle: bundle).instantiate(withOwner: nil, options: nil).first as? T)!

    }
    
    public class func instantiateFromNib(bundle: Bundle) -> Self {
        return instantiateFromNib(viewType: self, bundle: bundle)
    }
}

public extension UISearchBar {
    public func setTextColor(color: UIColor) {
        let svs = subviews.flatMap { $0.subviews }
        guard let tf = (svs.filter { $0 is UITextField }).first as? UITextField else { return }
        tf.textColor = color
    }
    
    public func changeSearchBarColor(color : UIColor) {
        for subView in self.subviews {
            for subSubView in subView.subviews {
                if subSubView.conforms(to: UITextInputTraits.self) {
                    let textField = subSubView as! UITextField
                    textField.backgroundColor = color
                    break
                }
            }
        }
    }
    
     func getViewElement<T>(type: T.Type) -> T? {
        let svs = subviews.flatMap { $0.subviews }
        guard let element = (svs.filter { $0 is T }).first as? T else { return nil }
        return element
    }
    
    func getSearchBarTextField() -> UITextField? {
        return getViewElement(type: UITextField.self)
    }
    
    public func setPlaceholderTextColor(color: UIColor) {
        if let textField = getSearchBarTextField() {
            textField.attributedPlaceholder = NSAttributedString(string:  self.placeholder != nil ? self.placeholder! : "", attributes: [NSAttributedStringKey.foregroundColor : color])
        }
    }
    
    public func setMagnifyingGlassColorTo(color: UIColor){
        let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField
        let glassIconView = textFieldInsideSearchBar?.leftView as? UIImageView
        glassIconView?.image = glassIconView?.image?.withRenderingMode(.alwaysTemplate)
        glassIconView?.tintColor = color
    }
    
    public func setclearImageColor(color: UIColor){
        let searchBarTextField = self.value(forKey: "_searchField") as? UITextField
        let clearButton = searchBarTextField?.value(forKey: "_clearButton") as? UIButton
        let clearImage = clearButton?.imageView?.image?.withRenderingMode(.alwaysTemplate)
        clearButton?.setImage(clearImage, for: .normal)
        clearButton?.tintColor = color
    }
    
    func tintImage(image: UIImage, color: UIColor) -> UIImage {
        let size = image.size
        UIGraphicsBeginImageContextWithOptions(size, false, image.scale)
        let context = UIGraphicsGetCurrentContext()
        image.draw(at: .zero, blendMode: .normal, alpha: 1.0)
        context!.setFillColor(color.cgColor)
        context!.setBlendMode(.sourceIn)
        context!.setAlpha(1.0)
        let rect = CGRect(x: CGPoint.zero.x, y: CGPoint.zero.y, width: image.size.width, height: image.size.height)
        UIGraphicsGetCurrentContext()!.fill(rect)
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return tintedImage!
    }
}

extension UINavigationBar {
    private struct AssociatedKeys {
        static var overlayKey = "overlayKey"
    }
    
    var overlay: UIView? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.overlayKey) as? UIView
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.overlayKey, newValue as UIView?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
}


public extension UINavigationBar {
    
    public func lt_setBackgroundColor(backgroundColor: UIColor) {
        if overlay == nil {
            self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            overlay = UIView.init(frame: CGRect.init(x: 0, y: 0, width: bounds.width, height: bounds.height+20))
            overlay?.isUserInteractionEnabled = false
            overlay?.autoresizingMask = UIViewAutoresizing.flexibleWidth
            subviews.first?.insertSubview(overlay!, at: 0)
        }
        overlay?.backgroundColor = backgroundColor
    }
    
    
   public func lt_setTranslationY(translationY: CGFloat) {
        transform = CGAffineTransform.init(translationX: 0, y: translationY)
    }
    
    
    public func lt_setElementsAlpha(alpha: CGFloat) {
        for (_, element) in subviews.enumerated() {
//            if element.isKind(of: NSClassFromString("UINavigationItemView") as! UIView.Type) ||
//                element.isKind(of: NSClassFromString("UINavigationButton") as! UIButton.Type) ||
//                element.isKind(of: NSClassFromString("UINavBarPrompt") as! UIView.Type)
//            {
                element.alpha = alpha
//            }
            
          //  if element.isKind(of: NSClassFromString("_UINavigationBarBackIndicatorView") as! UIView.Type) {
                element.alpha = element.alpha == 0 ? 0 : alpha
           // }
        }
        
        items?.forEach({ (item) in
            if let titleView = item.titleView {
                titleView.alpha = alpha
            }
            for BBItems in [item.leftBarButtonItems, item.rightBarButtonItems] {
                BBItems?.forEach({ (barButtonItem) in
                    if let customView = barButtonItem.customView {
                        customView.alpha = alpha
                    }
                })
            }
        })
    }
    
    
    public func lt_reset() {
        setBackgroundImage(nil, for: UIBarMetrics.default)
        overlay?.removeFromSuperview()
        overlay = nil
    }
}
