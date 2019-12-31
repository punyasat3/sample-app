properties([[$class: 'jenkins.model.BuildDiscarderProperty', strategy: [$class: 'LogRotator',
                                                                        numToKeepStr: '10',
                                                                        artifactNumToKeepStr: '10']]])
@Library('utils@master') _

mavenPipeline {
    maven_script = "scripts/build_maven_jenkins.sh"
}
