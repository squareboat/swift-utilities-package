//
//  CalendarUtils.swift
//  
//
//  Created by Squareboat on 20/08/20.
//

import Foundation

/// An interface to perform complex date calculations
public class CalendarUtils {
    
    /// Helper method to get number of days between two dates
    /// - Parameters:
    ///   - date1: first date
    ///   - date2: second date
    /// - Returns: DateComponents with number of days between provided dates
    class func getNumberOfDaysBetweenTwoDates(date1 : Date, date2 : Date) -> DateComponents {
        let calendar = NSCalendar.current
        
        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: date1)
        let date2 = calendar.startOfDay(for: date2)
        
        let components = calendar.dateComponents([.day,.hour,.minute], from: date1, to: date2)
        
        return components  // This will return the number of day(s) between dates
    }
    
    /// Get Actual difference between two days in terms of days, hours, minutes and seconds
    public class func getActualDifferenceBetweenTwoDates(date1 : Date, date2 : Date) -> DateComponents {
        let calendar = NSCalendar.current
        
        let components = calendar.dateComponents([.day,.hour,.minute,.second], from: date1, to: date2)
        
        return components  // This will return the number of day(s) between dates
    }
    
    /// Get date after adding a number of days to the provided date
    public class func getDateAfterSomedays(daysToAdd : Int, dateToAdd : Date!) -> Date! {
        let today = dateToAdd
        return Calendar.current.date(byAdding: .day, value: daysToAdd, to: today!)
    }
    
    /// Get time difference string from timestamp ex: 1 week ago
    public class func getTimeDifferenceString(timestampString : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let createdDate = dateFormatter.date(from: timestampString)
        {
            let difference = getActualDifferenceBetweenTwoDates(date1: createdDate, date2: Date())
            
            if(difference.day ?? 0 > 14)
            {
                dateFormatter.dateFormat = "dd MMM, yyyy"
                return dateFormatter.string(from: createdDate)
                
            }
            
            if(difference.day ?? 0 > 7)
            {
                return "1 week ago"
            }
            
            if(difference.day ?? 0 > 1)
            {
                return "\(difference.day!) days ago"
            }
            
            if(difference.day ?? 0 == 1)
            {
                return "1 day ago"
            }
            
            if(difference.hour ?? 0 > 1)
            {
                return "\(difference.hour!) hours ago"
            }
            
            if(difference.hour ?? 0 == 1)
            {
                return "1 hour ago"
            }
            
            if(difference.minute ?? 0 > 0)
            {
                return "\(difference.minute!) minutes ago"
            }
            
            if(difference.second ?? 0 > 0)
            {
                return "Just now"
            }
            
        }
        return ""
    }
}
