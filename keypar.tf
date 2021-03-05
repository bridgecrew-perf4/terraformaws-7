resource "aws_key_pair" "teste" {
  key_name   = var.key
  public_key = #"Insira sua chave SSH aqui parça"
}