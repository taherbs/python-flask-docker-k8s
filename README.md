# Python Flask
Hello world python flask REST API application running on docker/k8s (minikube)

## Run application without containers
### Prerequisites
- python3
- pip
- virtualenv

### Installation

* Clone the project and create/activate virtualenv.
* Install needed libraries.

```powershell
# On Windows
cd PROJECT_PATH
virtualenv .env # Create virtualenv - only the first time
.\.env\Scripts\activate # Activate virtualenv
pip install -r requirements.txt # install required packages
```

```bash
# On Linux
cd PROJECT_PATH
virtualenv .env # Create virtualenv - only the first time
. .env/bin/activate # Activate virtualenv
python -m pip install -r requirements.txt # install required packages
```

### run
```
# Dev mode
flask --app app.py --debug run

# Prod mode
```

## Run application with docker and docker-compose
### Prerequisites
- docker
- docker-compose
- Make (Optional)
  - [Install on windows](https://community.chocolatey.org/packages/make)
  - On Linux/Mac: the command exists by default.

### run
```
# Deploy using the docker/docker-compose commands commands
## Step 1: build containers
docker-compose build
### or
docker build -t flaskapp .
## Step 2: Run containers
docker-compose up
### or
docker run -e FLASK_ENV=development -p 5000:5000 flaskapp

# Deploy using the make commands:
## Build and deploy containers
make deploy

## Destroy containers
make destroy 

## Get make command help message
make help
```

## Run application with k8s on minikube
Before building the containers you will need to point the local Docker daemon to the minikube internal Docker registry:
```
eval $(minikube -p minikube docker-env)
```

### Start Minikube
```
minikube start
```

### Start application
```
# build the flask app container
docker build -t flaskapp .

# enter k8s template directory
cd minikube

# Create the deployment
kubectl create -f deployment.yaml
kubectl describe deployment myflaskapp-dep

# Create the service
kubectl create -f service.yaml
kubectl describe services myflaskapp-serice

# Get all what is running on your cluster
kubectl get all

# Get application URL:
minikube service myflaskapp-serice --url

# Other usefully commands
minikube --help # Get minikube command line help
minikube ssh # SSH into minikube container
```

## Application URLs
```
http://localhost:5000 # index page
http://localhost:5000/user/1 # user ID 1 data
```