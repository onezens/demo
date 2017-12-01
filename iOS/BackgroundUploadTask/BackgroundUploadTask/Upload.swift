//
//  Upload.swift
//  BackgroundUploadTask
//
//  Created by wz on 2017/12/1.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import UIKit

import Foundation

//class SessionDelegate:NSObject, URLSessionDataDelegate, URLSessionTaskDelegate {
//    func URLSession(session: URLSession, task: URLSessionTask, needNewBodyStream completionHandler: (InputStream?) -> Void) {
//        if let fileURL = Bundle.main.url(forResource: "image", withExtension: "jpg"),
//            let path = fileURL.path,
//            let inputStream = InputStream(fileAtPath: path)
//        {
//
//            completionHandler(inputStream)
//        }
//
//    }
//
//}
//// create a background session configuration with identifier
//let config = URLSessionConfiguration.background(withIdentifier: "myConfig")
//
//if let url = NSURL(string: "http://127.0.0.1:8888/image_upload.php") {
//    let delegate = SessionDelegate()
//    // create session by instantiating with configuration and delegate
//    let session = URLSession(configuration: config, delegate: delegate, delegateQueue: nil)
//
//    let request = NSMutableURLRequest(url: url as URL)
//
//    request.httpMethod = "POST"
//
//    let uploadTask = session.uploadTaskWithStreamedRequest(request)
//
//    uploadTask.resume()
//
//}

