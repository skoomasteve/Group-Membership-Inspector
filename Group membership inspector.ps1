#Group membership inspector

# Copyright 2020 Steven Soward | MIT License

$ErrorActionPreference = "Stop"
$date = get-date 

function groupdelve{

$group = Get-ADGroup -filter * -Properties groupcategory | Out-GridView -title "Steven's Group membership inspector - , use the filter to search; select the desired group and click 'ok' to see group members" -PassThru | format-wide
 

$group = $group | Out-String
$group = $group.trim()

 $number = get-ADGroupmember -identity $group
 $number = $number.count
 if ($number -eq 0){$userresponse=[System.Windows.MessageBox]::Show('The selected item has no members. ')
 groupdelve}
    
$userresponse=[System.Windows.MessageBox]::Show("The $Group group has $number members")

$Selected = get-ADGroupmember -identity $group | Out-GridView  -title "Showing members of $group, select member(s) and use ctrl+c to copy. Take note of any nested groups || $date" -PassThru | format-wide 
Write-Host $selected
$selected= $Selected | out-string
$Selected = $Selected.Trim()
Write-Host $Selected
#$group=$selected


nestedviewer

 


}


  
 
groupdelve

function nestedviewer{

#$check = $Nestedview
$Nestedview = get-ADGroupmember -identity $Selected | Out-GridView  -title "Showing members of $selected, select member(s) and use ctrl+c to copy. Take note of any nested groups || $date" -PassThru | format-wide 
#
$Nestedview = $Nestedview | Out-String
if ($nestedview -eq $null) {exit}
$Nestedview = $Nestedview.Trim()
$selected = $Nestedview


$number2 = get-ADGroupmember -identity $nestedview
 $number2 = $number2.count
 if ($number2 -eq 0){$userresponse=[System.Windows.MessageBox]::Show('The Selected item has no members. ')
 nestedview}
     $userresponse=[System.Windows.MessageBox]::Show("The $Nestedview group has $number2 members")

do {
nestedviewer
  
  }
  until ($check -eq $selected)
}  
    # $userresponse=[System.Windows.MessageBox]::Show('The Selected group members have been copied to your clipboard.
    #  Be sure to check for nested groups and run again if needed')
     exit

