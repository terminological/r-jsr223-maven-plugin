# Generated by maven-r-jsr223-plugin: do not edit by hand
# returns a reference to a ${class.getName()} java class in a jsr223 engine
J${class.getName()} = R6::R6Class("J${class.getName()}", public=list( 
	api = NULL,
	#### constructor ----
	initialize = function(<#list class.getConstructor().getParameterNames() as param>${param}<#sep>, </#list>) {
		class.path <- c(
	  		system.file("java", "groovy-all-2.4.17.jar", package="${model.getConfig().getPackageName()}"),
	  		system.file("java", "${jarFileName}", package="${model.getConfig().getPackageName()}")
		)	
		self$api = jsr223::ScriptEngine$new("groovy", class.path)
		self$api$setDataFrameRowMajor(FALSE)
	<#list class.getConstructor().getParameterNames() as param>
		self$api$tmp_${param} = ${param};
	</#list>
		self$api %@% '
			import ${class.getClassName()};
			x = new ${class.getName()}(<#list class.getConstructor().getParameterNames() as param>tmp_${param}<#sep>, </#list>);
		'
	<#list class.getConstructor().getParameterNames() as param>
		self$api$remove("tmp_${param}")
	</#list>
	},

<#list class.getMethods() as method>
	#### method: ${method.getName()} ----
	# returns: ${method.getReturnType()}
	${method.getName()} = function(<#list method.getParameterNames() as param>${param}<#sep>, </#list>) {
<#if method.isFluent()>
	<#list method.getParameterNames() as param>
		self$api$tmp_${param} = ${param};
	</#list>
		self$api %@% 'x = x.${method.getName()}(<#list method.getParameterNames() as param>tmp_${param}<#sep>, </#list>);';
	<#list method.getParameterNames() as param>
		self$api$remove("tmp_${param}")
	</#list>
		invisible(self);
<#else>
		return(self$api$invokeMethod("x", "${method.getName()}"<#list method.getParameterNames() as param>, ${param}</#list>))
</#if>
	},

</#list>
	print = function() {
		return(self$api$invokeMethod("x", "toString"));
	}
))
