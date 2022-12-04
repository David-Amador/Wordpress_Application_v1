

resource "aws_internet_gateway" "IG" {
 count =local.create ? 1:0  //Determinar si se crea el resource

  vpc_id = var.vpc_id
}


//Creamos una tabla de enrutamiento junto con un apolítica que me rediriga toda la salida del tráfico hacia internet al Intenet Gateway creado

resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IG.*.id [0]
  }

  route {
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.IG.*.id [0]
  }

}

//Definimos la asocicación entre la subnet y la tabla de enrutamiento

resource "aws_route_table_association" "snet_route-table" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.route_table.id
}