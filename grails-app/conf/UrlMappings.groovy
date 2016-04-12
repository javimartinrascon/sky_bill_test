class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:"/bill", action: 'show', view: 'show')
        "500"(view:'/error')
	}
}
