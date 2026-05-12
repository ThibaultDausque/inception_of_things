
### 🎛 Inception of Things
This project aims to deepen knowledge by making use K3d and K3s with
Vagrant.
To learn how to set up a personal virtual machine with Vagrant and the
distribution of choice. Then, to learn how to use K3s and its Ingress.
Last but not least, to discover K3d that will simplify life.
These steps will get started with Kubernetes.

---

### P1
To begin, we have to set up 2 machines.

  Write our first Vagrantfile using the latest stable version of the distribution
of our choice as our operating system. It is STRONGLY advised to allow only the
bare minimum in terms of resources: 1 CPU and 512 MB of RAM (or 1024). The machines must be run using Vagrant.

Here are the expected specifications:

* The machine names must be the login of someone from your team. The hostname
of the first machine must be followed by the capital letter S (like Server). The
hostname of the second machine must be followed by SW (like ServerWorker).

* Have a dedicated IP on the primary network interface. The IP of the first machine
(Server) will be 192.168.56.110, and the IP of the second machine (ServerWorker)
will be 192.168.56.111.

* Be able to connect with SSH on both machines with no password.

We must install K3s on both machines:
* In the first one (Server), it will be installed in controller mode.
* In the second one (ServerWorker), in agent mode.
---
### P2
loading...
---

### 📜 License
This project is for educational purposes at 42.
