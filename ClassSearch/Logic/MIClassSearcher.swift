//
//  MIClassSearcher.swift
//  ClassSearch
//
//  Created by Matthew Irvine on 9/4/15.
//  Copyright © 2015 Matthew Irvine. All rights reserved.
//

import Foundation

@objc
public class MIClassSearcher: NSObject {
    public class func performSearchForString(searchString: String) -> [MICourse]! {
        let parts = searchString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).componentsSeparatedByString(" ")
        let department = parts[0];
        let classNumber = parts.count > 1 ? parts[1] : "";
        let request = NSMutableURLRequest(URL: NSURL(string: "https://rabi.phys.virginia.edu/mySIS/CS2/page.php?Semester=1158&Type=Search")!)
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        let params = ["iMnemonic": department, "iNumber": classNumber] as Dictionary<String, String>
        let options = NSJSONWritingOptions()
        // TODO: This error handling code is out of date as of XCode 7 Beta 6 (which I don't have yet). Fix it!
        do {
            try request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: options)
        } catch _ {
            return []
        }
        var error = false
        let task = session.dataTaskWithRequest(request, completionHandler: {(data: NSData?, response: NSURLResponse?, err: NSError?) -> Void in
            if let _ = err {
                error = true
            }
            let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
            // TODO
            print("Body: \(strData)")
        })
        task.resume()
        // Wait for the request to complete. There's probably a better way to do this
        while task.state != NSURLSessionTaskState.Completed {
            print("Task State: \(task.state)")
            NSThread.sleepForTimeInterval(0.1)
        }
        if error == true {
            return []
        }
        else {
            // TODO
            return MIClassSearchController.createSampleClassList().map({(obj: AnyObject) -> MICourse in
                obj as! MICourse
            })
        }
    }
}