---
tags: [Koksmat,Onboarding]
status: draft
sidebar_position: 1
---
# Getting started

Status: `draft`

This guide will help you get started with developing a new app for the Koksmat platform.

## TL;DR
- Make a fork of the UI into your own repo - https://github.com/koksmat-com/ui/fork
- Start a GitHub Code Space
- Time for a cup of coffee
- Hit debug 
- Navigate to http://localhost:4321


## Prerequisites
- A GitHub account
- A browser
- React development experience

## Copy code and start a Code Space

### Fork the UI Repository

Make a clone of the repository by forking,  **include all branches** by unchecking the "Copy the main branch only"

Direct link to create a fork: https://github.com/koksmat-com/ui/fork

### Start a GitHub Code Space

When in you fork, change the branch to the appropriate one - suggest **tools** for now, then start a GitHub Code Space

## Install dependencies and connect 

### Install dependencies

Open a terminal and run the following commands

```bash
cd apps/www
pnpm install
```


### Connect to a cluster
Open a terminal and run the following commands

```bash
az login --use-device-code
az account set --subscription "Office365 admin" -o table
az aks install-cli
az aks get-credentials --resource-group magicbox --name magicbox-dev

```

Result

```text
Merged "magicbox-prod" as current context in /home/codespace/.kube/config
```

### Create .env file
Create a .env file in the `/apps/www` folder with the following content

```text
DATABASE=christianiabpos
MONGODB=mongodb://username:password@localhost:27017/?directConnection=true&authMechanism=DEFAULT&tls=false
```

Replace the username and password with the credentials you got from the cluster administrator

### Create a new app subfolder

Within the repo, navigate to `/ui/app/www/apps/starters`.

Copy the `starter` folder and rename it to the name of your app - e.g. `myapp`.


## Develop
Establish a connection to the database in the cluster

### Port forward to the database

```bash
kubectl port-forward services/prod-mongos 27017:27017 -n percona
```

### Start debugging


In VS Code Hit debug 
Navigate to http://localhost:4321/myapp

## Initial Training


### Magicbox Framework
Basic understanding of the framework

###  NextJS Framwork
Basic understanding of the NextJS framework

### Magicbox UI 
Basic understanding on how to develop a “Magicbox Applications” 

Covering 
- React components 
- React hooks: useState,useContext,useMemo
- React server side actions
- Tailwind CSS
- Microsoft Auth Library (MSAL)
- Magicbox API

# How to develop a new app
The UI modules are implemented using the App router in the NextJS framework.



## Screen shots

### Fork the repository 
 
![](2023-11-30-07-06-13.png)


### Change to "tools" branch 

![](2023-11-30-07-06-33.png)

### Create a codespace


![](2023-11-30-07-06-53.png)