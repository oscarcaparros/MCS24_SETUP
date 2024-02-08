##############################################################################################################
# - NOT CHANGE - Create Network Security groups
##############################################################################################################

# Network Security Groups for Fortigate Management-ha Interface (management)
# allow SSH, HTTPS (admin port), ICMP
resource "aws_security_group" "nsg-vpc-hub-mgmt" {
  name        = "${var.tags["Name"]}-nsg-vpc-hub-mgmt"
  description = "Allow MGMT SSH, HTTPS and ICMP traffic"
  vpc_id      = aws_vpc.vpc-hub.id

  ingress {
    from_port   = 22 # SSH port
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.admin_cidr]
  }

  ingress {
    from_port   = "${var.admin_port}" # HTTPS defined admin port
    to_port     = "${var.admin_port}"
    protocol    = "tcp"
    cidr_blocks = [var.admin_cidr]
  }

  ingress {
    from_port   = 8 # the ICMP type number for 'Echo'
    to_port     = 0 # the ICMP code
    protocol    = "icmp"
    cidr_blocks = [var.admin_cidr]
  }

  ingress {
    from_port   = 0 # the ICMP type number for 'Echo Reply'
    to_port     = 0 # the ICMP code
    protocol    = "icmp"
    cidr_blocks = [var.admin_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

# Network Security Groups for Fortigate Public Interface
# allow IPSEC (500,4500 UDP), ICMP
resource "aws_security_group" "nsg-vpc-hub-public" {
  name        = "${var.tags["Name"]}-nsg-vpc-hub-public"
  description = "Allow IPSEC ADVPN"
  vpc_id      = aws_vpc.vpc-hub.id

  ingress {
    from_port   = 500 # UDP port IPSEC
    to_port     = 500
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 4500 # UDP port IPSEC NAT-T
    to_port     = 4500
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8 # the ICMP type number for 'Echo'
    to_port     = 0 # the ICMP code
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0 # the ICMP type number for 'Echo Reply'
    to_port     = 0 # the ICMP code
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

# Network Security Groups for Fortigate Private Interface
#  ICMP
resource "aws_security_group" "nsg-vpc-hub-private" {
  name        = "${var.tags["Name"]}-nsg-vpc-hub-private"
  description = "Allow ICMP"
  vpc_id      = aws_vpc.vpc-hub.id
  
 ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}


# Network Security Groups for Fortigate Management-ha Interface (management)
# allow SSH, HTTPS (admin port), ICMP
resource "aws_security_group" "nsg-vpc-hub-servers" {
  name        = "${var.tags["Name"]}-nsg-vpc-hub-servers"
  description = "Allow SSH, HTTP/HTTPS and ICMP traffic"
  vpc_id      = aws_vpc.vpc-hub.id

  ingress {
    from_port   = 22 # SSH port
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "80"  # HTTP
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "443"  # HTTPS
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "8000" 
    to_port     = "8000"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "8001" 
    to_port     = "8001"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8 # the ICMP type number for 'Echo'
    to_port     = 0 # the ICMP code
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0 # the ICMP type number for 'Echo Reply'
    to_port     = 0 # the ICMP code
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}