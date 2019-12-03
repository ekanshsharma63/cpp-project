//
//  UIImageView+Extentions.swift
//  Renturcar
//
//  Created by OSX on 25/07/17.
//  Copyright © 2017 Macrew. All rights reserved.
//

import UIKit

class UISwitchCustom: UISwitch {
	@IBInspectable var OffTint: UIColor? {
		didSet {
			self.tintColor = OffTint
			self.layer.cornerRadius = 16
			self.backgroundColor = OffTint
		}
	}
}

extension UIImageView {
    func downloadImage(fromUrl url: URL?) {
        guard let url = url else {  return  }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
        }.resume()
    }
}

extension URL {
    func getDataFromUrl(completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        let request = URLRequest(url: self, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
}
