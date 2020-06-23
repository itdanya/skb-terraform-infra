// Конфигурация подключения к облаку
provider "yandex" {
	token			= "${var.token}"
	cloud_id		= "${var.cloud_id}"
	folder_id		= "${var.folder_id}"
	zone			= "${var.zone}"
}

// Создаем новую vpc
resource "yandex_vpc_network" "main-skb" {
	name = "main-skb"
}

//Создаем подсеть
resource "yandex_vpc_subnet" "subnet-1" {
	name = "subnet-1"
	zone = "ru-central1-a"
	network_id = yandex_vpc_network.main-skb.id
	v4_cidr_blocks = ["10.100.100.0/24"]
}
