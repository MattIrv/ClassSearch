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
        let postString = "iMnemonic=\(department)&iNumber=\(classNumber)"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        var error = false
        let task = session.dataTaskWithRequest(request, completionHandler: {(data: NSData?, response: NSURLResponse?, err: NSError?) -> Void in
            if let _ = err {
                error = true
            }
            else {
                let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
                // TODO
                print("Body: \(strData)")
            }
        })
        task.resume()
        // Wait for the request to complete. There's probably a better way to do this
        var timeCounter = 0;
        // TODO: 100 is probably a better timeout. Was using 1 for debugging w/o internet
        while task.state != NSURLSessionTaskState.Completed && timeCounter < 100 {
            print("Task State: \(task.state)")
            NSThread.sleepForTimeInterval(0.1)
            timeCounter++;
            // TODO: Display a loading animation
        }
        if timeCounter >= 100 {
            // TODO: Display the error in an appropriate way
            return MIClassSearchController.createSampleClassList().map({(obj: AnyObject) -> MICourse in
                obj as! MICourse
            })
        }
        if error == true {
            // TODO: Display the error in an appropriate way
            return MIClassSearchController.createSampleClassList().map({(obj: AnyObject) -> MICourse in
                obj as! MICourse
            })
        }
        else {
            // TODO
            return MIClassSearchController.createSampleClassList().map({(obj: AnyObject) -> MICourse in
                obj as! MICourse
            })
        }
    }
}