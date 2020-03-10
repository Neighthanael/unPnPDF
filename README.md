# unPnPDF
A process for taking a multi-slide per page file to a single-slide per page pdf

This is a small project that was inspired by the following post
https://superuser.com/questions/235074/how-can-i-split-a-pdfs-pages-down-the-middle/235401#235401

Given a file with 4 pages/slides per page, this script can assist in outputing a single file with 1 page/slide per page.

The process of saving a file with 'n' pages/slides per page was decsribed to me as a process called "PnPDF";
this leads to the name "unPnPDF", since the goal of this script is to reverse that process.

Software required:
Windows Power Shell:
Used to call the other two programs used. Powershell was chosen as it is built into Windows, and has a built-in IDE that can be used to troubleshoot and modify the script during the creation process.

Ghostscript:
Used to crop each page of an input file.
Output is 4 separate files that each have only one corner of the original input file.

PDF Toolkit
Used to merge the separate files output from Ghostscript
Output is a single file with one slide/page per page

How to Use:
 - TODO
