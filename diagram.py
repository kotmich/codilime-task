from diagrams import Diagram, Cluster, Edge
from diagrams.aws.compute import ECS
from diagrams.aws.network import ELB, NATGateway, InternetGateway
from diagrams.aws.network import VPC, PublicSubnet, PrivateSubnet
from diagrams import Node


with Diagram("HA nginx web app behind ALB", show=False, filename="aws_architecture", direction="LR"):
    internet = Node("Internet")

    with Cluster("VPC"):
        igw = InternetGateway("IGW")

        with Cluster("Public Subnets"):
            alb = ELB("ALB")
            nat = NATGateway("NAT GW")

        with Cluster("Private Subnets"):
            ecs_tasks = [ECS("Fargate Task 1"),
                         ECS("Fargate Task 2")]

    internet >> Edge(label="HTTP") >> igw >> alb >> ecs_tasks
    ecs_tasks >> Edge(label="Outbound") >> nat >> igw >> internet
