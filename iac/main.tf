module "network" {
  source = "./modules/network"
  vpc_cidr = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "eks_cluster_1" {
  source = "./modules/aks"
  cluster_name = var.cluster_name_1
  subnet_ids = module.network.private_subnet_ids
  vpc_id = module.network.vpc_id
}

module "eks_cluster_2" {
  source = "./modules/aks"
  cluster_name = var.cluster_name_2
  subnet_ids = module.network.private_subnet_ids
  vpc_id = module.network.vpc_id
}

module "acr" {
  source = "./modules/acr"
  acr_name = var.acr_name
}

module "sqlserver" {
  source = "./modules/sqlserver"
  db_admin_username = var.db_admin_username
  db_admin_password = var.db_admin_password
}

module "monitoring" {
  source = "./modules/monitoring"
  cluster_names = [module.eks_cluster_1.cluster_name, module.eks_cluster_2.cluster_name]
  kubeconfig_contexts = [module.eks_cluster_1.kubeconfig_context, module.eks_cluster_2.kubeconfig_context]
}

output "eks_cluster_1_name" {
  value = module.eks_cluster_1.cluster_name
}

output "eks_cluster_2_name" {
  value = module.eks_cluster_2.cluster_name
}

output "acr_login_server" {
  value = module.acr.login_server
}