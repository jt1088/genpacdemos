/**
 * 
 */
package com.hs.poc

import java.util.Date;

/**
 * @author 400219821
 *
 */
class Record {
	String recordName
	String recordStatus
	long recordCount
	Date issueDate
	
	static constraints = {
		recordStatus nullable:true ,blank: true
	}
}
