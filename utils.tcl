# stuff to make coding eaiser for new people on project
proc lget {args} {return -code ok [lindex {*}$args]}
proc else {body} {uplevel $body}
rename exec _exec
# exec but return error code instead of crashing
proc exec {args} {
    if {[catch {_exec {*}$args} res opt]} {
        return -code ok [lget [dict get $opt -errorcode] 2]
    }
    else { return -code ok $res }
}