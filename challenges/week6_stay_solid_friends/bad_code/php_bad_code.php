<?php

## if you want a hint for what principles are broken
## decode the following hex strings
#
#
# 53 52 50
# 4f 43 50

class InvoicePrinter {
    public function printInvoice($invoice, $format) {
        if ($format == 'pdf') {
            echo "Printing PDF invoice...";
        } else if ($format == 'html') {
            echo "Printing HTML invoice...";
        } else {
            echo "Unknown format";
        }
    }
}

