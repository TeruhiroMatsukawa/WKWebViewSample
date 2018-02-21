//
//  WebViewController.swift
//  SampleWebViewBackGesture
//
//  Created by Teruhiro Matsukawa on 2018/02/21.
//  Copyright © 2018年 Teruhiro Matsukawa. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController
{
    var webView: WKWebView!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setup()
        
        // リクエスト
        guard let url = URL(string: "https://www.google.com/") else { return }
        let r = URLRequest(url: url)
        webView.load(r)
    }
    
    private func setup()
    {
        // 作成
        webView = WKWebView()
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.allowsBackForwardNavigationGestures = true
        contentView.addSubview(webView!)
        
        // 制約追加
        webView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0.0).isActive = true
        webView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0.0).isActive = true
        webView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0.0).isActive = true
        webView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0.0).isActive = true
    }
}

extension WebViewController: WKNavigationDelegate
{
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void)
    {
        guard let _ = navigationAction.request.url else
        {
            decisionHandler(.cancel)
            return
        }
        decisionHandler(.allow)
    }
}
