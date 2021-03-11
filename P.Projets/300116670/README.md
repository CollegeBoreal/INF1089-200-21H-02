


```powershell
$servers=Get-Content ".\ServersList.txt"
foreach($server in $servers){
    cmdkey /generic:$server /user:"Domain\UserName" /pass:"Password"
    mstsc /v: $server
    #to bypass the security alerts or certificate errors that has to be done manually
    sleep 5
    cmdkey /delete:$server
}
```

# References

https://social.technet.microsoft.com/Forums/en-US/55035066-8e5f-483e-8e36-3dac199f5006/powershell-script-to-rdp-automatically-into-multiple-servers?forum=winserverpowershell
