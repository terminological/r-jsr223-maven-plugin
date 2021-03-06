% Generated by maven-r-jsr223-plugin: do not edit by hand

\name{${class.getName()}}

\alias{${class.getName()}}

\title{${class.getValue("title")}}

\usage{\preformatted{
library(${model.getConfig().getPackageName()})
J = JavaApi$new();
instance <- J$${class.getName()}$new(...);
}}

\description{
	${class.getDescription()!}
}

\details{
	${class.getDetails()!}
}

\examples{
<#list class.getMethods() as method>
## -----------------------------------
## Method `${class.getName()}$${method.getName()}`
## -----------------------------------
	<#list method.getList("examples") as example>
  ${example}
	</#list>

</#list>
}

\keyword{java api}

\section{Methods}{
	\subsection{Constructors}{
		\itemize{
<#list class.getConstructors() as method>
			\item \href{#method-${method.getName()}}{\code{J$${class.getName()}$${method.getName()}(${method.getParameterCsv()})}}
		}
	}
</#list>
	\subsection{Static methods}{
		\itemize{
<#list class.getStaticMethods() as method>
			\item \href{#method-${method.getName()}}{\code{J$${class.getName()}$${method.getName()}(${method.getParameterCsv()})}}
</#list>
		}
	}
	\subsection{Instance methods}{
		\itemize{
<#list class.getInstanceMethods() as method>
			\item \href{#method-${method.getName()}}{\code{instance$${method.getName()}(${method.getParameterCsv()})}}
</#list>
			\item \code{instance$clone()}
			\item \code{instance$print()}
		}
	}

<#list class.getConstructorAndMethods() as method>
	\if{html}{\out{<hr>}}
	\if{html}{\out{<a id="method-${method.getName()}"></a>}}
	
	\subsection{Method \code{${method.getName()}()}}{
		${method.getDescription()}
	}

	\subsection{Usage}{
		\if{html}{\out{<div class="r">}}
		\preformatted{
	<#if method.isStatic()>
  library(${model.getConfig().getPackageName()})
  J <- JavaApi$new()
  J$${class.getName()}$${method.getName()}(${method.getParameterCsv()})
	<#else>
  library(${model.getConfig().getPackageName()})
  J <- JavaApi$new()
  instance <- J$${class.getName()}$new(...);
  instance$${method.getName()}(${method.getParameterCsv()})
  	</#if>
		}
		\if{html}{\out{</div>}}
	}
	
	\subsection{Arguments}{
		\if{html}{\out{<div class="arguments">}}
		\describe{
			\itemize{
	<#list method.getParameterNames() as paramName>
				\item{${method.getParameterDescription(paramName)}}{ - (java expects a ${method.getParameterType(paramName)})}
	</#list>
			}
		}
		\if{html}{\out{</div>}}
	}

	\subsection{Returns}{
	<#if method.isFactory()>
		R6 ${method.getReturnSimple()} object: ${method.getValue("return")!}
	<#else>
		${method.getReturnType()}: ${method.getValue("return")!}
	</#if>
	}

	\subsection{Examples}{
		\if{html}{\out{<div class="r example copy">}}
		\preformatted{
	<#list method.getList("examples") as example>
  ${example}
	</#list>
		}
		\if{html}{\out{</div>}}
	}
</#list>
}