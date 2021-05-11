//
//  Constants.swift
//  ConnectIst
//
//  Created by Nazmi Yavuz on 15.02.2021.
//

import UIKit


// use constant values in order to minimize error during code
struct K {
    
    static let userImage = "userImage"
    static let homeCoverImage = "homeCoverImage"
    static let searchTableView = "search"
    static let friendsTableViewRequestCell = "request"
    static let friendsTableViewRecommendedCell = "recommended"
    static let myFriendCell = "myFriend"
    
    //    static let cellIdentifier = "ReusableCell"
    //    static let cellNibName = "MessageCell"
    //    static let registerSegue = "RegisterToChat"
    //    static let loginSegue = "LoginToChat"
    
    struct Segue {
        static let homeVCToCommentVC = "CommentsVC"
        static let friendVCToGuestVC_searchTableView = "ToGuestVCSearchTableView"
        static let friendVCToGuestVC_friendTableView = "ToGuestVCFriendTableView"
        static let guestVCToCommentsVC = "ToCommentsVC"
        static let friendVCToGuestVC_recommendedUserCell = "ToGuestVCRecommendedCell"
        static let homeVCToSeeAllFriends = "HomeToAllFriends"
        static let myFriendsVCToGuestVC = "MyFriendsToGuest"
        static let feedPostToCommentVC = "FeedPostToCommentVC"
    }
    
    
  
    // set Labels attributes
    struct Label {
        
        // set font properties
        struct Font {
            static let homeName = "HelveticaNeue"
        }
        
    }
    
    
    
    // set TextFields attributes
    struct TextField {
        
        
        
        // set font properties
        struct Font {
            static let sign = "HelveticaNeue"
        }
        
        
    }
    
    
    // set Buttons attributes
    struct Button {
        
        
        // set button font properties
        struct Font {
            static let sign = "HelveticaNeue"
            static let signMedium = "HelveticaNeue-Medium"
            
        }
    }
    
    // custom font in order to minimize errors
    struct Font {
        
        static let helveticaNeue_bold = "HelveticaNeue-Bold"
        static let helveticaNeue_medium = "HelveticaNeue-Medium"
        static let helveticaNeue = "HelveticaNeue"
        static let helveticaNeue_light = "HelveticaNeue-Light"
    }
    
    
    
    
}
