<%@ page import="com.hs.poc.Record" %>



<div class="fieldcontain ${hasErrors(bean: recordInstance, field: 'recordStatus', 'error')} ">
	<label for="recordStatus">
		<g:message code="record.recordStatus.label" default="Record Status" />
	</label>
	<%--<input type="checkbox" name="recordStatus" checked="checked" />--%>
	<g:checkBox name="recordStatus" value="${recordInstance?.recordStatus == 'ON' ? 'ON' : null}"/>
	
</div>

<div class="fieldcontain ${hasErrors(bean: recordInstance, field: 'issueDate', 'error')} required">
	<label for="issueDate">
		<g:message code="record.issueDate.label" default="Issue Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="issueDate" precision="day"  value="${recordInstance?.issueDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: recordInstance, field: 'recordCount', 'error')} required">
	<label for="recordCount">
		<g:message code="record.recordCount.label" default="Record Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="recordCount" type="number" value="${recordInstance.recordCount}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: recordInstance, field: 'recordName', 'error')} required">
	<label for="recordName">
		<g:message code="record.recordName.label" default="Record Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="recordName" required="" value="${recordInstance?.recordName}"/>

</div>

