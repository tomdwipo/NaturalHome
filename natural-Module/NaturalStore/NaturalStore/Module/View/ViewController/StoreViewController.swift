//
//  StoreViewController.swift
//  NaturalStore
//
//  Created by BRI on 13/07/18.
//  Copyright © 2018 Tommy. All rights reserved.
//

import UIKit
import BaseFramework
import PagingMenuController

class StoreViewController: UIViewController {
    var presenter: ViewToPresenterProtocol?
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var scrollview: UIScrollView!
    var options: PagingMenuControllerCustomizable!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.updateView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController!.navigationBar.lt_reset()
    }
  
}

extension StoreViewController: PresenterToViewProtocol {
    func viewUpdate() {
        setTabLayout()
        setSearchBar()
        setScrollView()
    }
    
    func showError(message: String) {
        
    }
}

extension StoreViewController: UIScrollViewDelegate {
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offsetY: CGFloat = scrollView.contentOffset.y
            if offsetY > -40 {
                
                if offsetY >= 0 {
                    setNavigationBarTransformProgress(1)
                } else {
                    setNavigationBarTransformProgress((offsetY+40) / 40)
                }
            } else {
                setNavigationBarTransformProgress(0)
                //self.navigationController!.navigationBar.backIndicatorImage = UIImage()
            }
    
    
        }
    
    func setNavigationBarTransformProgress(_ progress: CGFloat) {
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController!.view.backgroundColor = .clear
        self.navigationController!.navigationBar.lt_setTranslationY(translationY: (-44 * progress))
        self.navigationController!.navigationBar.lt_setElementsAlpha(alpha: (1 - progress))
    }
}

extension StoreViewController {
    
    func setScrollView(){
        self.scrollview.delegate = self
    }
    
    func setTabLayout(){
        let pagingMenuController = self.childViewControllers.first as! PagingMenuController
        pagingMenuController.setup(tabLayout(self.view, fontSize: 14, selectedColor: UIColor.gray))
    }
    
    func setSearchBar(){
       

        self.navigationController!.navigationBar.lt_setBackgroundColor(backgroundColor: UIColor.white)
        let searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - 70, height: 20))
        searchBar.placeholder = "Search The Product"
        searchBar.setTextColor(color: UIColor.darkGray)
        searchBar.changeSearchBarColor(color: UIColor(red: 246/256, green: 246/256, blue: 253/256, alpha: 1.0))
        searchBar.setPlaceholderTextColor(color: UIColor.darkGray)
        searchBar.setMagnifyingGlassColorTo(color: UIColor.darkGray)
        searchBar.setclearImageColor(color: UIColor.darkGray)
        
        
        let leftNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationController!.navigationBar.topItem?.leftBarButtonItem = leftNavBarButton
    }
    
    
}

struct tabLayout : PagingMenuControllerCustomizable{
    var view: UIView?
    var fontSize: CGFloat?
    var selectedColor:UIColor?
    init(_ view: UIView, fontSize: CGFloat, selectedColor:UIColor) {
        self.view = view
        self.fontSize = fontSize
        self.selectedColor = selectedColor
    }
    var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(self.view!, self.fontSize!,self.selectedColor!), pagingControllers: pagingControllers)
    }
    var lazyLoadingPage: LazyLoadingPage {
        return .one
    }
    
    struct MenuOptions: MenuViewCustomizable {
        var view: UIView?
        var sizeFont: CGFloat?
        var selectedColor:UIColor?
        init(_ view: UIView, _ sizeFont: CGFloat, _ selectedColor:UIColor) {
            self.view = view
            self.sizeFont = sizeFont
            self.selectedColor = selectedColor
        }
        var displayMode: MenuDisplayMode {
            return .segmentedControl
        }
        
        var backgroundColor: UIColor{
            return colorBackground()
        }
        var selectedBackgroundColor: UIColor {
            return colorBackground()
        }
        
        func colorBackground()-> UIColor{
            return UIColor.white
        }
        
        var focusMode: MenuFocusMode {
            return .underline(height: 3, color: UIColor(red: 40/255, green: 53/255, blue: 147/255, alpha: 1.0), horizontalPadding: 20, verticalPadding: 0)
        }
        
        var height: CGFloat {
            return 40
        }
        
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItemBrand(self.sizeFont!,selectedColor:self.selectedColor!),MenuItemPersonal(self.sizeFont!,selectedColor:self.selectedColor!),MenuItemShops(self.sizeFont!,selectedColor:self.selectedColor!),MenuItemFitting(self.sizeFont!,selectedColor:self.selectedColor!)]
        }
    }
    struct MenuItemBrand : MenuItemViewCustomizable {
        var sizeFont : CGFloat?
        var selectedColor: UIColor?
        init(_ sizeFont: CGFloat, selectedColor: UIColor) {
            self.sizeFont = sizeFont
            self.selectedColor = selectedColor
        }
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: MenuItem.brand, color: UIColor.lightGray, selectedColor: self.selectedColor!, font:  UIFont.boldSystemFont(ofSize: self.sizeFont!), selectedFont: UIFont.boldSystemFont(ofSize: self.sizeFont!))
            return .text(title: title)
        }
    }
    struct MenuItemPersonal : MenuItemViewCustomizable {
        var sizeFont : CGFloat?
        var selectedColor: UIColor?
        init(_ sizeFont: CGFloat, selectedColor: UIColor) {
            self.sizeFont = sizeFont
            self.selectedColor = selectedColor
        }
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: MenuItem.personal, color: UIColor.lightGray, selectedColor: selectedColor!, font:  UIFont.boldSystemFont(ofSize: self.sizeFont!), selectedFont: UIFont.boldSystemFont(ofSize: self.sizeFont!))
            return .text(title: title)
        }
    }
    struct MenuItemShops: MenuItemViewCustomizable {
        var sizeFont : CGFloat?
        var selectedColor: UIColor?
        init(_ sizeFont: CGFloat, selectedColor: UIColor) {
            self.sizeFont = sizeFont
            self.selectedColor = selectedColor
        }
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: MenuItem.shops, color: UIColor.lightGray, selectedColor: self.selectedColor!, font:  UIFont.boldSystemFont(ofSize: self.sizeFont!), selectedFont: UIFont.boldSystemFont(ofSize: self.sizeFont!))
            return .text(title: title)
        }
    }
    struct MenuItemFitting : MenuItemViewCustomizable {
        var sizeFont : CGFloat?
        var selectedColor: UIColor?
        init(_ sizeFont: CGFloat, selectedColor: UIColor) {
            self.sizeFont = sizeFont
            self.selectedColor = selectedColor
        }
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: MenuItem.fitting, color: UIColor.lightGray, selectedColor: self.selectedColor!, font:  UIFont.boldSystemFont(ofSize: self.sizeFont!), selectedFont: UIFont.boldSystemFont(ofSize: self.sizeFont!))
            return .text(title: title)
        }
    }
}


private var pagingControllers: [UIViewController] {
    let brandViewController = BrandViewController.instantiateFromStoryboard()
    let personalViewController = PersonalViewController.instantiateFromStoryboard()
    let shopsViewController = ShopsViewController.instantiateFromStoryboard()
    let fittingViewController = FittingViewController.instantiateFromStoryboard()
    return [brandViewController,personalViewController, shopsViewController,fittingViewController]
    
}







