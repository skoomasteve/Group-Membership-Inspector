# Group-Membership-Inspector
A GUI tool to quickly determine AD group members.  Especially helpful during audit, suitable for audit evidence screenshots.  It can also help track down nested groups.  



![image](https://user-images.githubusercontent.com/43890114/115983903-bdd60100-a569-11eb-9fee-758b50e2b629.png)



## Tips

Use the filter to quickly find groups/users, sort by any of the columns available.  Once the desired users are selected use ctrl + c to copy comma delimited text; this can be pasted into a .csv file for easy use or further scripting.

## Considerations

- Requires RSOP tools on a domain-jonied machine  
- No special privileges are needed.  
- Powershell execution policy may need to be modified if execution fails.    
- Diving into groups that have been previously renamed may cause the app to exit.





## To-do

- Remove extranious code in the "nestedviewer" function, i.e. consolidate functionality into the "groupdelve" function
  F
