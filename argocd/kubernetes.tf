
data "aws_eks_cluster" "cluster" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = var.cluster_name
}

provider "aws" {
  region = var.aws_region
}

provider "kubectl" {
  apply_retry_count      = 15
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  load_config_file       = false

  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      var.cluster_name
    ]
  }
}


// provider "kubectl" {
//   host                   = data.aws_eks_cluster.cluster.endpoint
//   cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
//   exec {
//     api_version = "client.authentication.k8s.io/v1alpha1"
//     command     = "aws"
//     args = [
//       "eks",
//       "get-token",
//       "--cluster-name",
//       var.cluster_name
//     ]
//   }
// }