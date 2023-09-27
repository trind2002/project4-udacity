Setup environment

1. Alow Cloud9 to access the Github repo:
Generate a pair of SSH keys, if you want your Cloud9 env to be able to push changes to the Github repo
ssh-keygen -t rsa
View the contents of the public key
cat /home/ec2-user/.ssh/id_rsa.pub
1. Clone the forked repo into the Cloud9 environment using:
git clone https://github.com/trind2002/project4-udacity.git
cd project4-udacity
1. Now, you're ready to create your local environment!
python3 -m venv ~/.devops
source ~/.devops/bin/activate
1. Create a virtual environment and install dependencies
// Run 
project4-udacity
python3 -m pip install -r requirements.txt
//
/home/ec2-user/.devops/bin/python3 -m pip install --upgrade pip -> upgrade
Installing dependencies via project Makefile
make install

Project Tasks
1. Task 1: Complete the Dockerfile -> Done
2. Task 2: Run a Container & Make a Prediction -> Done
a. Create repo for Amazone ECR: udacity
View push command and run steps
run:
./run_docker.sh
b. open a separate tab or terminal window
cd project4-udacity/
run: ./make_prediction.sh
3. Task 3: Improve Logging & Save Output -> Done
Once you have updated your app.py code, save it and ./run_docker.sh again and make the same prediction in a separate terminal window.
Copy and paste this terminal output, which has log info, in a text file docker_out.txt
4. Task 4: Upload the Docker Image -> Done
Need to login -> run: docker login docker.io
./upload_docker.sh
5. Task 5: Configure Kubernetes to Run Locally -> Done
a. Install minikube
Guide: https://minikube.sigs.k8s.io/docs/start/
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
b.
https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
c.
minikube start
Increase the Cloud9 memory limits: Run the resize.sh script present in this folder to increase the Cloud9 available-memory limits.
Deploy an Event-Driven Microservice -> Lambda Functions
cd DevOps_Microservices/Supporting-material
# The instructor shows `cd awslambda` per hierarchy of his personal repo
df -h
chmod +x resize.sh
./resize.sh 
df -h
cd ..
6. Task 6: Deploy with Kubernetes and Save Output Logs -> Done

./run_kubernetes.sh
./make_prediction.sh

d. Remove: kubectl delete deployment udacity-app
kubectl get services udacity-app
minikube service udacity-app
kubectl config view

Task 7: [Important] Delete Cluster 
Run:
minikube delete