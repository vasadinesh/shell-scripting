
#!/bin/bash

echo "Enter EC2 Instance ID:"
read INSTANCE_ID

echo "Deleting EC2 Instance: $INSTANCE_ID"

aws ec2 terminate-instances \
    --instance-ids "$INSTANCE_ID" \
    --region us-east-1

echo "EC2 Instance termination request submitted!"
