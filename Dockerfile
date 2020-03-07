FROM openjdk:11
COPY target/IndianTownsAPI.jar IndianTownsAPI.jar
EXPOSE 8080
CMD ["java","-jar","IndianTownsAPI.jar"]