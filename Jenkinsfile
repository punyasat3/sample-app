properties([[$class: 'jenkins.model.BuildDiscarderProperty', strategy: [$class: 'LogRotator',
                                                                        numToKeepStr: '10',
                                                                        artifactNumToKeepStr: '10']]])
@Library('utils@master') _

terraformPipeline {
    maven_package = "scripts/build_maven_jenkins.sh"
    terraform_apply_develop = ["dev","e2e"]
}
