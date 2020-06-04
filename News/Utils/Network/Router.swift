//
//  Created by Praks on 2/19/20.
//  Copyright © 2020 PandoDev. All rights reserved.
//

import Foundation

protocol Router {
    var url: URL { get }
    var method: String { get }
    var headers: [String: String] { get }
    var parameters: [String: Any] { get }
    var uploadParameters: Data? { get }
}

/** Set the Default Value **/
extension Router {
    var method: String { return NetworkMethod.GET.rawValue }
    var headers: [String: String] { return [:] }
    var parameters: [String: Any] { return [:] }
    var uploadParameters: Data? { return nil }
}

enum NetworkMethod: String {
    case GET, POST, PUT, PATCH, DELETE
}
