<template>
  <ion-page>
    <ion-content :fullscreen="true">
      <ion-list>
        <ion-item v-for="ticket in tickets.slice().reverse()" :key="ticket">
          <ion-card :class="getStatusClass(ticket.ds_status_ticket)">
            <ion-card-header>
              <ion-card-title>{{ ticket.ds_descricao_ticket }}</ion-card-title>
              <ion-card-subtitle>
                Nº Registro {{ ticket.cd_ticket }} - Status: {{ ticket.ds_status_ticket }}
              </ion-card-subtitle>
            </ion-card-header>

            <ion-card-content>
              <p>Data de abertura: {{ ticket.dt_data_inicio }}</p>
              <p>Data Conclusão: {{ ticket.dt_data_inicio }}</p>
            </ion-card-content>

        
            <!-- INICIO VISUALIZAR -->
            <ion-button
              :id="'present-alert-' + ticket.cd_ticket"
              @click="presentAlert(ticket.cd_ticket)"
            >
              Visualizar
            </ion-button>
            <ion-alert
              :id="'alert-' + ticket.cd_ticket"
              :trigger="'present-alert-' + ticket.cd_ticket"
              :header="ticket.ds_descricao_ticket"
              sub-header="Gravidade:"
              :message="ticket.ds_gravidade_ticket + ' Status: ' + ticket.ds_status_ticket" 
              :buttons="alertButtons"
            ></ion-alert>
            <!-- FIM VISUALIZAR -->
            <ion-button fill="clear" @click="FinalizarTicket(ticket.cd_ticket)">
    Finalizar
  </ion-button>
          </ion-card>
        </ion-item>
      </ion-list>
      <br />
      <ion-card v-if="componenteAtivo === 'sdfs'">
        <ion-card-header>
          <ion-card-title>Faça sua reserva</ion-card-title>
          <ion-button
            fill="clear"
            class="close-button"
            v-if="componenteAtivo"
            @click="fecharComponente"
          >
            X
          </ion-button>
        </ion-card-header>
        <ion-card-content>
          <p>Digite o endereço</p>
        </ion-card-content>
      </ion-card>
    </ion-content>
  </ion-page>
</template>

<script lang="ts">
import {
  IonPage,
  IonHeader,
  IonToolbar,
  IonTitle,
  IonContent,
  IonList,
  IonItem,
  IonLabel,
  IonCard,
  IonCardHeader,
  IonCardTitle,
  IonCardContent,
  IonButton,
  IonAlert,
} from '@ionic/vue';
import axios from 'axios';

export default {
  components: {
    IonContent,
    IonHeader,
    IonToolbar,
    IonTitle,
    IonList,
    IonPage,
    IonItem,
    IonLabel,
    IonCard,
    IonCardHeader,
    IonCardTitle,
    IonCardContent,
    IonButton,
    IonAlert,
  },
  data() {
    return {
      tickets: [],
      componenteAtivo: null,
    };
  },
  mounted() {
    this.DadosPHP();
    window.history.replaceState({}, document.title, window.location.pathname);
  },
  methods: {
    DadosPHP() {
      axios
        .get('http://localhost/Api-banco/Tickets.php')
        .then((response) => {
          this.tickets = response.data;
        })
        .catch((error) => {
          console.error(error);
        });
    },
    FinalizarTicket(){
      axios
      .get('http://localhost/Api-banco/FinalizarTicket.php')
      .then((response) => {
        this.tickets = response.data;
      })
      .catch((error) => {
        console.error(error);
      })
    },
    trocarComponente(componente) {
      this.componenteAtivo = componente;
    },
    fecharComponente() {
      this.componenteAtivo = null;
    },
    presentAlert(ticketId) {
      const alertId = 'alert-' + ticketId;
      const alert = document.querySelector('#' + alertId);
      alert.present();
    },
    getStatusClass(status) {
      switch (status) {
        case 'Aberta':
          return 'status-Aberto';
        case 'Em andamento':
          return 'status-em-andamento';
        case 'Concluido':
          return 'status-concluido';
        default:
          return '';
      }
    },
  },
  setup() {
    const alertButtons = [
      {
        text: 'OK',
        handler: () => {
          console.log('Alert closed');
        },
      },
    ];
    return { alertButtons };
  },
};
</script>

<style scoped>
.status-Aberto {
   --ion-background-color:rgb(255, 240, 23);
   --ion-color: white;
}

.status-em-andamento {
  --ion-background-color: blue;
  --ion-color: white;
}

.status-concluido{
  --ion-background-color: green;
  --ion-color: white;
}
</style>
