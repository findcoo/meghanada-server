FROM gradle:4.5-alpine
MAINTAINER findcoo <thirdlif2@gmail.com>
USER root
WORKDIR /meghanada
COPY ./ /meghanada
RUN gradle clean shadowJar
RUN chown -R gradle:gradle ./
USER gradle
EXPOSE 55555
CMD ["java", "-XX:+UseConcMarkSweepGC", "-XX:SoftRefLRUPolicyMSPerMB=50", "-Xverify:none", "-Xms256m", "-Dfile.encoding=UTF-8", "-jar", "build/libs/meghanada-0.9.0.jar"]
