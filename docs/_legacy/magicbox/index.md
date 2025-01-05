---
id: "index"
title: "Magixbox"
sidebar_label: "Magixbox"
sidebar_position: 0
---

# Introducing Magicbox

This diagram appears to represent the architecture of a system involving multiple integrated components and services, with a focus on Microsoft 365 and Kubernetes-based deployments. Here’s a breakdown of the key elements:

### The "Magic Bar" - Managed Source & Services

This section seems to represent the core managed services and integrations that are utilized by the system.

- **Integrations:** These are various services that the system integrates with, including:
  - **SharePoint**
  - **Outlook**
  - **Azure**
  - **Teams**
  - **Generic**
  - **Office Graph**

These integrations likely provide essential data and functionalities that are leveraged by the system.

### Microsoft 365

This section outlines the Microsoft 365 components involved in the system.

- **Services:** These represent the Microsoft 365 services that are part of the architecture:
  - **Teams**
  - **Outlook**
  - **SharePoint**
  - **Users** (user management)
  - **Devices** (device management)
  - **Licenses** (license management)
- **Database:** SharePoint is listed here, indicating that SharePoint is used as a data storage solution in the architecture.

- **Access Control:** This is managed through **Microsoft Entra (Azure AD)**, which is responsible for authentication and authorization.

### GITHUB/KOKSMAT-COM – Open Source

This section refers to the open-source components hosted on GitHub, which are integral to the system.

- **UI (User Interface):** Built using **Next JS 13.4 (app router)**, which is a React-based framework for building web applications.
- **CLI & API server:** This is developed using **Go + PowerShell**, indicating that command-line interface tools and API services are built using these technologies.

- **Deployment Packages:** The system is deployed using **Docker Containers**, facilitating containerized deployment.

- **Infrastructure as Code:** This refers to the **Infrastructure Git repo**, where the infrastructure configuration is stored and managed, likely using IaC (Infrastructure as Code) tools.

### "Magic Box" – Kubernetes Cluster

This section likely represents the deployment and orchestration layer using Kubernetes.

- **Network:** Managed by an **API router**, which handles routing of API requests within the cluster.

- **Services:** Includes:

  - **Web:** Web services running in the cluster.
  - **REST API:** RESTful API services.

- **Jobs:** Managed using a **CLI**, which might refer to scheduled tasks or automated jobs within the cluster.

- **Data Cache & Aggregations:** Handled by **MongoDB**, which is used for caching and data aggregation tasks.

### Overall Explanation

The system is a complex architecture that combines open-source tools, Microsoft 365 services, and Kubernetes-based deployments. The "Magic Bar" serves as a managed source of integrations with various services like SharePoint, Outlook, and Azure. The open-source components are developed and managed on GitHub, providing UI, API, and CLI functionalities. The deployment happens in a Kubernetes cluster, referred to as the "Magic Box," where various services, jobs, and data caching are managed.

In essence, the architecture combines Microsoft services with open-source tools and modern cloud-native technologies to deliver a scalable, integrated solution.

> A Framework for Cross Platform Digital Workplace Tools

How to create and manage custom applications that can run on any device and integrate with any system

## What is Magicbox?

Magicbox is an open source framework that enables you to build and deploy cross platform digital workplace tools using DevOps / GitOps principles. A digital workplace tool is an application that helps you and your team work more efficiently and effectively, by automating tasks, integrating data, and providing a user-friendly interface. Magicbox allows you to create such tools using web technologies, and run them on any device and platform, such as desktop, mobile, web, or even voice assistants.

## How does Magicbox work?

Magicbox consists of three main projects that work together to form a complete framework:

- A Next.JS project that contains all the user interface related code, written in TypeScript and delivered as a Docker container. This project handles the presentation layer of your application, and can use any UI framework or library, such as React, Angular, or Vue.

- A Go project that contains a command line interface (CLI) that can be used to start services or run jobs, also delivered as a container. This project handles the business logic and data processing of your application, and can use any Go library or package, such as Gorilla, Gin, or Cobra.
- A project that contains predominantly PowerShell scripts and Kubernetes configuration files for describing the infrastructure to be used. This project handles the deployment and configuration of your application, and can use any cloud provider or platform, such as AWS, Azure, or Google Cloud.

By combining these three projects, you can create a Magicbox that can be looked at as a blackbox containing all your customizations and hostable in any Kubernetes cluster. You can use Git to manage the code and configuration of your Magicbox, and apply DevOps / GitOps practices to automate the testing, building, and deployment of your application.

## What are the benefits of Magicbox?

Magicbox offers several benefits for developing cross platform digital workplace tools, such as:

- Flexibility: You can use any web technology or library that suits your needs and preferences, and create applications that can run on any device and platform.
- Scalability: You can leverage the power and reliability of Kubernetes to scale your application according to the demand and performance requirements.
- Portability: You can deploy your application to any cloud provider or platform that supports Kubernetes, and easily migrate or replicate your application across different environments.
- Security: You can use the built-in security features of Kubernetes and Docker to protect your application from unauthorized access and malicious attacks.
- Collaboration: You can use Git to collaborate with your team and other developers, and share your code and configuration in a transparent and consistent way.
- Productivity: You can use the Magicbox CLI to simplify and automate the development and deployment of your application, and focus on the core functionality and value of your application.

## How to get started with Magicbox?

To get started with Magicbox, you need to have some basic knowledge and experience with web development, Docker, Kubernetes, and Git. You can follow these steps to create your first Magicbox application:

- Clone the Magicbox repository from GitHub and install the dependencies.
- Modify the Next.JS project to create your user interface, using any UI framework or library you prefer.
- Modify the Go project to create your business logic and data processing, using any Go library or package you need.
- Modify the PowerShell scripts and Kubernetes files to describe your infrastructure, using any cloud provider or platform you choose.
- Use the Magicbox CLI to test, build, and deploy your application to your Kubernetes cluster.
- Use Git to manage your code and configuration, and apply DevOps / GitOps practices to automate your workflow.
  Where to learn more about Magicbox?

To learn more about Magicbox, explorer this site, where you can find the documentation, tutorials, examples, and community forums. You can also contribute to the Magicbox project by reporting issues, suggesting features, or submitting pull requests on GitHub.
