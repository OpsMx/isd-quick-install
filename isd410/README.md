**Quick install for ISD which includes ArgoCD,ArgoRollouts,Autopilot Services.**

To experience ISD quickly, you can install it and deploy your applications. Note that the instructions below are intended to get you started quickly and try out ISD functionality. This is not suitable for production or any environment where security is a concern.
To begin installation, you'll need a Kubernetes cluster  (with 1 node 4CPU with 16GB RAM) and kubectl set-up.

Issue the following commands (copy paste in a terminal window)
- kubectl -n opsmx-argo apply -f https://raw.githubusercontent.com/OpsMx/isd-quick-install/main/isd410/isd-argo-quick.yaml

WAIT for about 5-10 min, depending your network speed.
It is normal for some pods to go into error/crashloop before stabilising.

Check the status of the pods by executing this command:
- kubectl -n opsmx-argo get po

Once all pods show "Running" or "Completed" status, wait for a couple of minutes and execute this:
- kubectl -n opsmx-argo port-forward svc/oes-ui 8080 & kubectl port-forward svc/isd-argocd-server 8090:80 ## Keep running, it shows messages such as "Forwarding from 127.0.0.1:8080 -> 8080,127.0.0.1:8090 -> 8080"

Now, open your browser and navigate to http://localhost:8080
Login with username admin and password opsmxadmin123

Open another tab in the same browser and navigate to http://localhost:8090
Login with username admin password xxxxxxxxxx

Execute the below command to get the password

- kubectl -n opsmx-argo get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d
