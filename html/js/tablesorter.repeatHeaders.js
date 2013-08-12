/**
 * Created by ${PRODUCT_NAME}.
 * User: Carl "Tex" Morgan
 * Date: ${DATE}
 * Time: ${TIME}
 * All rights reserved by Inselberge Inc. unless otherwise stated.
 */
$(function () {
    // add new widget called repeatHeaders
    $.tablesorter.addWidget({
        // give the widget a id
        id: "repeatHeaders",
        // format is called when the on init and when a sorting has finished
        format: function(table) {
            // cache and collect all TH headers
            if(!this.headers) {
                var h = this.headers = [];
                $("thead th",table).each(function() {
                    h.push(
                        "<th>" + $(this).text() + "</th>"
                    );

                });
            }

            // remove appended headers by classname.
            $("tr.repeated-header",table).remove();

            // loop all tr elements and insert a copy of the "headers"
            for(var i=0; i < table.tBodies[0].rows.length; i++) {
                // insert a copy of the table head every 10th row
                if((i%6) == 5) {
                    $("tbody tr:eq(" + i + ")",table).before(
                        $("<tr></tr>").addClass("repeated-header").html(this.headers.join(""))

                    );
                }
            }

        }
    });

    // call the tablesorter plugin and assign widgets with id "zebra" (Default widget in the core) and the newly created "repeatHeaders"
    $("table").tablesorter({
        widgets: ['zebra','repeatHeaders']
    });

});