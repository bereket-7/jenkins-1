# Use the official Jenkins image as a base
FROM myjenkins-blueocean:2.414.2

# Set environment variables
ENV PATH=/opt/java/openjdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV LANG=C.UTF-8
ENV JENKINS_HOME=/var/jenkins_home
ENV JENKINS_SLAVE_AGENT_PORT=50000
ENV REF=/usr/share/jenkins/ref
ENV JENKINS_VERSION=2.414.2
ENV JENKINS_UC=https://updates.jenkins.io
ENV JENKINS_UC_EXPERIMENTAL=https://updates.jenkins.io/experimental
ENV JENKINS_INCREMENTALS_REPO_MIRROR=https://repo.jenkins-ci.org/incrementals
ENV COPY_REFERENCE_FILE_LOG=/var/jenkins_home/copy_reference_file.log
ENV JAVA_HOME=/opt/java/openjdk

# Set the user to 'jenkins'
USER jenkins

# Set the entry point
ENTRYPOINT ["/usr/bin/tini", "--", "/usr/local/bin/jenkins.sh"]

# Expose the necessary ports
EXPOSE 8080
EXPOSE 50000

# Specify the volume for Jenkins home
VOLUME ["/var/jenkins_home"]
