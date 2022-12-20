**Quick install for ISD which includes ArgoCD,ArgoRollouts,Autopilot Services.**

To experience ISD quickly, you can install it and deploy your applications. Note that the instructions below are intended to get you started quickly and try out ISD functionality. This is not suitable for production or any environment where security is a concern.
To begin installation, you'll need a Kubernetes cluster > 1.24.0 (with 1 node 4CPU with 16GB RAM) and kubectl set-up.

Please ensure no port is running on 8099. Use below command to check

Linux   -  sudo lsof -i -P -n | grep LISTEN | grep 8099      
Mac     -     netstat -anp tcp | grep LISTEN | grep 8099        
Windows -   netstat -aof | findstr "LISTENING"            

Issue the following commands (copy paste in a terminal window)
- `kubectl -n opsmx-argo apply -f https://raw.githubusercontent.com/saitejaopsmx/isd-quick-install/main/isd411/isd-argo-quick.yaml`

If you see any error at the end of the command output, please wait for a few seconds and reissue the command above. 

WAIT for about 5-10 min, depending your network speed.
It is normal for some pods to go into error/crashloop before stabilising.

Check the status of the pods by executing this command:
- `kubectl -n opsmx-argo get po`

Once all pods show "Running" or "Completed" status, wait for a couple of minutes and execute this:
- kubectl -n opsmx-argo port-forward svc/oes-ui 8080 & kubectl -n opsmx-argo port-forward svc/isdargo-argocd-server 8099:80 ## Keep running, it shows messages such as "Forwarding from 127.0.0.1:8080 -> 8080,127.0.0.1:8099 -> 8080"

Now, open your browser and navigate to http://localhost:8080
Login with username admin and password xxxxxxxxx

Execute the following command to retrieve the password

- `kubectl -n opsmx-argo get secret openldap -o jsonpath='{.data.LDAP_ADMIN_PASSWORD}'| base64 -d`

In case "base64 command not found":  Please execute the below command. 

- `kubectl -n opsmx-argo get secret openldap -o jsonpath='{.data.LDAP_ADMIN_PASSWORD}'`

After executing the above command, copy the output and decode it using any online decoding site such as https://www.base64decode.org/.

Open another tab in the same browser and navigate to http://localhost:8099
Login with username admin password xxxxxxxxxx

Execute the below command to get the password

- `kubectl -n opsmx-argo get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d`
