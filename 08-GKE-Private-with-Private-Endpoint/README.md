# Terraform

```t
# List Compute VM Instances
gcloud compute instances list

## SSH to GKE Node VM
gcloud compute ssh --zone "ZONE" "VM-NAME" --internal-ip  --project "terra-55091"
gcloud compute ssh --zone "us-central1-b" "gke-hr-dev-gke-clust-hr-dev-linux-nod-50d31441-2s7c" --internal-ip  --project "terra-55091"
exit
```
```t
# Connect to bastion VM
gcloud compute ssh --zone "us-central1-a" "hr-dev-bastion-vm" --tunnel-through-iap --project "terra-55091"

# Verify installed software
gcloud version
kubectl version 
terraform version

# Configure gcloud cli with user
gcloud config configurations list
gcloud auth login
gcloud config configurations list
gcloud config list

# Set Project
gcloud config set project PROJECT_ID
gcloud config set project gcplearn9

# Configure kubectl cli
gcloud container clusters get-credentials hr-dev-gke-cluster --region us-central1 --project gcplearn9

# List Kubernetes Nodes
kubectl get nodes
```
