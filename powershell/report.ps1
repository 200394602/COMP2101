""
"System Information Report"
"-------------------------"
""

"A] Operating System Information"

gwmi -class win32_operatingsystem | fl Name, Version
 
""
"B] System Hardware Description"

gwmi -class win32_computersystem | fl Description

""
"C] Processor Description" 

gwmi -class win32_processor | 
fl @{n="Speed(Mhz)"; e={$_.MaxClockSpeed}}, 
NumberofCores, 
                @{n="L1 Cache Size";e={switch($_.L1CacheSize){$null{$stat="Information is not available at the moment."}
                0{$stat="Wrong information found on the system. Size recorded = 0"}};$stat}}, 

                @{n="L2 Cache Size";e={switch($_.L2CacheSize){
                0{$stat="Wrong information found on the system. Size recorded = 0"}};$stat}},    
                    
                @{n="L3 Cache Size";e={switch($_.L3CacheSize){
                0{$stat="Wrong information found on the system. Size recorded = 0"}};$stat}}


""
"D] Physical Memory Information"

$totalcapacity = 0
gwmi -class win32_physicalmemory |
foreach {
 new-object -TypeName psobject -Property @{
 Manufacturer = "Information not available at the moment" 
 "Speed (MHz)" = $_.speed
 "Size (MB)" = $_.capacity/1mb
 Bank = $_.banklabel
 Slot = $_.devicelocator
 }
 $totalcapacity += $_.capacity/1gb
} |
ft -auto Manufacturer, "Size (MB)", "Speed (MHz)", Bank, Slot
"Total RAM: ${totalcapacity}GB "

""
"E] Physical Disk Drive Memory"

gwmi -class win32_DiskDrive |
Foreach-Object {
$_.GetRelated("Win32_DiskPartition") |
foreach {$logicaldisk = $_.GetRelated("Win32_LogicalDisk"); 
if ($logicaldisk.size) {
$details = gwmi -class win32_DiskDrive
new-object -TypeName psobject -Property @{
Manufacturer = $details.Manufacturer
Model = $details.Model
"Drive Letter" = $logicaldisk.DeviceID
"Size (GB)" = $logicaldisk.size/1gb -as [int]
"Free Space (GB)" = $logicaldisk.freespace/1gb -as [int]
"Free Space %" = $logicaldisk.freespace / $logicaldisk.size * 100 -as [int]
}}}} |
ft -auto *

""
"F] Video Card Information"

gwmi -class win32_videocontroller | Format-list Description, 
@{n="Video Card Vendor"; e={$_.AdapterCompatibility}},
@{n="Current Screen Resolution"; e={$_.VideoModeDescription}}

""