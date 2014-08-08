
<%@ page import="com.hs.poc.Record" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'record.label', default: 'Record')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-record" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-record" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="recordStatus" title="${message(code: 'record.recordStatus.label', default: 'Record Status')}" />
					
						<g:sortableColumn property="issueDate" title="${message(code: 'record.issueDate.label', default: 'Issue Date')}" />
					
						<g:sortableColumn property="recordCount" title="${message(code: 'record.recordCount.label', default: 'Record Count')}" />
					
						<g:sortableColumn property="recordName" title="${message(code: 'record.recordName.label', default: 'Record Name')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${recordInstanceList}" status="i" var="recordInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${recordInstance.id}">${fieldValue(bean: recordInstance, field: "recordStatus")}</g:link></td>
					
						<td><g:formatDate date="${recordInstance.issueDate}" /></td>
					
						<td>${fieldValue(bean: recordInstance, field: "recordCount")}</td>
					
						<td>${fieldValue(bean: recordInstance, field: "recordName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${recordInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
