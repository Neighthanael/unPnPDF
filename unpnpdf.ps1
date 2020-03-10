# param(
#    [Parameter(Mandatory)]
#    [string]$inputFile
# )
# Prompt user for inputFile


# Taken from the steps described at https://superuser.com/questions/235074/how-can-i-split-a-pdfs-pages-down-the-middle/235401#235401

# As a reminder, this is how the coordinate system works.
# [-LEFT  -UP ]
# [-RIGH  -UP ]
# [-LEFT -DOWN]
# [-RIGH -DOWN]

# Setup-1
# -g2300x1750
# [-070.0 -465.0]
# [-313.0 -465.0]
# [-070.0 -151.7]
# [-313.0 -151.7]

# Setup-2
# -g2675x2025
# [-100.0 -322.0]
# [-424.0 -322.0]
# [-100.0 -087.2]
# [-424.0 -087.2]

# Setup-3
# -g2875x2200
# [-082.0 -322.0]
# [-422.0 -322.0]
# [-082.0 -071.5]
# [-422.0 -071.5]

# STEP 0 - Reset/Create all files to be blank
cp .\bin\blank.pdf .\bin\top-left.pdf
cp .\bin\blank.pdf .\bin\top-righ.pdf
cp .\bin\blank.pdf .\bin\bot-left.pdf
cp .\bin\blank.pdf .\bin\bot-righ.pdf
cp .\bin\blank.pdf .\bin\input.pdf
cp .\bin\blank.pdf .\bin\output.pdf

# STEP 1 - Copy the input PDF to input.pdf
cp '.\FourPerPage\CH10.pdf' .\bin\input.pdf | Out-Null

# STEP 2 - Split into 4 different files (Top Left) - (Top Right) - (Bottom Left) - (Bottom Right)
.\bin\Programs\gswin64.exe -o .\bin\top-left.pdf -sDEVICE=pdfwrite -g2675x2025 -c "<</PageOffset [-100.0 -322.0]>> setpagedevice" -f .\bin\input.pdf | Out-Null
.\bin\Programs\gswin64.exe -o .\bin\top-righ.pdf -sDEVICE=pdfwrite -g2675x2025 -c "<</PageOffset [-424.0 -322.0]>> setpagedevice" -f .\bin\input.pdf | Out-Null
.\bin\Programs\gswin64.exe -o .\bin\bot-left.pdf -sDEVICE=pdfwrite -g2675x2025 -c "<</PageOffset [-100.0 -087.2]>> setpagedevice" -f .\bin\input.pdf | Out-Null
.\bin\Programs\gswin64.exe -o .\bin\bot-righ.pdf -sDEVICE=pdfwrite -g2675x2025 -c "<</PageOffset [-424.0 -087.2]>> setpagedevice" -f .\bin\input.pdf | Out-Null

# STEP 3 - Combine all temp files to output.pdf
# Assume the page order is (Top Left) --> (Top Right) --> (Bottom Left) --> (Bottom Right)
.\bin\Programs\pdftk.exe A=.\bin\top-left.pdf B=.\bin\top-righ.pdf C=.\bin\bot-left.pdf D=.\bin\bot-righ.pdf shuffle A B C D output .\bin\output.pdf verbose | Out-Null

# STEP 4 - Done
# Open the input and output files to confirm the process worked as desired, and to save the output as a different file name if desired.
& 'C:\Program Files (x86)\Adobe\Acrobat DC\Acrobat\Acrobat.exe' .\bin\input.pdf
& 'C:\Program Files (x86)\Adobe\Acrobat DC\Acrobat\Acrobat.exe' .\bin\output.pdf

# These are the commands to open each of the 4 temp files if it's needed to trouble shoot.
# & 'C:\Program Files (x86)\Adobe\Acrobat DC\Acrobat\Acrobat.exe' .\bin\top-left.pdf
# & 'C:\Program Files (x86)\Adobe\Acrobat DC\Acrobat\Acrobat.exe' .\bin\top-righ.pdf
# & 'C:\Program Files (x86)\Adobe\Acrobat DC\Acrobat\Acrobat.exe' .\bin\bot-left.pdf
# & 'C:\Program Files (x86)\Adobe\Acrobat DC\Acrobat\Acrobat.exe' .\bin\bot-righ.pdf