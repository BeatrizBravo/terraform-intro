
## Commands:
Check syntax:
```Terraform
terraform validate
```
Check format:
```Terraform
terraform fmt
```

Information about Virtual Private Clouds (VPCs) in AWS account. Detailed description of the specified VPC or a list of all VPCs in the account in a specific region setup in the aws cli configuration.
```cmd
aws ec2  describe-vpcs
```

Destroy a resource
```Terraform
terraform destroy
```


Resource actions in Terraform are indicated with the following symbols:<br> + create<br>   ~ update in-place <br>- destroy <br>-/+ destroy and then create replacement

## main.tf
![Vpc with 6 subnet in 2 availability and internet gateway](./vpc-6subnets.drawio%20(1).png)