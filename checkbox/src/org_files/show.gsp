
<%@ page import="com.hs.poc.Record" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'record.label', default: 'Record')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-record" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-record" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list record">
			
				<g:if test="${recordInstance?.recordStatus}">
				<li class="fieldcontain">
					<span id="recordStatus-label" class="property-label"><g:message code="record.recordStatus.label" default="Record Status" /></span>
					
						<span class="property-value" aria-labelledby="recordStatus-label"><g:fieldValue bean="${recordInstance}" field="recordStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recordInstance?.issueDate}">
				<li class="fieldcontain">
					<span id="issueDate-label" class="property-label"><g:message code="record.issueDate.label" default="Issue Date" /></span>
					
						<span class="property-value" aria-labelledby="issueDate-label"><g:formatDate date="${recordInstance?.issueDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${recordInstance?.recordCount}">
				<li class="fieldcontain">
					<span id="recordCount-label" class="property-label"><g:message code="record.recordCount.label" default="Record Count" /></span>
					
						<span class="property-value" aria-labelledby="recordCount-label"><g:fieldValue bean="${recordInstance}" field="recordCount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recordInstance?.recordName}">
				<li class="fieldcontain">
					<span id="recordName-label" class="property-label"><g:message code="record.recordName.label" default="Record Name" /></span>
					
						<span class="property-value" aria-labelledby="recordName-label"><g:fieldValue bean="${recordInstance}" field="recordName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:recordInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${recordInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
