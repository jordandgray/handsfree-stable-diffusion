STACK_NAME="yek401-my-stack-name"
KEY_NAME="handsfree"
aws cloudformation deploy --template-file handsfree-sd-g5.yml --parameter-overrides "KeyName=$KEY_NAME"  --region us-east-1 --stack-name $STACK_NAME
READY_TIME=`date -u --date="+30 minutes"`
INSTANCE_IP=`aws cloudformation describe-stacks --region us-east-1 --query 'Stacks[0].Outputs[0].OutputValue' --output text --stack-name $STACK_NAME` 
echo "\nHandsfree-sd script requires around 30 mins to complete stable diffusion + tweaks installation\n"
echo "Ready at around:   $READY_TIME"
echo "webui link:        http://"$INSTANCE_IP":7860"
echo "SSH to the EC2:    ssh -i \"$KEY_NAME.pem\" ubuntu@$INSTANCE_IP"
echo "\nYou can also monitor with the progress \`tmux a\` by ssh to the instance after a couple of minutes\n"
