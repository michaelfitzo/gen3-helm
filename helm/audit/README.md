# audit

![Version: 0.1.5](https://img.shields.io/badge/Version-0.1.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: master](https://img.shields.io/badge/AppVersion-master-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../common | common | 0.1.4 |
| https://charts.bitnami.com/bitnami | postgresql | 11.9.13 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | map | `{"podAntiAffinity":{"preferredDuringSchedulingIgnoredDuringExecution":[{"podAffinityTerm":{"labelSelector":{"matchExpressions":[{"key":"app","operator":"In","values":["audit"]}]},"topologyKey":"kubernetes.io/hostname"},"weight":100}]}}` | Affinity to use for the deployment. |
| affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution | map | `[{"podAffinityTerm":{"labelSelector":{"matchExpressions":[{"key":"app","operator":"In","values":["audit"]}]},"topologyKey":"kubernetes.io/hostname"},"weight":100}]` | Option for scheduling to be required or preferred. |
| affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0] | int | `{"podAffinityTerm":{"labelSelector":{"matchExpressions":[{"key":"app","operator":"In","values":["audit"]}]},"topologyKey":"kubernetes.io/hostname"},"weight":100}` | Weight value for preferred scheduling. |
| affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0] | list | `{"key":"app","operator":"In","values":["audit"]}` | Label key for match expression. |
| affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].operator | string | `"In"` | Operation type for the match expression. |
| affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].values | list | `["audit"]` | Value for the match expression key. |
| affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.topologyKey | string | `"kubernetes.io/hostname"` | Value for topology key label. |
| api.QUERY_PAGE_SIZE | int | `1000` | The maximum number of entires the query endpoint will return. |
| api.QUERY_TIMEBOX_MAX_DAYS | int | `nil` | Amount to time-box queries. |
| api.QUERY_USERNAMES | bool | `true` | Whether to return usernames in query responses and allow querying by username. |
| autoscaling | map | `{"enabled":false,"maxReplicas":4,"minReplicas":1,"targetCPUUtilizationPercentage":80}` | Configuration for autoscaling the number of replicas |
| autoscaling.enabled | bool | `false` | Whether autoscaling is enabled or not |
| autoscaling.maxReplicas | int | `4` | The maximum number of replicas to scale up to |
| autoscaling.minReplicas | int | `1` | The minimum number of replicas to scale down to |
| autoscaling.targetCPUUtilizationPercentage | int | `80` | The target CPU utilization percentage for autoscaling |
| env | list | `[{"name":"DEBUG","value":"false"},{"name":"ARBORIST_URL","valueFrom":{"configMapKeyRef":{"key":"arborist_url","name":"manifest-global","optional":true}}}]` | Environment variables to pass to the container |
| fullnameOverride | string | `""` | Override the full name of the chart, which is used as the name of resources created by the chart |
| global | map | `{"ddEnabled":false,"dev":true,"dictionaryUrl":"https://s3.amazonaws.com/dictionary-artifacts/datadictionary/develop/schema.json","dispatcherJobNum":10,"environment":"default","hostname":"localhost","kubeBucket":"kube-gen3","logsBucket":"logs-gen3","netPolicy":true,"portalApp":"gitops","postgres":{"dbCreate":true,"master":{"host":null,"password":null,"port":"5432","username":"postgres"}},"publicDataSets":true,"revproxyArn":"arn:aws:acm:us-east-1:123456:certificate","syncFromDbgap":false,"tierAccessLevel":"libre","userYamlS3Path":"s3://cdis-gen3-users/test/user.yaml"}` | Global configuration options. |
| global.ddEnabled | bool | `false` | Whether Datadog is enabled. |
| global.dev | bool | `true` | Whether the deployment is for development purposes. |
| global.dictionaryUrl | string | `"https://s3.amazonaws.com/dictionary-artifacts/datadictionary/develop/schema.json"` | URL of the data dictionary. |
| global.dispatcherJobNum | int | `10` | Number of dispatcher jobs. |
| global.environment | string | `"default"` | Environment name. This should be the same as vpcname if you're doing an AWS deployment. Currently this is being used to share ALB's if you have multiple namespaces. Might be used other places too. |
| global.hostname | string | `"localhost"` | Hostname for the deployment. |
| global.kubeBucket | string | `"kube-gen3"` | S3 bucket name for Kubernetes manifest files. |
| global.logsBucket | string | `"logs-gen3"` | S3 bucket name for log files. |
| global.netPolicy | bool | `true` | Whether network policies are enabled. |
| global.portalApp | string | `"gitops"` | Portal application name. |
| global.postgres | map | `{"dbCreate":true,"master":{"host":null,"password":null,"port":"5432","username":"postgres"}}` | Postgres database configuration. |
| global.postgres.dbCreate | bool | `true` | Whether the database should be created. |
| global.postgres.master | map | `{"host":null,"password":null,"port":"5432","username":"postgres"}` | Master credentials to postgres. This is going to be the default postgres server being used for each service, unless each service specifies their own postgres |
| global.postgres.master.host | string | `nil` | hostname of postgres server |
| global.postgres.master.password | string | `nil` | password for superuser in postgres. This is used to create or restore databases |
| global.postgres.master.port | string | `"5432"` | Port for Postgres. |
| global.postgres.master.username | string | `"postgres"` | username of superuser in postgres. This is used to create or restore databases |
| global.publicDataSets | bool | `true` | Whether public datasets are enabled. |
| global.revproxyArn | string | `"arn:aws:acm:us-east-1:123456:certificate"` | ARN of the reverse proxy certificate. |
| global.syncFromDbgap | bool | `false` | Whether to sync data from dbGaP. |
| global.tierAccessLevel | string | `"libre"` | Access level for tiers. acceptable values for `tier_access_level` are: `libre`, `regular` and `private`. If omitted, by default common will be treated as `private` |
| global.userYamlS3Path | string | `"s3://cdis-gen3-users/test/user.yaml"` | Path to the user.yaml file in S3. |
| image | map | `{"pullPolicy":"Always","repository":"quay.io/cdis/audit-service","tag":"master"}` | Docker image information. |
| image.pullPolicy | string | `"Always"` | When to pull the image. This value should be "Always" to ensure the latest image is used. |
| image.repository | string | `"quay.io/cdis/audit-service"` | The Docker image repository for the audit service |
| image.tag | string | `"master"` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` | Docker image pull secrets. |
| initEnv | list | `{}` | Volumes to attach to the init container. |
| initVolumeMounts | list | `[]` | Volumes to mount to the init container. |
| labels | map | `{"app":"audit","authprovider":"yes","netnolimit":"yes","public":"yes","release":"production","tags.datadoghq.com/service":"audit","userhelper":"yes"}` | Labels to add to the pod. |
| labels.app | string | `"audit"` | Application name. |
| labels.authprovider | string | `"yes"` | Grants egress from all pods to pods labeled with authrpovider=yes. For network policy selectors. |
| labels.netnolimit | string | `"yes"` | Grants egress from pods labeled with netnolimit=yes to any IP address. Use explicit proxy and AWS APIs |
| labels.public | string | `"yes"` | Grants ingress from the revproxy service for pods labeled with public=yes |
| labels.release | string | `"production"` | Release name. |
| labels.userhelper | string | `"yes"` | Grants ingress from pods in usercode namespaces for gen3 pods labeled with userhelper=yes |
| nameOverride | string | `""` | Override the name of the chart. This can be used to provide a unique name for a chart |
| nodeSelector | map | `{}` | Node Selector for the pods |
| podAnnotations | map | `{}` | Annotations to add to the pod |
| podSecurityContext | map | `{}` | Security context for the pod |
| postgres | map | `{"database":null,"dbCreate":null,"host":null,"password":null,"port":"5432","separate":false,"username":null}` | Postgres database configuration. If db does not exist in postgres cluster and dbCreate is set ot true then these databases will be created for you |
| postgres.database | string | `nil` | Database name for postgres. This is a service override, defaults to <serviceName>-<releaseName> |
| postgres.dbCreate | bool | `nil` | Whether the database should be created. Default to global.postgres.dbCreate |
| postgres.host | string | `nil` | Hostname for postgres server. This is a service override, defaults to global.postgres.host |
| postgres.password | string | `nil` | Password for Postgres. Will be autogenerated if left empty. |
| postgres.port | string | `"5432"` | Port for Postgres. |
| postgres.separate | string | `false` | Will create a Database for the individual service to help with developing it. |
| postgres.username | string | `nil` | Username for postgres. This is a service override, defaults to <serviceName>-<releaseName> |
| postgresql | map | `{"primary":{"persistence":{"enabled":false}}}` | Postgresql subchart settings if deployed separately option is set to "true". Disable persistence by default so we can spin up and down ephemeral environments |
| postgresql.primary.persistence.enabled | bool | `false` | Option to persist the dbs data. |
| replicaCount | int | `1` | Number of desired replicas |
| resources | map | `{"limits":{"cpu":1,"memory":"512Mi"},"requests":{"cpu":0.1,"memory":"12Mi"}}` | Resource requests and limits for the containers in the pod |
| resources.limits | map | `{"cpu":1,"memory":"512Mi"}` | The maximum amount of resources that the container is allowed to use |
| resources.limits.cpu | string | `1` | The maximum amount of CPU the container can use |
| resources.limits.memory | string | `"512Mi"` | The maximum amount of memory the container can use |
| resources.requests | map | `{"cpu":0.1,"memory":"12Mi"}` | The amount of resources that the container requests |
| resources.requests.cpu | string | `0.1` | The amount of CPU requested |
| resources.requests.memory | string | `"12Mi"` | The amount of memory requested |
| securityContext | map | `{}` | Security context for the containers in the pod |
| server.AWS_CREDENTIALS | map | `{}` | AWS credentials to access SQS queue. |
| server.debug | bool | `false` | Whether to enable or disable debug mode. |
| server.pull_from_queue | bool | `false` | Whether to pull logs from sqs queue. |
| server.sqs | map | `{"region":"us-east-1","url":"http://sqs.com"}` | AWS SQS queue information. |
| server.sqs.region | string | `"us-east-1"` | SQS queue AWS region. |
| server.sqs.url | string | `"http://sqs.com"` | The URL for the SQS queue. |
| service | map | `{"port":80,"type":"ClusterIP"}` | Configuration for the service |
| service.port | int | `80` | Port on which the service is exposed |
| service.type | string | `"ClusterIP"` | Type of service. Valid values are "ClusterIP", "NodePort", "LoadBalancer", "ExternalName". |
| serviceAccount | map | `{"annotations":{"eks.amazonaws.com/role-arn":null},"create":true,"name":"audit-service-sa"}` | Service account to use or create. |
| serviceAccount.annotations."eks.amazonaws.com/role-arn" | string | `nil` | The Amazon Resource Name (ARN) of the role to associate with the service account |
| serviceAccount.create | bool | `true` | Whether to create a service account |
| serviceAccount.name | string | `"audit-service-sa"` | The name of the service account |
| tolerations | list | `[]` | Tolerations for the pods |
| volumeMounts | list | `[]` | Volumes to mount to the container. |
| volumes | list | `[]` | Volumes to attach to the container. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
