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


resource "aws_subnet" "BB_subnet2_private" {
  vpc_id            = aws_vpc.BB_vpc.id
  cidr_block        = "10.2.3.0/24"
  availability_zone = "eu-west-2a"
  tags = {
    Name        = "BB_subnet_private2"
    AcademyUser = "Beatriz"
  }
}

resource "aws_subnet" "BB_subnet2_public" {
  vpc_id            = aws_vpc.BB_vpc.id
  cidr_block        = "10.2.4.0/24"
  availability_zone = "eu-west-2a"
  tags = {
    Name        = "BB_subnet_private2"
    AcademyUser = "Beatriz"
  }
}

resource "aws_subnet" "BB_subnet3_private" {
  vpc_id            = aws_vpc.BB_vpc.id
  cidr_block        = "10.2.5.0/24"
  availability_zone = "eu-west-2b"
  tags = {
    Name        = "BB_subnet_private3"
    AcademyUser = "Beatriz"
  }
}

resource "aws_subnet" "BB_subnet3_public" {
  vpc_id            = aws_vpc.BB_vpc.id
  cidr_block        = "10.2.6.0/24"
  availability_zone = "eu-west-2b"
  tags = {
    Name        = "BB_subnet_private3"
    AcademyUser = "Beatriz"
  }
}


resource "aws_route_table" "BB_route_table" {
  vpc_id = aws_vpc.BB_vpc.id

  route {
    cidr_block = "0.0.0.0/0" //CIDR: From what IP we can enter
    gateway_id = aws_internet_gateway.BB_internet_gateway.id
  }
}


