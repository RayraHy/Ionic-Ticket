<template>
  <ion-page>
    <ion-content :fullscreen="true">
      <ion-list>
        <ion-item v-for=" ticket in tickets" :key="ticket">

          
          {{ ticket.ds_gravidade_ticket}}
        </ion-item>
      </ion-list>

      <ion-card v-if="componenteAtivo === 'sdfs'">
        <ion-card-header>
          <ion-card-title>Faça sua reserva</ion-card-title>
          <ion-button fill="clear" class="close-button" v-if="componenteAtivo" @click="fecharComponente" >X</ion-button>
        </ion-card-header>
        <ion-card-content>
          <p>Digite o endereço</p>
        </ion-card-content>
        </ion-card>


    </ion-content>
  </ion-page>
</template>

<script lang="ts">
import { IonPage, IonHeader, IonToolbar, IonTitle, IonContent, IonList, IonItem, IonLabel, IonCard, IonCardHeader, IonCardTitle, IonCardContent, IonButton } from '@ionic/vue';
import axios from 'axios';



export default {
  components: {
    IonContent, IonList, IonPage, IonItem, IonLabel, IonCard, IonCardHeader, IonCardTitle, IonCardContent, IonButton
  },
  data() {
    return {
      tickets: [],
      componenteAtivo: null,
    }
  },
  mounted() {
          this.DadosPHP();
          window.history.replaceState({}, document.title, window.location.pathname);
        },
  methods: {
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
            trocarComponente(componente) {
            this.componenteAtivo = componente;
          },
          fecharComponente() {
            this.componenteAtivo = null;
          },
  }
}
</script>

<style scoped>

</style>
