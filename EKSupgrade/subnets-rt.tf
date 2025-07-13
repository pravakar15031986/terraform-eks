resource "aws_route_table" "eks-vpc-pub-sub-rt" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks-igw.id
  }

  tags = {
    Name = "eks-${var.env}-vpc-pub-sub-rt"
    Env  = "${var.env}"
  }
}

resource "aws_route_table" "eks-vpc-priv-sub1-rt" {
  vpc_id = aws_vpc.eks-vpc.id
  tags = {
    Name = "eks-${var.env}-vpc-priv-sub1-rt"
    Env  = "${var.env}"
  }
}