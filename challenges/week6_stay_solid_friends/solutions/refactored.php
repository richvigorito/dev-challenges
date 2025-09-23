<?php

/**

## broken solid principle's:  OCP, SRP


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
 */


///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
/*
 * refactored code addresses the following:
 *
 * SRP: InvoicePrinter class no long responsible for print pdfs and html
 * OCP: You can now add more formats)(json,text,etc) without 
 *      having to adjust the base
 */

abstract class InvoicePrinter {
    abstract public function printInvoice($invoice): void;
}

class PdfInvoice extends InvoicePrinter{
    public function printInvoice($invoice): void {
            echo "\nPrinting PDF invoice...\n";
    }
}


class HtmlInvoice extends InvoicePrinter{
    public function printInvoice($invoice): void {
            echo "\nPrinting HTML invoice...\n";
    }
}


// Example usage:
$invoice = ['id' => 123]; // some invoice data

$pdf = new PdfInvoice();
$pdf->printInvoice($invoice); 
$html = new HtmlInvoice();
$html->printInvoice($invoice); 
