//
//  Validators.swift
//  
//
//  Created by Squareboat on 20/08/20.
//

import UIKit

public class Validators {
    
    /// Returns a boolean whether the email address is valid or not
    public class func isValidEmailAddress(emailId : String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailPredicate = NSPredicate(format: "(SELF MATCHES %@)", emailRegex)
        return emailPredicate.evaluate(with: emailId)
    }
    
    /// Returns a boolean whether the phone number is valid or not
    public class func isValidPhoneNumber(number : String) -> Bool {
        let phoneRegex = "^[1-9]{1}[0-9]{9}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: number)
    }
    
    /// Returns a boolean whether the url is valid or not
    public class func isValidURL(urlString: String?) -> Bool {
        //Check for nil
        if let urlString = urlString {
            // create NSURL instance
            if let url = URL(string: urlString) {
                // check if your application can open the NSURL instance
                return UIApplication.shared.canOpenURL(url)
            }
        }
        return false
    }
    
    /// Check whether the provided data is Integer or Floating point number
    public class func checkForIntAndFloat(data : Any) -> Any {
        if let value = data as? String
        {
            if let priceDouble = Double(value)
            {
                let remainder = priceDouble.truncatingRemainder(dividingBy: 1.0)
                if remainder > 0.0
                {
                    return priceDouble
                }
                else
                {
                    return Int(priceDouble)
                }
            }
        }
        if let value = data as? Double
        {
            let remainder = value.truncatingRemainder(dividingBy: 1.0)
            if remainder > 0.0
            {
                return value
            }
            else
            {
                return Int(value)
            }
        }
        
        return data
    }
}
