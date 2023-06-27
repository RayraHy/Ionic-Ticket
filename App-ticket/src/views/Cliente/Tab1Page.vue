<template>
  <ion-page>
    <ion-content :fullscreen="true">
       <div class="card" v-if="Com">
        
          <ion-button class="sairbu" @click="Com = false">Adicionar</ion-button>
          <ion-list>
            <ion-item v-for="ticket in filteredTickets" :key="ticket">
              <br>
              Descrição do Ticket: {{ ticket.ds_descricao_ticket }}<br>
              Data de inicio: {{ ticket.dt_data_inicio }}<br>
              Gravidade: {{ ticket.ds_gravidade_ticket }}<br>
              Status: {{ ticket.ds_status_ticket }}<br>
              <br>
            </ion-item>
          </ion-list>
          
       </div>
       <div class="card" v-else>
        {{resposta}}
        <ion-button class="sairbu" @click="Com = true">X</ion-button><br>
        
          <ion-item>
            <ion-input label="Gravidade: " v-model="grav"/>
          </ion-item><br>
          <ion-item>
            <ion-input label="Descreva: " v-model="ds"/>
          </ion-item><br>


            <ion-datetime-button datetime="datetime"></ion-datetime-button>
            <ion-modal :keep-contents-mounted="true">
                <ion-datetime id="datetime" @ionChange="atualizarValores"></ion-datetime>
            </ion-modal><br>
            
            <ion-button @click="cadastrarReserva">Cadastrar</ion-button>
        
       </div>

     
    </ion-content>
  </ion-page>
</template>

<script lang="ts">
import { IonPage, IonHeader, IonToolbar, IonTitle, IonContent, IonModal, IonButton, IonItem, IonList, IonInput, IonDatetime, IonDatetimeButton} from '@ionic/vue';
import axios from 'axios';
import { mapGetters } from 'vuex';
import { ticket } from 'ionicons/icons';


export default {
  components: {
    IonContent, IonModal, IonPage, IonButton, IonItem, IonList, IonInput, IonDatetime, IonDatetimeButton
  },
  data() {
    return {
        Com: true,
        tickets: [],
        cliente: '',
        dt_data: '',
        ds: '',
        dt_hora: '',
        grav: '',
        status: 'Pendente',
        resposta: '',
    }
 },
  computed: {
    ...mapGetters(['getCliente']),
    filteredTickets() {
        this.cliente = this.getCliente
        return this.tickets.filter(ticket => ticket.cd_integrantes === this.cliente);
      }
    
  },
    mounted() {
          this.DadosPHP();
          window.history.replaceState({}, document.title, window.location.pathname);
        },
 methods: {
    Deslogar() {
      this.$router.push('/Login');
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
    cadastrarReserva() {
      const formData = new FormData();
      formData.append('cliente', this.cliente);
      formData.append('ds', this.ds);
      formData.append('data', this.dt_data);
      formData.append('grav', this.grav);
      formData.append('ds_status', this.ds_status);


      axios.post('http://localhost/Api-banco/Criarticket.php', formData)
        .then(response => {
          this.resposta = response.data.message;
          // Redirecionar para a página de visualização de reservas
        })
        .catch(error => {
          console.error(error);
        });
    },
    atualizarValores(event) {
        const dataHoraSelecionada = event.detail.value;
        this.dt_data = dataHoraSelecionada.split('T')[0];
        this.dt_hora = dataHoraSelecionada.split('T')[1];
    },
    },
 }
    
 

</script>

<style scoped>

.sairbu {
  padding-bottom: 20px;
  margin-left: 200px;
  margin-top: 20px;
}

.isteme {
    margin-bottom: 5px;
    margin-top: 5px;
    --background: #fcd0ca;
    

    --border-color: #fff;
    --border-style: dashed;
    --border-width: 2px;

    --border-radius: 20px;

    --ripple-color: purple;

    --detail-icon-color: white;
    --detail-icon-opacity: 1;
    --detail-icon-font-size: 20px;
  }

.card{
  margin-left: 20px;
  margin-right: 30px;
}
</style>
