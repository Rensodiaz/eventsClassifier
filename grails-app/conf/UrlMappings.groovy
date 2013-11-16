class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

        "/"(controller:"twitterLogin", action: "index")
		"500"(view:'/error')
	}
}
