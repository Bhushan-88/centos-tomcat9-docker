# CentOS + Tomcat 9 Docker Image

This project provides a Dockerfile to build a **CentOS Stream 9** container with:
- Java 11 (OpenJDK)
- **Apache Tomcat 9
- Auto-deployment of a custom WAR application

---

## 🚀 Getting Started

### 1. Clone the repository
```bash
git clone https://github.com/<your-username>/centos-tomcat-docker.git
cd centos-tomcat-docker

2. Place your WAR file

Copy your application WAR file into the project folder.
Rename it to myapp.war (or adjust the Dockerfile if you want a different name).

-Build the Docker Image
docker build -t centos-tomcat9 .

-Run the Container
docker run -d -p 8080:8080 --name my-centos-tomcat9 centos-tomcat9

Access the Application

Open in your browser:http://localhost:8080/student

Verify Inside Container
Check that your WAR is deployed:
docker exec -it my-centos-tomcat9 ls /opt/tomcat/webapps/

View Tomcat logs:
docker logs -f my-centos-tomcat9

# Stop container
docker stop my-centos-tomcat9

# Remove container
docker rm my-centos-tomcat9

# Remove image
docker rmi centos-tomcat9

# Customize Tomcat Version
ENV TOMCAT_VERSION=9.0.93

# Notes:

Base OS: CentOS Stream 9

Java: OpenJDK 11

Compatible with Tomcat 9.x
