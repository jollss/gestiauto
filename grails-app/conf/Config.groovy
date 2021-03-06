// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination

// The ACCEPT header will not be used for content negotiation for user agents containing the following strings (defaults to the 4 major rendering engines)
grails.mime.disable.accept.header.userAgents = ['Gecko', 'WebKit', 'Presto', 'Trident']
grails.mime.types = [ // the first one is the default format
    all          : '*/*', // 'all' maps to '*' or the first available format in withFormat
    atom         : 'application/atom+xml',
    css          : 'text/css',
    csv          : 'text/csv',
    form         : 'application/x-www-form-urlencoded',
    html         : ['text/html', 'application/xhtml+xml'],
    js           : 'text/javascript',
    json         : ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss          : 'application/rss+xml',
    text         : 'text/plain',
    hal          : ['application/hal+json', 'application/hal+xml'],
    xml          : ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// Legacy setting for codec used to encode data with ${}
grails.views.default.codec = "html"

// The default scope for controllers. May be prototype, session or singleton.
// If unspecified, controllers are prototype scoped.
grails.controllers.defaultScope = 'singleton'

// GSP settings
grails {
    views {
        gsp {
            encoding = 'UTF-8'
            htmlcodec = 'xml' // use xml escaping instead of HTML4 escaping
            codecs {
                expression = 'html' // escapes values inside ${}
                scriptlet = 'html' // escapes output from scriptlets in GSPs
                taglib = 'none' // escapes output from taglibs
                staticparts = 'none' // escapes output from static template parts
            }
        }
        // escapes all not-encoded output at final stage of outputting
        // filteringCodecForContentType.'text/html' = 'html'
    }
}


grails.converters.encoding = "UTF-8"
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart = false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

// configure passing transaction's read-only attribute to Hibernate session, queries and criterias
// set "singleSession = false" OSIV mode in hibernate configuration after enabling
grails.hibernate.pass.readonly = false
// configure passing read-only to OSIV session by default, requires "singleSession = false" OSIV mode
grails.hibernate.osiv.readonly = false

environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
}

// log4j configuration
log4j.main = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error 'org.codehaus.groovy.grails.web.servlet',        // controllers
            'org.codehaus.groovy.grails.web.pages',          // GSP
            'org.codehaus.groovy.grails.web.sitemesh',       // layouts
            'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
            'org.codehaus.groovy.grails.web.mapping',        // URL mapping
            'org.codehaus.groovy.grails.commons',            // core / classloading
            'org.codehaus.groovy.grails.plugins',            // plugins
            'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
            'org.springframework',
            'org.hibernate',
            'net.sf.ehcache.hibernate'
}

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'gestion.secureapp.SecAppUser'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'gestion.secureapp.SecAppUserSecAppRole'
grails.plugin.springsecurity.authority.className = 'gestion.secureapp.SecAppRole'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
    //inicio de index de sistemagestion donde estan los cudraditos
        "/login/auth"                                            : ["permitAll"],
        '/'                                                      : ['permitAll'],
        '/index'                                                 : ['ROLE_USUARIO', 'ROLE_MECANICO', 'ROLE_ADMIN'],
        '/index.gsp'                                             : ['ROLE_MECANICO', 'ROLE_USUARIO'],
    //fin
    //Automoviles inicio
        '/automovil/nuevoAuto'                                   : ['ROLE_MECANICO'],
        '/automovil/guardarAuto'                                 : ['ROLE_MECANICO'],
        '/automovil/guardarModificacion'                         : ['ROLE_MECANICO'],
        '/automovil/index'                                       : ['ROLE_MECANICO'],
        '/automovil/modificarAuto'                               : ['ROLE_MECANICO'],
        '/automovil/eliminarAuto'                                : ['ROLE_MECANICO'],
    //Automoviles fin
    //Servicios inicio
        '/servicios/save'                                        : ['ROLE_MECANICO'],
        '/servicios/crearUsuario'                                : ['ROLE_ADMIN'],
        '/servicios/index'                                       : ['ROLE_USUARIO', 'ROLE_MECANICO', 'ROLE_ADMIN'],
        '/servicios/crearcita'                                   : ['ROLE_USUARIO', 'ROLE_MECANICO'],
        '/servicios/guardar'                                     : ['ROLE_USUARIO', 'ROLE_MECANICO'],
        '/servicios/citasUsuario'                                : ['ROLE_USUARIO', 'ROLE_MECANICO'],
        '/servicios/guardarModificacion'                         : ['ROLE_USUARIO', 'ROLE_MECANICO'],
        '/servicios/guardarMarca'                                : ['ROLE_MECANICO', 'ROLE_USUARIO'],
        '/servicios/citaterminada'                               : ['ROLE_MECANICO', 'ROLE_USUARIO'],
        '/servicios/findAutoByMarca'                             : ['ROLE_MECANICO', 'ROLE_USUARIO'],
        '/servicios/guardarusu'                                  : ['ROLE_ADMIN'],
        '/servicios/detalleUsuario'                              : ['ROLE_ADMIN'],
        '/servicios/eliminarUsuario'                             : ['ROLE_ADMIN'],
        '/servicios/editarUsuario'                               : ['ROLE_ADMIN'],
        '/servicios/hacerservicio'                               : ['ROLE_MECANICO'],
        '/servicios/eliminarCita'                                : ['ROLE_USUARIO'],
        '/servicios/reagendarCita'                               : ['ROLE_USUARIO'],
        '/reagendarCita/reagendarCita'                           : ['ROLE_USUARIO'],
        '/servicios/prueba'                                      : ['ROLE_USUARIO'],
        '/servicios/guardarReagendacion'                         : ['ROLE_USUARIO'],
        '/servicios/hacerReagendacion'                           : ['ROLE_MECANICO'],
    '/servicios/guardarReagendacionTerminada'                    : ['ROLE_MECANICO'],
        '/tiposervicio/actualizaServicio'                           : ['ROLE_MECANICO'],

    
    

    //Servicios fin
    //Servicios inicio
        '/tiposervicio/index'                                    : ['ROLE_MECANICO'],
        '/tiposervicio/modificarTipoServicio'                    : ['ROLE_USUARIO', 'ROLE_MECANICO'],
        '/tiposervicio/nuevoTipoServicio'                        : ['ROLE_MECANICO'],
        '/tiposervicio/crearServicio'                            : ['ROLE_MECANICO'],
        '/tiposervicio/eliminaServicio'                          : ['ROLE_MECANICO'],
    //Servicios fin
    //inicio Marca
        '/marca/modificarMarca'                                  : ['ROLE_MECANICO'],
        '/marca/nuevaMarca'                                      : ['ROLE_MECANICO'],
        '/marca/eliminarMarca'                                   : ['ROLE_MECANICO'],
        '/marca/guardarModificacion'                             : ['ROLE_MECANICO'],
        '/marca/index'                                           : ['ROLE_MECANICO'],
        '/marca/guardarMarca'                                    : ['ROLE_MECANICO'],
    //Marca fin
    //Inicio Refaccion
        '/refaccion/listaPedidos'                                : ['ROLE_MECANICO'],
        '/refaccion/pedirRefaccion'                              : ['ROLE_MECANICO'],
        '/refaccion/pedirRefaccion/refaccionPor'                 : ['ROLE_MECANICO'],
        '/refaccion/pedirRefaccion/detallesRefaccionPorDemanda'  : ['ROLE_MECANICO'],
        '/refaccion/pedirRefaccion/detallesRefaccionPorSiniestro': ['ROLE_MECANICO'],
        '/refaccion/pedirRefaccion/resumenPeticion'              : ['ROLE_MECANICO'],
    //Fin refaccion
    //Inicio Refaccion
        '/pedido/listaPedidos'                                   : ['ROLE_MECANICO'],
        '/pedido/consultaPedido'                                 : ['ROLE_MECANICO'],
        '/pedido/guardaRefaccion'                                : ['ROLE_MECANICO'],
        '/pedido/eliminaRefaccion'                               : ['ROLE_MECANICO'],
        '/pedido/consultaRefacciones'                            : ['ROLE_MECANICO'],
        '/pedido/pedirRefaccion'                                 : ['ROLE_MECANICO'],
        '/pedido/pedirRefaccion/refaccionPor'                    : ['ROLE_MECANICO'],
        '/pedido/pedirRefaccion/detallesRefaccionPorDemanda'     : ['ROLE_MECANICO'],
        '/pedido/pedirRefaccion/detallesRefaccionPorSiniestro'   : ['ROLE_MECANICO'],
        '/pedido/pedirRefaccion/resumenPeticion'                 : ['ROLE_MECANICO'],
    //Fin refaccion
        '/index.gsp'                                             : ['permitAll'],
        '/assets/**'                                             : ['permitAll'],
        '/**/js/**'                                              : ['permitAll'],
        '/**/css/**'                                             : ['permitAll'],
        '/**/images/**'                                          : ['permitAll'],
        '/**/favicon.ico'                                        : ['permitAll']
]
