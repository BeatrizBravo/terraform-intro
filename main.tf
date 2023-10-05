terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_vpc" "BB_vpc" {      #main = name of the resource
  cidr_block       = "10.2.0.0/16" #big enough to fit all the subnets
  instance_tenancy = "default"

  tags = {
    Name        = "BB_vpc"
    AcademyUser = "Beatriz"
    Foo         = "Bar" //If we update an already created resource, we will see a yellow ~Tilde in the console.
  }
}

resource "aws_subnet" "BB_subnet1_private" {
  vpc_id            = aws_vpc.BB_vpc.id
  cidr_block        = "10.2.1.0/24"
  availability_zone = "eu-west-2a"
  tags = {
    Name        = "BB_subnet_private1"
    AcademyUser = "Beatriz"
  }

}
resource "aws_subnet" "BB_subnet1_public" {
  vpc_id            = aws_vpc.BB_vpc.id
  cidr_block        = "10.2.2.0/24"
  availability_zone = "eu-west-2a"
  tags = {
    Name        = "BB_subnet_private1"
    AcademyUser = "Beatriz"
  }

}
# TODO: 
# -add 4 more subnets
# -create a route table
# -public subnets can have internet gateway 


