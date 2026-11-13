
#!/bin/bash

# EC2 Instance Configuration

REGION="us-east-1"
INSTANCE_NAME="MyEC2Instance"
AMI_ID="ami-096ef200a877f36af"
INSTANCE_TYPE="t2.micro"
KEY_NAME="pair"
SECURITY_GROUP="sg-0ad7599f9ea7a0c24"

echo "Creating EC2 Instance..."

INSTANCE_ID=$(aws ec2 run-instances \
    --image-id $AMI_ID \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_NAME \
    --security-group-ids $SECURITY_GROUP \
    --region $REGION \
    --count 1 \
    --query 'Instances[0].InstanceId' \
    --output text)

echo "EC2 Instance Created Successfully!"
echo "Instance ID: $INSTANCE_ID"

echo "Waiting for EC2 instance to start..."

aws ec2 wait instance-running \
    --instance-ids $INSTANCE_ID \
    --region $REGION

PUBLIC_IP=$(aws ec2 describe-instances \
    --instance-ids $INSTANCE_ID \
    --region $REGION \
    --query 'Reservations[0].Instances[0].PublicIpAddress' \
    --output text)

echo "--------------------------------"
echo "Instance ID : $INSTANCE_ID"
echo "Public IP   : $PUBLIC_IP"
echo "Status      : Running"
echo "--------------------------------"
