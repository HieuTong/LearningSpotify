//
//  AuthViewController.swift
//  LearnSpotify
//
//  Created by Le Tong Minh Hieu on 3/5/21.
//

import UIKit
import WebKit

class AuthViewController: UIViewController, WKNavigationDelegate {

    private let webView: WKWebView = {
        let prefs = WKWebpagePreferences()
        if #available(iOS 14.0, *) {
            prefs.allowsContentJavaScript = true
        } else {
            // Fallback on earlier versions
        }
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero, configuration: config)
        return webView
    }()
    
    public var completionHandler: ((Bool) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Sign In"
        view.backgroundColor = .systemBackground
        webView.navigationDelegate = self
        view.addSubview(webView)
        guard let url = AuthManager.shared.signInURL else { return }
        webView.load(URLRequest(url: url))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let url = webView.url else { return }
        //exchange the code for access token
        let component = URLComponents(string: url.absoluteString)
        guard let code = component?.queryItems?.first(where: { $0.name == "code" })?.value else {
            return
        }
        webView.isHidden = true
        
        AuthManager.shared.exchangeCodeForToken(code: code) { [weak self] (success) in
            DispatchQueue.main.async {
                self?.navigationController?.popToRootViewController(animated: true)
            }
            self?.completionHandler?(success)
        }
    }

}
