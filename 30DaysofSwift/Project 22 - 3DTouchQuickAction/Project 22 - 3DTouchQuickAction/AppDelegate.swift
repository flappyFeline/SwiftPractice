//
//  AppDelegate.swift
//  Project 22 - 3DTouchQuickAction
//
//  Created by Durand on 20/6/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    enum ShortcutIdentifier: String {
        // 枚举定义成这样需要在 info.plist中配合设置.
        case First;
        case Second;
        case Third;
        
        init?(fullType: String) {
            guard let last = fullType.components(separatedBy: ".").last else { return nil };
            self.init(rawValue: last);
        }
        
        var type: String {
            return Bundle.main.bundleIdentifier! + ".\(self.rawValue)";
        }
        
    }
    
    var window: UIWindow?
    
    var launchedShortcutItem: UIApplicationShortcutItem?;
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        if let shortcutItem = launchOptions?[UIApplicationLaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem {
            self.launchedShortcutItem = shortcutItem;
        }
        
        return true;
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
        if launchedShortcutItem != nil {
            handleShortCutItem(launchedShortcutItem!);
            launchedShortcutItem = nil;
        }
        
    }
    
    @discardableResult func handleShortCutItem(_ shortcutItem: UIApplicationShortcutItem) -> Bool {
        
        var handled = false;
        
        guard let shortcutId = ShortcutIdentifier.init(fullType: shortcutItem.type) else { return false; }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var vc: UIViewController;
        
        switch shortcutId {
        case .First:
            vc = storyboard.instantiateViewController(withIdentifier: "RunVC");
            handled = true;
        case .Second:
            vc = storyboard.instantiateViewController(withIdentifier: "ScanVC");
            handled = true;
        case .Third:
            vc = storyboard.instantiateViewController(withIdentifier: "WiFiVC");
            handled = true;
        }
        
        
        if handled {
            window?.rootViewController?.present(vc, animated: true, completion: nil);
        }
        return handled;
    }
    

}

