//
//  Created by Praks on 2/19/20.
//  Copyright © 2020 PandoDev. All rights reserved.
//

import UIKit

// MARK: - Setup Operation
struct WebOperation: Requestable {

    var router: Router!

    var url: URL {
        return router.url
    }

    var method: String {
        return router.method
    }

    var parameters: [String: Any] {
        return router.parameters
    }

    var headers: [String: String] {
        return router.headers
    }

    var uploadParameters: Data? {
        return router.uploadParameters
    }
}
