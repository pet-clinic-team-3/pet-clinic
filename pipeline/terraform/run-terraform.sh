#!/bin/bash

SERVICE_PRINCIPAL=$1
SERVICE_PRINCIPAL_SECRET=$2
TENANT_ID=$3
SUBSCRIPTION=$4

ssh-keygen -t rsa -b 4096 -N ""  -q -f  ~/.ssh/id_rsa
SSH_KEY=$(cat ~/.ssh/id_rsa.pub)

terraform init


terraform plan -var serviceprinciple_id=$SERVICE_PRINCIPAL \
-var serviceprinciple_key="$SERVICE_PRINCIPAL_SECRET" \
-var tenant_id=$TENANT_ID \
-var subscription_id=$SUBSCRIPTION \
-var ssh_key="$SSH_KEY" \
-auto-approve


terraform import -var serviceprinciple_id=$SERVICE_PRINCIPAL \
-var serviceprinciple_key="$SERVICE_PRINCIPAL_SECRET" \
-var tenant_id=$TENANT_ID \
-var subscription_id=$SUBSCRIPTION \
-var ssh_key="$SSH_KEY" \
module.cluster.azurerm_resource_group.main /subscriptions/$SUBSCRIPTION/resourceGroups/petclinic-aks


terraform import -var serviceprinciple_id=$SERVICE_PRINCIPAL \
-var serviceprinciple_key="$SERVICE_PRINCIPAL_SECRET" \
-var tenant_id=$TENANT_ID \
-var subscription_id=$SUBSCRIPTION \
-var ssh_key="$SSH_KEY" \
module.cluster.azurerm_kubernetes_cluster.main /subscriptions/$SUBSCRIPTION/resourceGroups/petclinic-aks/providers/Microsoft.ContainerService/managedClusters/petclinic-aks


terraform apply -var serviceprinciple_id=$SERVICE_PRINCIPAL \
-var serviceprinciple_key="$SERVICE_PRINCIPAL_SECRET" \
-var tenant_id=$TENANT_ID \
-var subscription_id=$SUBSCRIPTION \
-var ssh_key="$SSH_KEY" \
-auto-approve

sudo az login --service-principal -u $SERVICE_PRINCIPAL -p $SERVICE_PRINCIPAL_SECRET --tenant $TENANT_ID
sudo az aks get-credentials -n petclinic-aks -g petclinic-aks --overwrite-existing
sudo chown -R $USER /home/vsts/.kube
kubectl apply -f ../k8s

sleep 15

kubectl get svc 



