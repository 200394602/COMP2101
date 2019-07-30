gwmi -class win32_product -filter "vendor!='Microsoft Corporation'" | 
sort installdate | 
format-table Name, Vendor, Version, InstallDate 