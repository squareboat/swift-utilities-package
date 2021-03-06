//
//  ThreadingUtils.swift
//  
//
//  Created by Squareboat on 20/08/20.
//

import Foundation

public class ThreadingUtils {
    /// A utility method to debounce network call
    public class func debounce(interval: Int, queue: DispatchQueue, action: @escaping (() -> Void)) -> () -> Void {
        var lastFireTime = DispatchTime.now()
        let dispatchDelay = DispatchTimeInterval.milliseconds(interval)
        
        return {
            lastFireTime = DispatchTime.now()
            let dispatchTime: DispatchTime = DispatchTime.now() + dispatchDelay
            
            queue.asyncAfter(deadline: dispatchTime) {
                let when: DispatchTime = lastFireTime + dispatchDelay
                let now = DispatchTime.now()
                if now.rawValue >= when.rawValue {
                    action()
                }
            }
        }
    }
    
    /// A utility method to do something after a delay
    /// - Parameters:
    ///   - delay: delay in seconds
    ///   - closure:
    class func delay(delay:Double, perform: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: perform)
    }
}
