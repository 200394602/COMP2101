#Create a script which produces a report showing the space usage for the filesystems in the computer.

#Use the get-wmiobject command as shown below to get a collection of disk filesystem objects.
#Only include filesystems which have a non-zero size. Use a pipeline with a where-object filter.
#Your report must be a table showing only the filesystem drive letter, size of filesystem, free space, and providername.
#Use format-table to format your output and your numbers must be human-friendly.

function Show-SpaceUsage {
  param (
    [long]$MinFreeInBytes 
  )
  $drives = Get-WmiObject -Class win32_logicaldisk
  $filesystems = $drives | Where-Object size -GT 0
  $filesystems | Format-Table -AutoSize DeviceID,
                                    @{ n= "Size(GB)" ; e= {$_.size / 1gb -as [int]} } ,
                                    @{ n= "Free Space(GB)" ; e= {$_.freespace / 1gb -as [int]} } , 
                                    ProviderName
}

Show-SpaceUsage