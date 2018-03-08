FROM ubuntu:17.10
RUN apt-get update && apt-get autoremove -y && apt-get install -y --no-install-recommends \
    wget \
    zip \
    ca-certificates \
    unzip; \
    apt-get purge -y --auto-remove; \
    rm -rf /var/lib/apt/lists/*


#
# install sonarqube scanner, see https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner for more details
#
ENV SCANNER_VERSION 3.0.3.778
RUN set -ex; \
	wget -O /usr/local/bin/sonar-scanner "https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$SCANNER_VERSION-linux.zip"; \
	unzip /usr/local/bin/sonar-scanner; \
	rm sonar-scanner-$SCANNER_VERSION-linux/conf/sonar-scanner.properties

WORKDIR /workspace

ENTRYPOINT ["/sonar-scanner-3.0.3.778-linux/bin/sonar-scanner"]
