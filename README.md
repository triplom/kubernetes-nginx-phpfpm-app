# Kubernetes Nginx PHP-FPM App

In this tutorial, we will deploy a PHP application on a Kubernetes cluster with Nginx and PHP-FPM running in separate containers.

We want the web-server nginx and phpfpm to be co-located in separate pods.
![alt text](https://i.ibb.co/R4P9YB0/kubernetes-nginx-phpfpm1-drawio.png)

## PHP-FPM

PHP-FPM is an implementation of Fast-CGI for PHP with improved capabilities around process management, logging, and high traffic situations.

## Nginx

Nginx is a web server and reverse proxy that’s widely used for high traffic applications. When run in combination with PHP-FPM, Nginx is configured to send requests for .php routes to PHP-FPM to serve the page.

We should upload the application files first, to all worker nodes to the directory /var/website as /var/website is volume path to containers.

### Manifests and config Files: 

- Nginx
  - [nginx-deployment.yaml](https://github.com/triplom/kubernetes-nginx-phpfpm-app/blob/master/nginx-deployment.yml)
  - [nginx-service.yaml](https://github.com/triplom/kubernetes-nginx-phpfpm-app/blob/master/nginx-service.yml)
  - [nginx-configMap.yaml](https://github.com/triplom/kubernetes-nginx-phpfpm-app/blob/master/nginx-configMap.yml)
- Phpfpm
  - [phpfpm-deployment.yaml](https://github.com/triplom/kubernetes-nginx-phpfpm-app/blob/master/phpfpm-deployment.yml)
  - [phpfpm-service.yaml](https://github.com/triplom/kubernetes-nginx-phpfpm-app/blob/master/phpfpm-service.yml)

### Results: 

We will get below results once we run the above deployments.

![Alt Text](https://i.ibb.co/ncCK0SK/pic1.png)

![Alt Text](https://i.ibb.co/54CyQ13/pic2.png)

![Alt Text](https://i.ibb.co/8DmX6yQ/pic3.png)

![Alt Text](https://i.ibb.co/L6Gtcy6/pic4.png)


<a href="mailto:triplom@gmail.com"><img src="https://img.shields.io/badge/-triplom@gmail.com-D14836?style=flat&logo=Gmail&logoColor=white"/></a>
<a href="https://www.linkedin.com/in/triplom"><img src="https://img.shields.io/badge/-Linkedin-blue"/></a>
