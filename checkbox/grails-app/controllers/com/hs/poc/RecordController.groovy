package com.hs.poc



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RecordController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Record.list(params), model:[recordInstanceCount: Record.count()]
    }

    def show(Record recordInstance) {
        respond recordInstance
    }

    def create() {
        respond new Record(params)
    }

    @Transactional
    def save(Record recordInstance) {

        //this prints a dump of the objects to the console at runtime, quick and easy for debug.
        println recordInstance?.dump()

        // the http post parameters a bound to a map object called params in grails
        println params.dump()

        if (recordInstance == null) {
            notFound()
            return
        }

        // we know we found the instance
        // add logic to handel the checkbox

        //if params.recordStatus has a value, set recordStatus = 'ON', else set to OFF
        recordInstance.recordStatus = params?.recordStatus ? 'ON' : 'OFF'

        if (recordInstance.hasErrors()) {
            respond recordInstance.errors, view:'create'
            return
        }

        recordInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'record.label', default: 'Record'), recordInstance.id])
                redirect recordInstance
            }
            '*' { respond recordInstance, [status: CREATED] }
        }
    }

    def edit(Record recordInstance) {
        respond recordInstance
    }

    @Transactional
    def update(Record recordInstance) {
//       if(recordInstance.recordStatus !=null && recordInstance.recordStatus == "on"){
//			recordInstance.recordStatus="Y"
//		}else{
//			recordInstance.recordStatus="N"
//		}

        //this prints a dump of the objects to the console at runtime, quick and easy for debug.
        println recordInstance?.dump()

        // the http post parameters a bound to a map object called params in grails
        println params.dump()

        // we know we found the instance
        // add logic to handel the checkbox

        //if params.recordStatus has a value, set recordStatus = 'ON', else set to OFF
        recordInstance.recordStatus = params?.recordStatus ? 'ON' : 'OFF'

		if (recordInstance == null) {
            notFound()
            return
        }

        if (recordInstance.hasErrors()) {
            respond recordInstance.errors, view:'edit'
            return
        }

        recordInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Record.label', default: 'Record'), recordInstance.id])
                redirect recordInstance
            }
            '*'{ respond recordInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Record recordInstance) {

        if (recordInstance == null) {
            notFound()
            return
        }

        recordInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Record.label', default: 'Record'), recordInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'record.label', default: 'Record'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
