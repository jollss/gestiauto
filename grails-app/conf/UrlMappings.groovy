class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/$controller"(parseRequest: true) {
            action = [GET: "consultaRefacciones"]
        }

        "/"(view:"/index")
        "500"(view:'/error')
	}
}
