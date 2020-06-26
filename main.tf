// Конфигурация подключения к облаку
provider "yandex" {
	token			= var.token
	cloud_id		= var.cloud_id
	folder_id		= var.folder_id
	zone			= var.zone
}

// Создаем новую vpc
resource "yandex_vpc_network" "main-skb" {
	name = "main-skb"
}

//Создаем подсеть
resource "yandex_vpc_subnet" "subnet-1" {
	name = "subnet-1"
	zone = var.zone
	network_id = yandex_vpc_network.main-skb.id
	v4_cidr_blocks = ["192.168.1.0/24"]
}

//Создаем виртуальные машины в нужной подсети
data "yandex_compute_image" "base_image" {
	family = var.yc_image_family
}

//Задаем параметры для нод, имена, кол-во и т.д
resource "yandex_compute_instance" "node" {
	count = var.cluster_size
	name = "node-${count.index}"
	hostname = "node-${count.index}"
	platform_id = "standard-v1"
	zone = var.zone

//Задаем кол-во выделяемых ресурсов для нод
	resources {
		cores = var.instance_cores
		memory = var.instance_memory
	}

//Задаем параметры образа с которого будем разворачиваться и объем диска
	boot_disk {
		initialize_params {
			image_id = data.yandex_compute_image.base_image.id
			type = "network-ssd"
			size = "20"
		}
	}

//Задаем параметры сетевых интерфесов на нодах
	network_interface {
		subnet_id = yandex_vpc_subnet.subnet-1.id
		nat = true
	}

//Задаем доп данные, которые нужно передать
	metadata = {
		ssh-keys = "danya:${file(var.public_key_path)}"
	}

}
