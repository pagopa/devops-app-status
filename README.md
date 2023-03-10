# devops-app-status

## Goal

A simple http server that allow to test basic endpoint to verify that kubernetes and the namespace are reacheble:

endpoints exposed:

* `/`
* `/status`
* `/health`
* `/healthz`

## How to release (manually)

go to the helm folder like `helm/selfcare/pnpg`

### Init helm

```sh
helm dep update
```

### Install helm package

```sh
helm upgrade -i -n <namespace> -f <values file name> <helm app name> \.

helm upgrade -i -n idpay -f values-dev.yaml devops-java-springboot-color \.
```

## Special thanks

This project born from the fantastic tutorial created by the Biella python group.

<https://github.com/PythonBiellaGroup/FastCash>
