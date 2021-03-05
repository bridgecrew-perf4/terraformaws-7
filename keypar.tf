resource "aws_key_pair" "teste" {
  key_name   = var.key
  public_key = #"cole sua key aqui"
}