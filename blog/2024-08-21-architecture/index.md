---
slug: architectural-decisions-for-koksmat-tech-stack
title: Building the Perfect Tech Stack
authors: [nielsgregers]
tags:
  [
    Kubernetes,
    Docker,
    Azure Kubernetes Service,
    AKS,
    Azure PostgreSQL,
    stored procedures,
    Next.js,
    ShadCN,
    Tailwind CSS,
    TypeScript,
    Visual Studio Code,
    GitHub,
    Container Registry,
    GitHub Actions,
    GitHub Codespaces,
    Golang,
    NATS,
    microservices,
    tech stack,
    architectural decisions,
    digital workspace,
  ]
---

## **Architectural Choices Behind Koksmat’s Digital Workspacee**

In the process of crafting a powerful and scalable digital workspace, I've made several architectural decisions that align with both the needs of the platform and the vision for Koksmat. Below, I’ll walk you through the tech stack I’ve chosen and why these tools and technologies made the cut.

<!-- truncate -->

### **1. Kubernetes (K8s) & Docker Containers**

For orchestration and containerization, Kubernetes (K8s) and Docker were the clear choices. Kubernetes provides the scalability and flexibility needed to manage containerized applications across multiple environments. Docker allows for consistent environments across development, testing, and production, which is crucial for a platform that needs to run smoothly regardless of the underlying infrastructure.

**Alternatives Considered:** While Docker Swarm and Mesos were considered, Kubernetes' extensive community support, integration with cloud providers, and advanced features made it the superior choice.

### **2. Azure Kubernetes Service (AKS)**

Azure Kubernetes Service (AKS) was selected for its seamless integration with other Azure services, making it easier to manage and scale the Kubernetes clusters. The fully managed nature of AKS reduces the operational overhead, allowing the focus to remain on development and innovation.

**Alternatives Considered:** Google Kubernetes Engine (GKE) and Amazon EKS were strong contenders, but the existing investment in Azure infrastructure made AKS the natural fit.

### **3. Azure PostgreSQL**

For the database, Azure PostgreSQL was chosen for its reliability, scalability, and compatibility with the chosen tech stack. PostgreSQL’s advanced features like JSONB support, full-text search, and rich indexing capabilities are well-suited for the application’s requirements.

**Alternatives Considered:** MySQL and SQL Server were considered, but PostgreSQL’s flexibility and powerful feature set gave it the edge.

### **4. Stored Procedures**

Leveraging stored procedures allows for optimized database operations and ensures that critical business logic is executed close to the data. This approach helps reduce latency and improves performance, which is critical in a high-demand environment.

**Alternatives Considered:** Using ORMs like Entity Framework was an option, but the direct control and performance benefits of stored procedures made them the preferred choice.

### **5. Next.js**

Next.js was selected as the frontend framework for its ability to handle server-side rendering, static site generation, and client-side rendering seamlessly. It’s perfect for building a fast, responsive, and SEO-friendly user interface.

**Alternatives Considered:** React with custom configuration was a consideration, but Next.js’ out-of-the-box features and developer experience were unmatched.

### **6. ShadCN Design System & Tailwind CSS**

For UI components and styling, the combination of ShadCN Design System and Tailwind CSS was chosen. ShadCN provides a robust design framework that ensures consistency, while Tailwind CSS offers utility-first styling that keeps the codebase clean and maintainable.

**Alternatives Considered:** Material-UI and Bootstrap were potential options, but Tailwind’s flexibility and ShadCN’s tailored design system aligned better with the project's needs.

### **7. TypeScript**

TypeScript was chosen for its static typing, which helps catch errors early in the development process and improves code quality. The scalability of TypeScript makes it ideal for managing a large codebase like this one.

**Alternatives Considered:** JavaScript was the obvious alternative, but the additional safety and developer experience provided by TypeScript made it the clear winner.

### **8. Visual Studio Code**

Visual Studio Code remains the go-to IDE for this project. Its extensive marketplace of extensions, integration with GitHub, and overall speed make it the perfect environment for both frontend and backend development.

**Alternatives Considered:** JetBrains WebStorm was considered for its robust feature set, but the lightweight nature and community support of VS Code were deciding factors.

### **9. GitHub Repository, Container Registry, Actions, and Codespaces**

For version control, CI/CD, and development environments, the GitHub ecosystem was selected. GitHub Actions for CI/CD, Container Registry for managing Docker images, and Codespaces for cloud-based development environments provide a comprehensive solution that integrates seamlessly.

**Alternatives Considered:** GitLab and Bitbucket were options, but GitHub’s dominance in the open-source community and its integration with Azure made it the optimal choice.

### **10. Golang & NATS-based Microservices**

For backend microservices, Golang was chosen for its performance, concurrency support, and efficiency. NATS provides a lightweight, high-performance messaging system that works well with Golang to create a robust microservice architecture.

**Alternatives Considered:** Node.js and RabbitMQ were considered, but Golang’s performance benefits and NATS’ simplicity and speed made them the right tools for the job.

---

## **Conclusion**

This stack represents a carefully curated selection of tools and technologies designed to deliver a scalable, maintainable, and high-performing digital workspace. Each decision was made with a focus on aligning the capabilities of the platform with the needs of its users, ensuring that Koksmat can provide the best possible experience.

By making these architectural choices, I’ve laid a solid foundation that not only meets today’s needs but is also flexible enough to adapt to the challenges and opportunities of tomorrow.
