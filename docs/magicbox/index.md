---
id: "index"
title: "Magixbox"
sidebar_label: "Magixbox"
sidebar_position: 0

---


## What is the Magicbox?
Imaging a pot where you put all of your leftover and stuff that you have learned to like, that is the `Magicbox`

It is a `stew` consolidating all the services which I have developed / have to support during the recent years.

If you like to try something that you can actually eat, try this one:

![](Swiss-Army-Stew-FW-Cooks-FT-BLOG1219-707ed80c460540559449343236909907.webp)

[Recipe](https://www.foodandwine.com/recipes/swiss-army-stew)

## How is it organized?

- Where is the code stored? 
- How is the logic expressed? 
- Where is data stored? 
- Where does the code execute?
### Repository structure

Magicbox is organized in the following way:
#### Docs
- `docs`: contains the documentation of the project (this is the project you are currently in)

#### Gitops
- `gitops`: contains the source code for the infrastructure 

#### Batch jobs 
- `pwsh`: contains the source code for batch orientated jobs

#### User interface
- `ui`: contains the user interfaces

#### API and CLI
- `koksmat`: contains the source for the REST API exposed by the project as well as a CLI supporting whatever need to be supported

Look at is as the backbone in a hybrid developer stack.
 
## Technology stack

### Programming languages
- Go language is used for perfection
- Node.js for server side 
- React for client side
- PowerApps Canvas for adhoc

### Storage
- SharePoint lists a primary store
- MongoDB for caching and analytics
- Azure Blob Storage for external caching


### Hosting
- Docker
- Kubernetes

