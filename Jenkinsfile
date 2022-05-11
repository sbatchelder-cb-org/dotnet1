pipeline {
    agent { label 'ssh' }
//        kubernetes {
//          yaml"""
//apiVersion: v1
//kind: Pod
//spec:
//  containers:
//  - name: dotnet6
//    image: mcr.microsoft.com/dotnet/sdk:6.0
//    tty: true
//"""
//        }
//    }

    stages {
        stage('Example Build') {
            steps {
                container('dotnet6') {
                    sh "dotnet --help"
                    sh "dotnet build"
                    sh "dotnet clean"
                    sh "dotnet test"
                    sh "dotnet run"
                    sh "dotnet publish"
                }
            }
        }
    }
}
