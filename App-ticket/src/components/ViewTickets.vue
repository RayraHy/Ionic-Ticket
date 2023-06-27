<template>
  <div>
    <ion-list>
    <ion-item v-for="ticket in filteredTickets" :key="ticket.id">
      {{ ticket.ds_gravidade_ticket }}
    </ion-item>
  </ion-list>

  </div>
</template>

<script>
import { mapGetters } from 'vuex';
import axios from 'axios';



export default {
  data() {
    return {
      tickets: [],

    }
  },
computed: {
    ...mapGetters(['getCliente']),
    filteredTickets() {
      // Aqui você pode usar a variável `this.getCliente` para filtrar os tickets com base no cliente
      const cliente = this.getCliente;
      // Faça o filtro dos tickets conforme necessário
      // Exemplo: 
      return this.tickets.filter(ticket => ticket.cd_integrantes === cliente);
    },
    DadosPHP() {
      axios.get('http://localhost/Api-banco/Tickets.php')
      .then(response => {
      this.tickets = response.data;
      // Aqui você pode usar os dados recebidos como desejar
      })
      .catch(error => {
                console.error(error);
                });
            },
}
}
</script>

<style>

</style>